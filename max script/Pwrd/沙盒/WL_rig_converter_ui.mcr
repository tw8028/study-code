macroScript WLRC
category:"TLMtools"
ButtonText:"Waste Land Rig Converter"
toolTip:"Waste Land Rig Converter"
(

/*
target 3dsmax files need to be :
1.from outsource team, rigged and all mesh have Skin modifier applied
2.Script will find all bones used by Skin modifier and convert them into flat structure rig(which wworks best in our engine)
3.replace bones in skin modifiers
4.reassgin saved out vertices weight info

*/
--reference to rollout
global RL_Output
global RL_RigConvert
global RL_Main_WL



global sceneHaveError = false


global arrayUsedBonesInCurrentScene = #() -- name list of all used bones


--don't know , don't care
global arr_skinMesh = #()
global arr_bones = #()
global arr_Bones = #()
global arr_Dummy = #()
global arr_newName = #()


--fields of skin vertices weights

--weight info for single vertex in skin modifier
struct vertexWeightInfo
(
	arrBonesID = #(),
	arrBonesName = #(),
	arrWeights = #()
)

-- struct to save all vertices weight info of 1 skinned mesh
struct MeshVerticesWeightInfos
(
	MeshName = "",
	allVerticesWeightInfo = #() --hold all vertices info of 1 skin modifier
)


global allMeshesVWI = #()


-- get value from UI
global isKeepSkinVerticesWeightInfo = false
global boneSize
global boneColor



global fileArray = #()
global listOfMaxFiles = #()
global hashListFinal = #()


log_file = ""
logStream


/** misc utility functions **/
fn fn_toLower  str = 
( 
	newStr = toLower str; 
	return newStr 
)

fn fn_removeSpaces myStr =
(
	local str_new = ""
	if ((filterstring myStr " ").count > 1) then
	(
		for i = 1 to ((filterstring myStr " ").count) do
		( 
			if i == 1 then str_new = (filterstring myStr " ")[i]
			else (str_new = (str_new + "_" + (filterstring myStr " ")[i]))
		 )
	) else (str_new = myStr)
	 return  str_new
)


fn CreateLog =
(
	timeStr = localtime as string

	case of 
	(
	(findstring timeStr "/" != undefined):
	(
		tmpStrArray = filterstring timeStr "/"
		tmpStrArray2 = filterstring tmpStrArray[3] " "
		tmpStrArray3 = filterstring tmpStrArray2[2] ":"
		timeStrMod = tmpStrArray[1] + "_" + tmpStrArray[2] + "_" + tmpStrArray2[1] + "_" + tmpStrArray3[1] + "_" + tmpStrArray3[2] + "_" + tmpStrArray3[3] 	
		timeStrMod2 = tmpStrArray[1] + "\\" + tmpStrArray[2] + "\\" + tmpStrArray2[1] + " " + tmpStrArray3[1] + ":" + tmpStrArray3[2] + ":" + tmpStrArray3[3] 
	)

	(findstring timeStr "/" == undefined):
	(
		tmpStrArray = filterstring timeStr "-"
		tmpStrArray2 = filterstring tmpStrArray[3] " "
		tmpStrArray3 = filterstring tmpStrArray2[2] ":"
		timeStrMod = tmpStrArray[1] + "_" + tmpStrArray[2] + "_" + tmpStrArray2[1] + "_" + tmpStrArray3[1] + "_" + tmpStrArray3[2] + "_" + tmpStrArray3[3] 	
		timeStrMod2 = tmpStrArray[1] + "\\" + tmpStrArray[2] + "\\" + tmpStrArray2[1] + " " + tmpStrArray3[1] + ":" + tmpStrArray3[2] + ":" + tmpStrArray3[3] 
	)
	)

	log_file = "G:\\" + timeStrMod + ".txt"
	logStream = createfile log_file
	format "\tLog :\n(%)\n\n" timeStrMod2 to:logStream
)




/*-- function of skin vertices weight process --*/

--collect all vertices weights info
fn collectSkinVerticesWeightInfo skinObj =
(	
	local _allVWI = #()
	
	local _vertexCount
	local _boneCount	
	
	_vertexCount = skinOps.GetNumberVertices skinObj
	_boneCount = skinOps.GetNumberBones skinObj
	
	-- print _boneCount --use this as Bone ID aka: bone_integer
	--print (skinOps.GetBoneName skinObj 1 1)
	--print (skinOps.GetBoneName skinObj 2 1)	
	
	--collect each vertex weight info , include: 1.used bone id 2.weight for each bone , 3 bone names
	for a in 1 to _vertexCount do
	(
		local _arrBonesID = #() --system bone index of bones used by current vertex
		local _arrBonesName = #() --bone names used by current vertex
		local _arrWeights = #() --weights of all bones used by current vertex
		
		--collect info of each vertex
		
		--get number of bones which effect current vertex
		numBonesOfVertex = skinOps.GetVertexWeightCount skinObj a
		
		for c in 1 to numBonesOfVertex do
		(
			--get id ��ǰ�����õ��Ĺ������б��еĵڼ���
			tempId = skinOps.GetVertexWeightBoneID skinObj a c
			-- print tempId
			append _arrBonesID tempId
			
			--get the name �õ��Ĺ���������
			strUsingBoneName = skinOps.GetBoneName skinObj tempId 1
			-- print strUsingBoneName
			append _arrBonesName strUsingBoneName
			
			--get the weight ��ǰ���㼰�����ڶ���ĵ�c��������Ȩ��
			tempWeight = skinOps.GetVertexWeight skinObj a c
			-- print tempWeight
			append _arrWeights tempWeight			
		)
		
		vwi = vertexWeightInfo arrBonesID:_arrBonesID arrBonesName:_arrBonesName arrWeights:_arrWeights
		
		append _allVWI vwi
		
		-- print _allVWI.count
		
		-- print "------------------- Process next vertex ----------------------"
	)			
	
	_allVWI--return vertices infos array
)

--assign Vertex weight info back to skin modifier
fn assignVerticesWeightInfo skinObj VertWeightInfos =
(
	if VertWeightInfos.count > 0 then
	(
		--skinOps.SetVertexWeights <Skin> <vertex_integer> \ ( <vertex_bone_integer> | <vertex_bone_array> ) \ ( <weight_float> | <weight_array> ) 
	
		_vertexCount = skinOps.GetNumberVertices skinObj
	
		for v in 1 to _vertexCount do
		(
			skinOps.SelectVertices skinObj v
			skinOps.resetSelectedVerts skinObj
			--use name to match ,becuz the order will be changed
			--get id array by bone names
			
			arrTargetBonesID = #()
			boneNames = for i=1 to (skinOps.GetNumberBones skinObj) collect (skinOps.GetBoneName skinObj i 0)
			
			for b in VertWeightInfos[v].arrBonesName do
			(
				--target rig bones all use lower case name
				tempStr = toLower b --new generated flat structure bone names all in lower case
				nameStr = fn_removeSpaces tempStr --original bone name have space!
				boneIndex = findItem boneNames nameStr
				append arrTargetBonesID boneIndex
			)
			
			skinOps.SetVertexWeights skinObj v arrTargetBonesID VertWeightInfos[v].arrWeights
		)
	)
)


/* function of skin vertices weight process  end-*/



/* check if current scena is okay to process */
fn CheckNameDuplication = 
(
	--todo check if scene have objects with same name
	allnames = for o in objects collect o.name

	tempArray = #()

	for i=1 to allnames.count do
	(
		if finditem tempArray allnames[i] ==0 then
		(
			append tempArray allnames[i]
		)
		else
		(
			tempMsg = "found name duplication " + allnames[i]
			-- print tempMsg
			
			messagebox tempMsg
		)
	)
)


fn CheckSkinModifier =
(
	-- skin modifier can not have helper and other non bones object inlcuded
	foundMeshes = for o in objects where ( classof o == PolyMeshObject ) collect o
	foundSkinnedMeshes = for s in foundMeshes where ( classof s.modifiers[1] == Skin) collect s
	
	if(foundSkinnedMeshes.count >0 ) then
	(
		-- print foundSkinnedMeshes.count
		
		for m in foundSkinnedMeshes do
		(
			select m
			--all skinOps need to select skin modifier and switch to Modify mode
			SetCommandPanelTaskMode mode:#modify
			
			usedBones = for i=1 to (skinOps.GetNumberBones m.modifiers[1]) collect (skinOps.GetBoneName m.modifiers[1] i 0)
			-- print usedBones
			
			for b in usedBones do
			(
				obj = getnodebyname b
				
				if(classof obj == BoneGeometry or classof obj == Biped_Object) then
				(
					
				)
				else
				(
					errorMsg = "found  non bone object in skin modifier : " + b
					-- print errorMsg
					messagebox errorMsg
					sceneHaveError = false
				)
			)
		)
	)	
)



fn CheckSkinnedMeshInScene =
(
	foundMeshes = for o in objects where ( classof o == PolyMeshObject ) collect o
	foundSkinnedMeshes = for s in foundMeshes where ( classof s.modifiers[1] == Skin) collect s	
	-- print foundSkinnedMeshes.count
	-- print foundSkinnedMeshes
	
	if(foundSkinnedMeshes.count == 0) then
	(
		sceneHaveError = true
		RL_Main_WL.theSubRollout.RL_Output.dnc_label2.text = "no skinned mesh found in current scene"
		messagebox "no skinned mesh found in current scene"
	)	
)


/* return all bone names used by skinned mesh in current scene */
fn CollectBonesFromSkinnedMesh = 
(
	
	free arrayUsedBonesInCurrentScene
	
	--all skinOps need to select skin modifier and switch to Modify mode
	SetCommandPanelTaskMode mode:#modify
	
	arrayUsedBoneNames = #()
	
	foundMeshes = for o in objects where ( classof o == PolyMeshObject ) collect o
	foundSkinnedMeshes = for s in foundMeshes where ( classof s.modifiers[1] == Skin) collect s	
	
	for m in foundSkinnedMeshes do
	(
		select m
		boneNames = for i=1 to (skinOps.GetNumberBones  m.modifiers[1]) collect (skinOps.GetBoneName m.modifiers[1] i 0)
		join arrayUsedBoneNames boneNames
	)
	
	arrayUsedBonesInCurrentScene = arrayUsedBoneNames
)


fn GetAllSkinnedMeshInScene = 
(
	foundMeshes = for o in objects where ( classof o == PolyMeshObject ) collect o
	foundSkinnedMeshes = for s in foundMeshes where ( classof s.modifiers[1] == Skin) collect s
)


fn SelectUsedBonesInScene = 
(
	boneSelection = #()
	for n in arrayUsedBonesInCurrentScene do
	(
		for o in objects where (o.name == n) do
		(
			append boneSelection o
		)
	)
	
	select boneSelection
)

/** function to replace bones in skin modifers with new bones **/

--1.get all bones' name
--2.remove old bones
--3.add mew bones(use lower case name)

--only process one skin modifier once
fn ReplaceBonesInSkinModifier MeshObj =
(
	select MeshObj
	--all skinOps need to select skin modifier and switch to Modify mode
	SetCommandPanelTaskMode mode:#modify
	
	--get used boneNames
	boneNames = for i=1 to (skinOps.GetNumberBones MeshObj.modifiers[1]) collect (skinOps.GetBoneName MeshObj.modifiers[1] i 0)
	
	-- print boneNames
	
	--remove current bone
	
	-- This is the funny part.  If we delete a bone, all the items in the
	-- skinops bone array move up by one, so we don't need to
	-- change the bone index!!
	
	deleteModifier MeshObj 1
	
	addModifier MeshObj (skin())
	
	-- very funny autodesk!
	
	-- print "all bones removed"
	
	--add new bones
	for n in boneNames do
	(
		--skinOps.addbone <Skin> <Bone_node> <Update_integer> 
		tempStr = fn_toLower n
		tempStr = fn_removeSpaces tempStr
		for o in objects where (o.name == tempStr) do
		(
			skinOps.addbone MeshObj.modifiers[1] o 0 --update later
		)
	)	
)

fn BakeTransform sourceObj targetObj strFrame endFrame subStep forceUpdate = 
(
	animate on
	(
		for t = strFrame to endFrame by subStep do
		(
			if forceUpdate do sliderTime = t
			at time t
			(
				targetObj.transform = sourceObj.transform
			)
		)
	)
)

fn RigConvertAndApplySkinByCalc = 
(
	/* we need to save out skin vertices weight infos before replace bones! */
	if(isKeepSkinVerticesWeightInfo) then
	(
		-- print "extracting skin vertices weight infos"
		free allMeshesVWI
		
		allSkinnedMeshesInScene = #()
		allSkinnedMeshesInScene = GetAllSkinnedMeshInScene()
		
		for m in allSkinnedMeshesInScene do
		(
			select m
			
			--all skinOps need to select skin modifier and switch to Modify mode
			SetCommandPanelTaskMode mode:#modify
			
			tempVWI = collectSkinVerticesWeightInfo m.modifiers[1]
			tempMeshVWIObj = MeshVerticesWeightInfos MeshName:m.name allVerticesWeightInfo:tempVWI
			append allMeshesVWI tempMeshVWIObj
		)
		
		tempStr = "extract skin vertices weight info success : " + (allMeshesVWI.count as string)
		-- print tempStr
		
	)
	
	-- 2017.6.14 Zipo �������Ѿ���Сд�Ĺ������ܻ������������ ����ʱ����
	arrBone = for someObj in objects where (classof someObj == BoneGeometry or classof someObj == biped_Object or classof someObj == Dummy) collect someObj
	for aBone in arrBone do
	(
		newNametmp = fn_toLower (aBone.name as string)                                                                                                           
		newName = fn_removeSpaces newNameTmp
		if aBone.name == newName do
		(
			aBone.name = toUpper aBone.name
		)
	)
	
	--only execute when pass the check
	CollectBonesFromSkinnedMesh()
	-- print arrayUsedBonesInCurrentScene.count
	
	--we have all used bones name, now select them			
	SelectUsedBonesInScene()
	
	-- start convert rig
	/****  rig convert code ***/
	free arr_Dummy
	free arr_Bones
	free arr_newName
	free arr_skinMesh
	free arr_bones
	
	arr_Bones = for a in selection collect a
	rootBone = undefined
	
	if (arr_Bones.count > 0) do
	(
		arr_allObjNames = for someObj in objects where (classof someObj == BoneGeometry or classof someObj == biped_Object or classof someObj == Dummy ) collect (someObj.name as string)
		arr_boneNames = for x in arr_Bones collect x.name
		
		--  2017.5.22 Zipo "root"���ͱ����Point  --
		arrRootBone = for someObj in objects where (classof someObj == Point and tolower someObj.name == "root") collect someObj
		if (arrRootBone.Count == 0) then
		(
			obj_spine1	= undefined
			obj_neck	= undefined
			obj_neck1	= undefined
			obj_head	= undefined
			for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Spine1")) do obj_spine1 = a
			for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Neck1")) do obj_neck1 = a
			for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Head")) do obj_head = a
			for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Neck")) do obj_neck = a
			--rootNewBone = bonesys.createbone [0,0,0] [1,0,0] [0,0,1]
			--rootNewBone.length = 10
			--rootNewBone.width = 10
			--rootNewBone.height = 10
			--rootNewBone.name = rootBone.name + str_prefix
			--rootNewBone.wirecolor = clr_bone
			
			rootDummy = Point()
			rootDummy.position = [0,0,0]
			rootDummy.name = "root"
			
			for d in arr_Bones where (((d.children.count == 0 and classof d == dummy ) == false ) and (classof d == biped_object or classof d == BoneGeometry) and ( findstring d.name "Footsteps") == undefined ) do
			(
				newNametmp = fn_toLower (d.name as string)                                                                                                           
				newName = fn_removeSpaces newNameTmp
				append arr_newName newName
				
				if ((finditem arr_allObjNames newName) == 0) then
				(
					obj = bonesys.createbone [0,0,0] [1,0,0] [0,0,1]
					-- get size and color from ui
					obj.width = boneSize
					obj.height = boneSize
					obj.wirecolor = boneColor
					
					if (classof d == bonegeometry) then 
					(
						obj.length = d.length
					)
					else if( d.children != undefined ) then
					(
						obj.length = case d.children.count of
						(
							0: 5
							1: abs(distance d.transform.row4  d.children[1].transform.row4)
							default: 5
						)
						
					)
					else
					(
						obj.length = 5
					)
					
					if (classof d == biped_object and d.name == "Bip001 Spine") then
					(
						case ( obj_spine1 == undefined ) of
						(
							true : obj.length = abs(distance d.transform.row4  obj_neck.transform.row4)
						false : obj.length = abs(distance d.transform.row4  obj_spine1.transform.row4)
						)
					)
					 
					if (classof d == biped_object and d.name == "Bip001 Neck") then
					(
						case ( obj_neck1 == undefined ) of
						(
							true : obj.length = abs(distance d.transform.row4  obj_head.transform.row4)
							false : obj.length = abs(distance d.transform.row4  obj_neck1.transform.row4)
						)
					)
					
					append arr_Dummy obj
					
					
					
					
					--obj.transform.controller = d.transform.controller
					  
					  
					BakeTransform d obj animationRange.start animationRange.end 1 false
					obj.parent = rootDummy
				 )
				 else
				 (
					 --this will cause bones rename fail later
					 print "warinning found objects with same name in scene :" + maxFilePath + maxFileName
					 print newName
				 )
			 )
			 
			--if not match, rename won't work
			-- print arr_newName.count
			-- print arr_Dummy.count 
			
			--rename bones
			
			if arr_newName.count > 0 and arr_Dummy.count > 0 and arr_Dummy.count == arr_newName.count do
			( for i = 1 to arr_Dummy.count do arr_Dummy[i].name = arr_newName[i] )
			
		for a in arr_Bones do 
		(
			if (a.name == "bip001_pelvis" and a.parent != undefined) != true then
				hide a
		 )
		 
		 --check name again?
		 if arr_Dummy.count > 0 then
		 (
			msg = ""
			for a in arr_Dummy do
			(
				if ((tolower a.name[1] != a.name[1]) or (findstring a.name "bip001_" != 1 )) and (findstring a.name "bone" != 1 ) then
				( msg = msg + a.name + "\n")
			)
			 if msg != "" then 
			 (
				 msg += "\nCaution:Wrong Naming Convention!\n";
				 messagebox msg
			  )
		  )
			
		)
		else
		(
			RL_Main_WL.theSubRollout.RL_Output.dnc_label2.text = "There is a root object already."
		)
			
		--SchematicViews.open "My Schematic View"
	)
	
	/** replace bones in skin modifers with new generated bones **/
	
	-- before this need do a name check first! see if have name duplications in scene
	
	tempTgtSkinnedMeshes = GetAllSkinnedMeshInScene()
	for t in tempTgtSkinnedMeshes do
	(				
		tempMsg = "replace bones in object : " + t.name
		-- print tempMsg
		
		ReplaceBonesInSkinModifier t
		
		-- print "bone replacement is done "
	)			
	
	/*** skin modifier operation start here : assign skin info back to mesh */
	if(isKeepSkinVerticesWeightInfo) then
	(
		-- print "re-apply skin vertices weight infos"
		
		if(allMeshesVWI.count > 0) then
		(
			-- select each skinned mesh, then re-assign vertices weight infos
			targetSkinnedMeshes =  GetAllSkinnedMeshInScene()
			for m in targetSkinnedMeshes do
			(
				select m
				--all skinOps need to select skin modifier and switch to Modify mode
				SetCommandPanelTaskMode mode:#modify
				
				tempMsg = "re-apply vertices weights to : " + m.name
				-- print tempMsg
				
				-- check if the name is match
				for d in allMeshesVWI do
				(
					if(m.name == d.MeshName) then
					(
						assignVerticesWeightInfo m.modifiers[1] d.allVerticesWeightInfo
					)
				)
			)
		)
		else
		(
			print "no vertices weight info in cache, plz check"
		)
	)
)

fn GetAllUsedBone = 
(
	arrMesh = for i in objects where (classof i == PolyMeshObject) collect i
	arrSkinnedMesh = for i in arrMesh where (classof i.modifiers[1] == Skin) collect i
	if (arrSkinnedMesh.Count == 0) do
	(
		return #()
	)
	
	arrBoneNameForRetain = #()
	for aSkinnedMesh in arrSkinnedMesh do
	(
		select aSkinnedMesh
		SetCommandPanelTaskMode mode:#modify
		
		meshSkin		= aSkinnedMesh.modifiers[#Skin]
		nVertexCount	= skinOps.GetNumberVertices meshSkin
		for i = 1 to nVertexCount do
		(
			nBoneCount = skinOps.GetVertexWeightCount meshSkin i
			for j = 1 to nBoneCount do
			(
				fWeight = skinOps.GetVertexWeight meshSkin i j
				nBoneIndex = skinOps.GetVertexWeightBoneID meshSkin i j
				strBoneName = skinOps.GetBoneName meshSkin nBoneIndex 1
				
				if fWeight > 0.0001 do
				(
					appendIfUnique arrBoneNameForRetain strBoneName
				)
			)
		)
	)
	
	return arrBoneNameForRetain
)

fn GetSelectedBone bNewBone = 
(
	arrSelectedBone	= #()
	if bNewBone then
	(
		arrSelectedBone = for someObj in objects where ((someObj.name == tolower someObj.name) and (classof someObj == BoneGeometry or classof someObj == Point) and someObj.ishidden == false) collect someObj
	)
	else
	(
		arrBoneLeaves = #()
		arrBone = for someObj in objects where (classof someObj == BoneGeometry or classof someObj == biped_Object or classof someObj == Dummy) collect someObj
		for aBone in arrBone do
		(
			nChildCount = aBone.children.count
			if nChildCount != 0 do
			(
				-- �й��������ģ�͵���� ����ͬѧ���ڹ�������Ҹ�ģ�Ϳ�Ч��
				bNeedContinue = false
				for i = 1 to nChildCount do
				(
					aChildren = aBone.children[i]
					if (classof aChildren == BoneGeometry or classof aChildren == biped_Object or classof aChildren == Dummy) do
					(
						bNeedContinue = true
						break
					)
				)
				
				if bNeedContinue do
				(
					continue
				)
			)
			
			append arrBoneLeaves aBone
		)
		
		arrUsedBone = GetAllUsedBone()
		for aBone in arrBoneLeaves do
		(
			bStartSelect = false
			while aBone != undefined do
			(
				if (finditem arrUsedBone aBone.name != 0 or (findstring (tolower aBone.name) "weapon" != undefined) or (findstring (tolower aBone.name) "wepon" != undefined)) do
				(
					bStartSelect = true
				)
				
				if bStartSelect do
				(
					appendifunique arrSelectedBone aBone
				)
				
				aBone = aBone.parent
			)
		)
	)
	
	return arrSelectedBone
)

/*******************************************************************************
<DOC> toggle an UI checkbox's checked state via UI messages/notifications
Arguments:
<int> hwnd:	HWND of the control
<int> state: checked state. 1 = check, 0 = uncheck
<skin modifier> curObj:	The selected skin modifier (must be in modify panel)
Return:
<ok> should check/uncheck the checkbox and have its change effected
*******************************************************************************/
fn setUICheckboxState hwnd state =
(
	local BN_CLICKED = 0 -- clicky message ID
	local BM_SETCHECK = 241 -- checkbutton toggle message ID
	local WM_COMMAND = 273 -- windows command message
	
	local parent = UIAccessor.getParentWindow hwnd
	local id = UIAccessor.getWindowResourceID hwnd
	windows.sendMessage hwnd BM_SETCHECK state 0
	windows.sendMessage parent WM_COMMAND ((bit.shift BN_CLICKED 16) + id) hwnd
	OK
)

/*******************************************************************************
<DOC> Manipulate the Load Envelopes dialog via the UI Accessor.
Arguments:
<int> removeIncomingPrefix:	Corresponds to the "Remove Incoming Prefix" checkbox. 0 is false, 1 is true
<int> removeCurrentPrefix:	Corresponds to the "Remove Current Prefix" checkbox. 0 is false, 1 is true
Return:
<bool> true (needed for DialogMonitorOps)
*******************************************************************************/
--local BM_SETCHECK = 241
fn confirmLoadEnvelopes =
(
	local hwnd = dialogMonitorOps.getWindowHandle()
	if (uiAccessor.getWindowText hwnd == "Load Envelopes") then
	(
		local children = windows.getChildrenHWND hwnd
		for child in children do
		(
			if (child[5] == "Remove Incoming Prefix") then
			(
				setUICheckboxState child[1] 1
			)
			else if (child[5] == "Remove Current Prefix") then
			(
				setUICheckboxState child[1] 1
			)
		)
		
		UIAccessor.PressButtonByName hwnd "Match by Name"
		-- forceCompleteRedraw()
		UIAccessor.PressButtonByName hwnd "OK"
		--UIAccessor.PressDefaultButton()
	)
	true
)

fn ClearEnvelope = 
(
	arrMesh = for i in objects where (classof i == PolyMeshObject) collect i
	arrSkinnedMesh = for i in arrMesh where (classof i.modifiers[1] == Skin) collect i
	if (arrSkinnedMesh.Count == 0) do
	(
		return 0
	)
	
	arrBoneNameForDelete = #()
	for aSkinnedMesh in arrSkinnedMesh do
	(
		select aSkinnedMesh
		SetCommandPanelTaskMode mode:#modify
		
		meshSkin				= aSkinnedMesh.modifiers[#Skin]
		nVertexCount			= skinOps.GetNumberVertices meshSkin
		arrBoneNameForRetain 	= #()
		for i = 1 to nVertexCount do
		(
			nBoneCount = skinOps.GetVertexWeightCount meshSkin i
			for j = 1 to nBoneCount do
			(
				fWeight = skinOps.GetVertexWeight meshSkin i j
				if (fWeight > 0.0001) do
				(
					nBoneIndex = skinOps.GetVertexWeightBoneID meshSkin i j
					strBoneName = skinOps.GetBoneName meshSkin nBoneIndex 1
					appendIfUnique arrBoneNameForRetain strBoneName
				)
			)
		)
		
		i = 1
		nBoneCount = skinOps.GetNumberBones meshSkin
		while (i <= nBoneCount) do
		(
			strBoneName = skinOps.GetBoneName meshSkin i 1
			if (finditem arrBoneNameForRetain strBoneName) != 0 then
			(
				i += 1
			)
			else
			(
				skinOps.removebone meshSkin i
				
				i = 1
				nBoneCount = skinOps.GetNumberBones meshSkin
				appendifunique arrBoneNameForDelete strBoneName
			)
		)
	)
)

fn loadEnvelope theSkin envFile =
(
	DialogMonitorOps.Enabled = true	--DialogMonitorOps.Enabled = false
	DialogMonitorOps.RegisterNotification confirmLoadEnvelopes id:#pressSkinOK
	skinOps.LoadEnvelope theSkin envFile
	DialogMonitorOps.unRegisterNotification id:#pressSkinOK
	DialogMonitorOps.Enabled = false
	ok
)

fn RigConvertAndApplySkinByMax = 
(
	-- ����Ƥģ�͵Ĺ�����Ϣ����Ϊ��Ӧ��env�ļ�
	arrSkinnedMesh = for i in objects where (classof i == PolyMeshObject) collect i
	for aSkinnedMesh in arrSkinnedMesh do
	(
		-- ɾ��env�ļ�
		strEnvFilePath = "d:\\" + aSkinnedMesh.name + ".env"
		if doesfileexist strEnvFilePath do
		(
			deletefile strEnvFilePath
		)
		
		select aSkinnedMesh
		
		SetCommandPanelTaskMode mode:#modify
		
		-- ģ�ͱ�����Ȩ��
		if findstring maxfilename "@" == undefined do
		(
			aSkinnedMesh.modifiers[#Skin].filter_vertices = true
			nNum = skinops.getnumbervertices aSkinnedMesh.modifiers[#Skin]
			skinops.selectvertices aSkinnedMesh.modifiers[#Skin] #{1..nNum}
			skinOps.bakeSelectedVerts aSkinnedMesh.modifiers[#Skin]
		)
		
		-- �ӷ�����ɾ��û��Ȩ�صĹ���
		ClearEnvelope()
		
		-- ���������Ϣ��env�ļ�
		skinOps.SaveEnvelope aSkinnedMesh.modifiers[#Skin] strEnvFilePath
	)
	
	-- �ռ��ɹ���
	arr_Bones = GetSelectedBone false
	select arr_Bones
	
	-- ֻ����������Ƥ�Ĺ���
	arrBoneNameInEnv = #()
	for aSkinnedMesh in arrSkinnedMesh do
	(
		select aSkinnedMesh
		SetCommandPanelTaskMode mode:#modify
		
		meshSkin = aSkinnedMesh.modifiers[#Skin]
		nBoneCount = skinOps.GetNumberBones meshSkin
		for i = 1 to nBoneCount do
		(
			strBoneName = skinOps.GetBoneName meshSkin i 1
			appendifunique arrBoneNameInEnv strBoneName
		)
	)
	
	-- �����¹���
	arrRootBone = for someObj in objects where (classof someObj == Point and tolower someObj.name == "root") collect someObj
	if (arrRootBone.Count != 0) then
	(
		messagebox "�Ѿ�����root�ڵ㣬����"
		return 0
	)
	
	rootDummy = Point()
	rootDummy.position	= [0,0,0]
	rootDummy.name		= "root"
	
	obj_spine1	= undefined
	obj_neck	= undefined
	obj_neck1	= undefined
	obj_head	= undefined
	for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Spine1")) do obj_spine1 = a
	for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Neck1")) do obj_neck1 = a
	for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Head")) do obj_head = a
	for a in objects where (( classof a == biped_object ) and ((fn_removeSpaces a.name) == "Bip001_Neck")) do obj_neck = a
	
	arrNewBone = #()
	for d in arr_Bones where (((d.children.count == 0 and classof d == dummy ) == false ) and (classof d == biped_object or classof d == BoneGeometry) and ( findstring d.name "Footsteps") == undefined ) do
	(
		if (findItem arrBoneNameInEnv d.name) == 0 do
			continue
		
		obj = bonesys.createbone [0,0,0] [1,0,0] [0,0,1]
		-- get size and color from ui
		obj.width		= boneSize
		obj.height		= boneSize
		obj.wirecolor	= boneColor
		obj.name		= d.name
		obj.ishidden	= false
		
		if (classof d == bonegeometry) then 
		(
			obj.length = d.length
		)
		else if( d.children != undefined ) then
		(
			obj.length = case d.children.count of
			(
				0: 5
				1: abs(distance d.transform.row4  d.children[1].transform.row4)
				default: 5
			)
		)
		else
		(
			obj.length = 5
		)
		
		if (classof d == biped_object and d.name == "Bip001 Spine") then
		(
			case ( obj_spine1 == undefined ) of
			(
				true : obj.length = abs(distance d.transform.row4  obj_neck.transform.row4)
				false : obj.length = abs(distance d.transform.row4  obj_spine1.transform.row4)
			)
		)
		
		if (classof d == biped_object and d.name == "Bip001 Neck") then
		(
			case ( obj_neck1 == undefined ) of
			(
				true : obj.length = abs(distance d.transform.row4  obj_head.transform.row4)
				false : obj.length = abs(distance d.transform.row4  obj_neck1.transform.row4)
			)
		)
		
		BakeTransform d obj animationRange.start animationRange.end 1 false
		obj.parent = rootDummy
		append arrNewBone obj
	)
	
	-- �¹����滻�ɹ���������
	tempTgtSkinnedMeshes = GetAllSkinnedMeshInScene()
	for t in tempTgtSkinnedMeshes do
	(
		select t
		SetCommandPanelTaskMode mode:#modify
		
		--get used boneNames
		boneNames = for i=1 to (skinOps.GetNumberBones t.modifiers[1]) collect (skinOps.GetBoneName t.modifiers[1] i 0)
		
		--remove current bone
		-- This is the funny part.  If we delete a bone, all the items in the
		-- skinops bone array move up by one, so we don't need to
		-- change the bone index!!
		deleteModifier t 1
		addModifier t (skin())
		
		--add new bones
		for n in boneNames do
		(
			for o in arrNewBone where (o.name == n) do
			(
				skinOps.addbone t.modifiers[1] o 0 --update later
			)
		)
	)
	
	-- ���ؾɹ���
	hide arr_Bones
	
	-- ��ȡenv�ļ��Թ������¸�ֵ ɾ��env�ļ�
	for aSkinnedMesh in arrSkinnedMesh do
	(
		-- ɾ��env�ļ�
		strEnvFilePath = "d:\\" + aSkinnedMesh.name + ".env"
		if doesfileexist strEnvFilePath then
		(
			select aSkinnedMesh
			SetCommandPanelTaskMode mode:#modify
			
			loadEnvelope aSkinnedMesh.modifiers[#Skin] strEnvFilePath
			deletefile strEnvFilePath
		)
		else
		(
			messagebox ("env�ļ� " + strEnvFilePath + " ������")
		)
	)
	
	-- �����¹���������
	for aNewBone in arrNewBone do
	(
		newNametmp		= fn_toLower (aNewBone.name as string)                                                                                                           
		newName			= fn_removeSpaces newNameTmp
		aNewBone.name	= newName
	)
)

/** core process pipeline **/
-- nType: 1 max�ٷ���ʽ 2 �Լ�����
fn RigConvertAndApplySkin nType = 
(
	-- 2017.6.14 Zipo ȥ��Skinned Mesh�ϵĹؼ�֡
	arrSkinnedMesh = for i in objects where (classof i == PolyMeshObject) collect i
	for aSkinnedMesh in arrSkinnedMesh do
	(
		select aSkinnedMesh
		macros.run "Animation Tools" "DeleteSelectedAnimation"
	)
	clearselection()
	
	CheckSkinnedMeshInScene()
	
	if sceneHaveError then
	(
		sceneName = maxFilePath + maxFileName
		errorMsg = "Skip error scene : " + sceneName
		RL_Main_WL.theSubRollout.RL_Output.dnc_label2.text = errorMsg
		
		--meet error write log
		format errorMsg to:logStream
	)
	else
	(
		if nType == 1 then
		(
			RigConvertAndApplySkinByMax()
		)
		else
		(
			RigConvertAndApplySkinByCalc()
		)
	)
)

-- main ui rollout
rollout RL_RigConvert "Rig Converter" width:200 height:758
(
	GroupBox grp_builder "����ת��" pos:[7,8] width:184 height:136
	spinner spn_boneSize "�ߴ�" pos:[30,56] width:52 height:16 range:[1,25,10] scale:1
	colorPicker theColor "��ɫ" pos:[105,56] width:72 height:16 color:(color 30 140 195)
	button btn_checkCurrentScene "���" pos:[120,112] width:68 height:24
	button btn_convertRig "ת��rig" pos:[16,112] width:100 height:24
	checkbox chk_kepVertWeight "������ƤȨ��" pos:[16,88] width:168 height:16 checked:true
	GroupBox grp3 "��������" pos:[16,32] width:168 height:48
	radioButtons rdo_type "" pos:[25,255] width:100 height:46 labels:#("max�ٷ�", "�Լ�����")
	GroupBox grp4 "����ת��" pos:[8,280] width:184 height:180
	multiListBox filelist "" pos:[14,151] width:168 height:7
	button btn_clrList "����б�" pos:[20,365] width:160 height:17 enabled:true
	button btn_loadfiles "�����ļ�" pos:[20,388] width:160 height:17
	button btn_batchConvert "����ת��" pos:[20,411] width:160 height:17		
	button btn_batchCheck "�������" pos:[20,434] width:160 height:17
	GroupBox grp_Current "��ǰ����" pos:[8,638] width:184 height:110
	button btn_CreateRoot "����root�ڵ�" pos:[26,655] width:150 height:17
	button btn_CreateRide "����ride_01����" pos:[26,678] width:150 height:17
	button btn_ShowBoneNum "��ʾSkinnedMesh��������" pos:[26,701] width:150 height:17
	button btn_ClearEnvelope "�������÷���" pos:[26,724] width:150 height:17
	checkbox chk_Name "���ģ�� && ��������" pos:[18,297] width:160 height:17
	checkbox chk_Uniform "��Ƥ������Ŀ������һ����" pos:[18,319] width:160 height:17
	checkbox chk_Affect "��Ƥÿ����ֻ��������Ӱ��" pos:[18,341] width:160 height:17
	GroupBox grp26 "�������" pos:[8,469] width:184 height:164
	checkbox chk_CreateNewBone "�����¹���" pos:[25,516] width:160 height:17
	checkbox chk_CopyTexture "���ʱ����������ͼ" pos:[25,538] width:160 height:17
	checkbox chk_WithFolder "���������ļ���" pos:[25,560] width:160 height:17
	checkbox chk_ClearEnv "�������÷���" pos:[25,582] width:160 height:17	checked:true
	button btn_fbx "�������fbx" pos:[25,606] width:152 height:17
	edittext edt_Path "" pos:[22,491] width:134 height:17
	button btn_SetPath "..." pos:[161,491] width:16 height:17
	
	global g_strTxtPath = @"D:\result.txt"
	
	fn WriteToText arrResult = 
	(
		sw		= undefined
		File	= dotnetclass "System.IO.File"
		
		if doesfileexist g_strTxtPath then
		(
			FileMode = dotnetclass "System.IO.FileMode"
			fs = File.Open g_strTxtPath FileMode.Append
			sw = dotnetobject "System.IO.StreamWriter" fs
		)
		else
		(
			sw = File.CreateText g_strTxtPath
		)
		
		for strResult in arrResult do
		(
			sw.WriteLine strResult
		)
		sw.Close()
	)
	
	fn CheckOneModelName aModel = 
	(
		strName = aModel.name
		arrNamePart = filterstring strName "_"
		if (arrNamePart.Count != 2) do
		(
			return false
		)
		
		if arrNamePart[1].Count != 4 do
		(
			return false
		)
		
		if (arrNamePart[1] as integer) == undefined do
		(
			return false
		)
		
		if (arrNamePart[2]	!= "boss"		and \
			arrNamePart[2]	!= "monster" 	and \
			arrNamePart[2]	!= "npc"		and \
			arrNamePart[2]	!= "pet"		and \
			arrNamePart[2]	!= "player") do
		(
			return false
		)
		
		return true
	)
	
	fn ConvertBoneName strBoneName = 
	(
		arrNamePart = filterstring strBoneName " "
		strResult = ""
		for i = 1 to arrNamePart.Count - 1 do
		(
			strResult += (arrNamePart[i] + "_")
		)
		strResult += arrNamePart[arrNamePart.Count]
		
		return (tolower strResult)
	)
	
	fn CheckModelAndBoneName = 
	(
		arrResult = #()
		
		-- model --
		arrMeshObject = for i in objects where (classof i == PolyMeshObject) collect i
		for aMeshObject in arrMeshObject do
		(
			bRight = CheckOneModelName aMeshObject
			if not bRight do
			(
				append arrResult aMeshObject.name
			)
		)
		
		-- bone --
		arr_allObjNames	= for someObj in objects where (classof someObj == BoneGeometry or classof someObj == biped_Object or classof someObj == Dummy ) collect someObj
		arrBoneName		= for x in arr_allObjNames collect x.name
		arrKey		= #()
		arrValue	= #()
		for strBoneName in arrBoneName do
		(
			strKey		= ConvertBoneName strBoneName
			strValue	= strBoneName
			
			bFind = false
			for i = 1 to arrKey.Count do
			(
				if arrKey[i] == strKey do
				(
					append arrValue[i] strValue
					bFind = true
					break
				)
			)
			
			if not bFind do
			(
				append arrKey strKey
				append arrValue #(strKey)
			)
		)
		
		for i = 1 to arrValue.Count do
		(
			if arrValue[i].Count > 1 do
			(
				join arrResult arrValue[i]
			)
		)
		
		return arrResult
	)
	
	fn CheckVertexBoneAffect = 
	(
		arrMesh			= for i in objects where (classof i == PolyMeshObject) collect i
		arrSkinnedMesh	= for i in arrMesh where (classof i.modifiers[1] == Skin) collect i
		
		arrResult = #()
		for aSkinnedMesh in arrSkinnedMesh do
		(
			select aSkinnedMesh
			SetCommandPanelTaskMode mode:#modify
			
			meshSkin				= aSkinnedMesh.modifiers[#Skin]
			nVertexCount			= skinOps.GetNumberVertices meshSkin
			arrBoneNameForRetain	= #()
			for i = 1 to nVertexCount do
			(
				nBoneCount = skinOps.GetVertexWeightCount meshSkin i
				if (nBoneCount > 2) do
				(
					append arrResult (aSkinnedMesh.name + "�ĵ�" + i as string + "������")
				)
			)
		)
		
		return arrResult
	)
	
	fn GetBoneNameForOneFile strFilePath = 
	(
		loadMaxFile strFilePath quiet:true
		
		arrMesh = for i in objects where (classof i == PolyMeshObject) collect i
		arrSkinnedMesh = for i in arrMesh where (classof i.modifiers[1] == Skin) collect i
		
		arrBoneName = #()
		for aSkinnedMesh in arrSkinnedMesh do
		(
			select aSkinnedMesh
			SetCommandPanelTaskMode mode:#modify
			
			nBoneCount = skinops.GetNumberBones aSkinnedMesh.modifiers[#skin]
			for i = 1 to nBoneCount do
			(
				strBoneName = skinOps.GetBoneName aSkinnedMesh.modifiers[#skin] i 1
				append arrBoneName strBoneName
			)
		)
		
		sort arrBoneName
		return arrBoneName
	)
	
	fn ExportFbx strFilePath strOutputPath bCopyTexture bCreateNewBone bOutputWithFolder bClearEnv = 
	(
		loadMaxFile strFilePath quiet:true
		
		-- 1. ��ʾ��������
		unhide objects
		hideByCategory.none()
		
		-- �������÷���
		if bClearEnv do
		(
			ClearEnvelope()
		)
		
		-- �����¹���
		if bCreateNewBone then
		(
			arrBone = for someObj in objects where (classof someObj == BoneGeometry or classof someObj == biped_Object or classof someObj == Dummy) collect someObj
			isKeepSkinVerticesWeightInfo = chk_kepVertWeight.checked
			boneSize	= spn_boneSize.value
			boneColor	= theColor.color
			RigConvertAndApplySkin rdo_type.state
			hide arrBone
		)
		else	-- �ɹ���ϵͳ����������û�в�����Ƥ ֻ���丸���������ӹ�ϵ Ҳ��Ҫ�������� ������Ҫ�������������Ķ���
		(
			-- ���������Ҫ�����Ĺ���
			arrAllOldBone = GetSelectedBone false
			arrOldBone = for i in arrAllOldBone where classof i == BoneGeometry collect i
			
			-- ������в�����Ƥ�Ĺ���
			arrOldBoneName	= #()
			arrMesh			= for i in objects where (classof i == PolyMeshObject) collect i
			arrSkinnedMesh	= for i in arrMesh where (classof i.modifiers[1] == Skin) collect i
			for aSkinnedMesh in arrSkinnedMesh do
			(
				select aSkinnedMesh
				SetCommandPanelTaskMode mode:#modify
				
				meshSkin	= aSkinnedMesh.modifiers[#Skin]
				nBoneCount	= skinOps.GetNumberBones meshSkin
				for i = 1 to nBoneCount do
				(
					strBoneName	= skinOps.GetBoneName meshSkin i 1
					appendIfUnique arrOldBoneName strBoneName
				)
			)
			
			-- û�в�����Ƥ����Ҫ�����Ĺ���
			arrTargetBone = #()
			for aOldBone in arrOldBone do
			(
				bNeedAdd = true
				for strOldBoneName in arrOldBoneName do
				(
					if aOldBone.name == strOldBoneName do
					(
						bNeedAdd = false
						break
					)
				)
				
				if bNeedAdd do
				(
					append arrTargetBone aOldBone
				)
			)
			
			-- ����
			for aBone in arrTargetBone do
			(
				addNewKey aBone.transform.controller animationRange.start
				addNewKey aBone.transform.controller animationRange.end
			)
		)
		
		-- 2. ѡ�б���Ƥ��ģ�ͺͲ�����Ƥ�Ĺ���
		arrTarget = #()
		
		arrMesh = for i in objects where (classof i == PolyMeshObject) collect i
		arrSkinnedMesh = for i in arrMesh where (classof i.modifiers[1] == Skin) collect i
		for aSkinnedMesh in arrSkinnedMesh do
		(
			select aSkinnedMesh
			SetCommandPanelTaskMode mode:#modify
			
			if aSkinnedMesh.modifiers[#skin] == undefined do
			(
				continue
			)
			
			nBoneCount = skinops.GetNumberBones aSkinnedMesh.modifiers[#skin]
			if nBoneCount == 0 do
			(
				continue
			)
			
			append arrTarget aSkinnedMesh
		)
		
		-- ��Ҷ�ӽڵ㿪ʼ��������
		arrSelectedBone = GetSelectedBone bCreateNewBone
		join arrTarget arrSelectedBone
		
		-- ride_01û����ƤҲ��Ҫ����
		arrRide = for aObject in objects where (classof aObject == BoneGeometry and aObject.name == "ride_01") collect aObject
		if arrRide.count > 1 do
		(
			print ("����" + maxfilename + "���ڶ��ride_01������(��Ȼ���˵���)")
		)
		if arrRide.count > 0 do
		(
			join arrTarget arrRide
		)
		select arrTarget
		
		-- 3. �Ĺ�������
		for aSelectedBone in arrSelectedBone do
		(
			aSelectedBone.name = ConvertBoneName aSelectedBone.name
		)
		
		-- 4. ������֡
		arrBone = for someObj in objects where (classof someObj == BoneGeometry or classof someObj == biped_Object) collect someObj
		for aBone in arrBone do
		(
			deleteTime aBone.transform.controller 0 animationrange.start
			deleteTime aBone.transform.controller animationrange.end 1000
		)
		
		-- 5. ����
		strFbxPath		= ""
		arrFbxNamePart	= filterstring maxfilename "."
		strMaxFileName	= (filterstring arrFbxNamePart[1] "@")[1]
		arrFileNamePart	= filterstring strMaxFileName "_"
		if (isSpace strOutputPath) or (strOutputPath == "") then
		(
			strFbxPath = maxfilepath + arrFbxNamePart[1] + ".fbx"
		)
		else
		(
			if bOutputWithFolder then
			(
				strOutputPath = trimright strOutputPath "\\" + "\\"
				if (arrFileNamePart.count > 1) do
				(
					strOutputPath = strOutputPath + arrFileNamePart[2] + "\\"
					makedir strOutputPath
				)
				
				strOutputPath = strOutputPath + strMaxFileName + "\\"
				makedir strOutputPath
				
				strFbxPath = strOutputPath + arrFbxNamePart[1] + ".fbx"
			)
			else
			(
				strOutputPath	= trimright strOutputPath "\\" + "\\"
				strFbxPath		= strOutputPath + arrFbxNamePart[1] + ".fbx"
			)
		)
		
		-- print arrTarget
		-- 2017.8.28 Zipo mark ֻ��ѡ��"bake animation"(����Ŀ�ʼ�ͽ���֡�����Զ�����Ϊ�͹�����һ�� ���Բ�����������) weapon_r������link�Ż������� ����ԭ��δ֪
		FBXExporterSetParam "BakeAnimation" true
		exportfile strFbxPath #noPrompt selectedOnly:true using:FBXEXP
		
		-- 6. ����������ͼ
		if bCopyTexture do
		(
			strSourcePath = maxfilepath + "texture"
			if doesfileexist strSourcePath do
			(
				Directory		= dotnetclass "System.IO.Directory"
				SearchOption	= dotnetclass "System.IO.SearchOption"
				arrTexture		= Directory.GetFiles strSourcePath "*.*" SearchOption.AllDirectories
				
				strFolderPath = strOutputPath + "texture"
				makedir strFolderPath
				
				for strTexture in arrTexture do
				(
					strFileName = filenameFromPath strTexture
					copyfile strTexture (strFolderPath + "\\" + strFileName)
				)
			)
		)
	)
	
	on btn_checkCurrentScene pressed do
	(
		CheckNameDuplication()
		CheckSkinModifier()
		CheckSkinnedMeshInScene()
		
		arrResult = #()
		if chk_Name.checked do
		(
			arrNameResult = CheckModelAndBoneName()
			join arrResult arrNameResult
		)
		
		if chk_Affect.checked do
		(
			arrVertexResult = CheckVertexBoneAffect()
			join arrResult arrVertexResult
		)
		
		if arrResult.Count > 0 do
		(
			WriteToText arrResult
			openfile g_strTxtPath
		)
	)
	
	on btn_convertRig pressed do
	(
		isKeepSkinVerticesWeightInfo = chk_kepVertWeight.checked
		boneSize = spn_boneSize.value
		boneSize = spn_boneSize.value
		boneColor = theColor.color
		RigConvertAndApplySkin rdo_type.state
	)
	
	on btn_clrList pressed do
	(
		free listOfMaxFiles
		fileList.items = listOfMaxFiles
	)
	
	on btn_loadfiles pressed do
	(
		free fileArray
		theDialog = dotNetObject "System.Windows.Forms.OpenFileDialog" --create a OpenFileDialog 
		theDialog.title = "PLEASE Select One Or More Files" --set the title
		theDialog.Multiselect = true --allow multiple files to be selected
		theDialog.Filter = "MAX Files (*.max)|*.max|All Files (*.*)|*.*" --specify the filter
		theDialog.FilterIndex = 2 --set the filter drop-down list to All Files
		result = theDialog.showDialog() --display the dialog, get result into variable
		result.ToString() --when closed, convert the result to string
		result.Equals result.OK --returns TRUE if OK was pressed, FALSE otherwise
		result.Equals result.Cancel --returns TRUE if Cancel was pressed, FALSE otherwise
		join fileArray theDialog.fileNames --the selected filenames will be returned as an array
		for i in fileArray do appendifunique listOfMaxFiles (i as string)
		fileList.items = listOfMaxFiles
	)
	
	on btn_batchConvert pressed do
	(		
		if(listOfMaxFiles.count > 0) then
		(
			strMsg = (listOfMaxFiles.count as string) + " : files to process"
			-- print strMsg
			
			for i in listOfMaxFiles do
			(
				loadMaxFile i quiet:true
				
				sceneHaveError = false
				isKeepSkinVerticesWeightInfo = chk_kepVertWeight.checked
				
				-- 2017.5.22 Zipo �����ļ����ü̳���Ƥ��Ȩ�� --
				strMaxFileName = getFilenameFile i
				if (findstring strMaxFileName "@" != undefined) then
				(
					isKeepSkinVerticesWeightInfo = false
				)
				
				boneSize = spn_boneSize.value
				boneSize = spn_boneSize.value
				boneColor = theColor.color
				RigConvertAndApplySkin rdo_type.state
				
				if sceneHaveError == false then
				(
					tempMaxFileName = getFilenameFile maxfilename
					tempSavPath = maxfilepath + tempMaxFileName + "_converted.max"
				
					savemaxfile tempSavPath quiet:true	
				)
				
				-- print "$$$$$$$$$$$$$$$$$$$$$$$ one file finished $$$$$$$$$$$$$$$$$$$$$$$$$"
			)			
		)
	)
	
	on btn_batchCheck pressed do
	(
		CreateLog()
		
		if(listOfMaxFiles.count > 0) then
		(
			strMsg = (listOfMaxFiles.count as string) + " : files to check"
			-- print strMsg
			
			arrBoneUniformResult		= #()
			arrBoneNameUniformResult	= #()
			
			deletefile g_strTxtPath
			for i in listOfMaxFiles do
			(
				loadMaxFile i quiet:true
				
				CheckNameDuplication()
				CheckSkinModifier()
				CheckSkinnedMeshInScene()
				
				arrResult = #()
				strMaxFileName = getFilenameFile i
				append arrResult ("�ļ��� " + strMaxFileName)
				
				-- ģ�� & ��������
				if chk_Name.checked do
				(
					arrNameResult = CheckModelAndBoneName()
					join arrResult arrNameResult
				)
				
				-- ÿ����ֻ����������Ӱ��
				if chk_Affect.checked do
				(
					arrVertexResult = CheckVertexBoneAffect()
					join arrResult arrVertexResult
				)
				append arrResult ("\n")
				
				if arrResult.Count > 2 do
				(
					WriteToText arrResult
				)
				
				-- ��Ƥ������Ŀ������һ����
				if chk_Uniform.checked do
				(
					strFileName = getFilenameFile i
					arrBoneName = GetBoneNameForOneFile i
					
					append arrBoneUniformResult ("�ļ����� " + strFileName)
					append arrBoneUniformResult ("���������� " + (arrBoneName.Count as string))
					join arrBoneUniformResult arrBoneName
					append arrBoneNameUniformResult arrBoneName
					append arrBoneUniformResult "\n"
				)
				
				-- print "$$$$$$$$$$$$$$$$$$$$$$$ one file check done $$$$$$$$$$$$$$$$$$$$$$$$$"
			)
			
			-- �г���Ƥ������Ŀ������
			if chk_Uniform.checked do
			(
				WriteToText arrBoneUniformResult
			)
			
			-- �����Ƥ������Ŀ�������Ƿ�һ��
			bUniform = true
			if chk_Uniform.checked do
			(
				nCount = arrBoneNameUniformResult.Count
				for i = 1 to nCount do
				(
					if arrBoneNameUniformResult[i].Count != arrBoneNameUniformResult[1].Count do
					(
						bUniform = false
						break
					)
				)
				
				if bUniform do
				(
					nBoneCount = arrBoneNameUniformResult[1].Count
					for i = 1 to nCount do
					(
						for j = 1 to nBoneCount do
						(
							if arrBoneNameUniformResult[i][j] != arrBoneNameUniformResult[1][j] do
							(
								bUniform = false
								break
							)
						)
						
						if not bUniform do
						(
							break
						)
					)
				)
				
				if bUniform then
				(
					WriteToText #("��Ƥ������Ŀ�����Ƽ������һ��\n")
				)
				else
				(
					WriteToText #("��Ƥ������Ŀ�����Ƽ��������һ��\n")
				)
			)
			
			if doesfileexist g_strTxtPath do
			(
				shelllaunch "notepad.exe" g_strTxtPath
			)
		)
		
		close logStream
	)
	
	on btn_CreateRoot pressed do
	(
		root			= Point()
		root.position	= [0,0,0]
		root.name		= "root"
	)
	
	on btn_CreateRide pressed do
	(
		rideBone			= bonesys.createbone [0,0,0] [1,0,0] [0,0,1]
		rideBone.rotation	= eulerAngles 0 -90 0
		rideBone.name		= "ride_01"
	)
	
	on btn_ShowBoneNum pressed do
	(
		if selection.Count == 0 do
		(
			messagebox "����ѡ��һ��SkinnedMesh����"
			return 0
		)
		
		if selection.Count > 1 do
		(
			messagebox "ֻ��ѡ��һ������"
			return 0
		)
		
		selObj = selection[1]
		if classof selObj != PolyMeshObject do
		(
			messagebox "ѡ�е����岻�ǺϷ�����"
			return 0
		)
		
		if classof selObj.modifiers[1] != Skin do
		(
			messagebox "ѡ�е�ģ�͵�һ���޸�������Skin"
			return 0
		)
		
		nBoneCount = skinops.GetNumberBones selObj.modifiers[#skin]
		messagebox ("��ǰѡ�е�ģ�͹��� " + (nBoneCount as string) + " ������")
	)
	
	on btn_ClearEnvelope pressed do
	(
		ClearEnvelope()
		
		strInfo = ""
		if (arrBoneNameForDelete.Count != 0) then
		(
			strInfo = "������ϣ�ɾ�������¹�����\n\n"
			for i = 1 to arrBoneNameForDelete.Count do 
			(
				strInfo += (arrBoneNameForDelete[i] + "\n")
			)
		)
		else
		(
			strInfo = "û�з������õķ���"
		)
		messagebox strInfo
	)
	
	on btn_SetPath pressed do
	(
		folderBrowserDialog = dotnetobject "System.Windows.Forms.FolderBrowserDialog"
		folderBrowserDialog.Description = "��ѡ�񵼳��ļ���"
		
		dialogResult = dotnetclass "System.Windows.Forms.DialogResult"
		if (folderBrowserDialog.ShowDialog() == dialogResult.OK) do
		(
			edt_Path.text = trimright folderBrowserDialog.SelectedPath "\\" + "\\"
		)
	)
	
	on btn_fbx pressed do
	(
		if listOfMaxFiles.count == 0 do
		(
			messagebox "�������max�ļ�"
			return 0
		)
		
		for strMaxFile in listOfMaxFiles do
		(
			ExportFbx strMaxFile edt_Path.text chk_CopyTexture.checked chk_CreateNewBone.checked chk_WithFolder.checked chk_ClearEnv.checked
		)
		
		resetMaxFile #noprompt
	)
)


-- rollout to draw console info
rollout RL_Output "Message" width:210 height:120
(
	dotnetcontrol dnc_label2  "System.Windows.Forms.Label" width:258 height:60 pos:[0,0]
)



-- ui container
rollout RL_Main_WL "Waste Land Rig"
(
	subRollout theSubRollout pos:[-1,-1] width:210 height:750 align:#center
	on RL_Main_WL open do 
	(
		AddSubRollout RL_Main_WL.theSubRollout RL_RigConvert ;
		AddSubRollout RL_Main_WL.theSubRollout RL_Output; 
	 )
 )
 

createdialog RL_Main_WL width:210 height:740
 
 )