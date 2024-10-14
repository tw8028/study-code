----rebuild skeleton hierarchy and automatically skin the mesh,batch bake and export animation,yield some compulsory hints while do bone reconstructing---
macroScript DSR
category:"TLMtools"
ButtonText:"Chr Rebuilder"
toolTip:"ChrRebuilder"
icon:#("chrRebuilder",1)
( 
	global RL_Main_CR
	global RL_bal_dialog
	global int_bal = 3
	global fn_displayHUD
	local RL_DSR
	local RL_Toolkit
	local RL_Output
	local arr_Bones = #()
	local arr_Dummy = #()
	local arr_newName = #()
	local rootBone = undefined
	local boneSize = 10
	local boneColor = (color 65 125 190)
	local index_fullbody = 1
	local fn_toLower
	local fn_removeSpaces
	local fn_moveKeys
	local fileArray = #()
	local listOfMaxFiles = #()
	local hashListFinal = #()
	local objlist = #()
	local fn_bakeAnimation
	local str_exportPath = (getdir #export)
	local vec3_offset1
	local vec3_offset2
	local log_file = ""
	local bool_hasHitbone = false
	local logStream
	local fn_gw_head
	global arr_skinMesh = #()
	local arr_bones = #()
	local myFPS = 24
	
	include "$scripts\ablibs.ms"
		
	fn fn_toLower  str = 
	( 
		newStr = toLower str; 
		return newStr 
	)
	
	
	fn fn_addSkin =
	(
		for a in objects where classof a == Editable_poly do
		(	 
			isSkinMesh = true
			isBaseOrDigits = false
			for i = 2 to 5 do
			( if ( classof (execute a.name[i]) != integer ) then ( isSkinMesh = false )  )
			if  a.name[1] != "g" then isSkinMesh = false
			if ((findstring a.name "gbase_") == 1 ) then isSkinMesh = true
			if isSkinMesh == true then append arr_skinMesh a	
		 ) 
		for a in arr_skinMesh do ( addmodifier a (skin()) before:1 )	
	 )
	 
	 
	fn fn_addBone = 
	(
		if ( arr_skinMesh.count > 0 ) then 
		(
			for a in arr_skinMesh do
			(
				if(( skinOps.GetNumberBones a.modifiers[1]) == 0) then
				(
					if arr_dummy.count > 0 then
					(
						for b in arr_dummy do
						(
							if b.name != "root" then
							(
								setCommandPanelTaskMode mode:#modify
								select a
								skinOps.addbone a.modifiers[1] b  1
							)
							--skinOps.addbone a.modifiers[1] (getnodebyname b.name)  1
						 )
					 )	
				 )
			 )			
		)
	 )	
	
	fn fn_createCheckLog =
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
		
		log_file = (GetDir #export)+ "\\" + timeStrMod + ".txt"
		logStream = createfile log_file
		format "\tLog :\n(%)\n\n" timeStrMod2 to:logStream
	)
		
	fn fn_hasHitbone = 
	(
		bool_hasHitbone = false
		for a in objects where a.name == "hitbone" do bool_hasHitbone = true 
		return bool_hasHitbone
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
	
	fn fn_moveKeys = 
	(
		for a in objects where (( classof a == bonegeometry ) or ( classof a == dummy )) do
		(
			keyArray1 =  (a[3][1])
			keyArray2 =  (a[3][2])
			movekeys keyArray1 (0 - animationrange.start )
			movekeys keyArray2 (0 - animationrange.start )
		)
		offset = animationrange.end - animationrange.start
		animationRange = (interval 0 offset)
	)
	
	fn fn_bakeAnimation =
	(
		rootObj = undefined
		for a in objects where ( a.name == "root" ) do  rootObj = a
		if ( rootObj != undefined ) then 
		(
			if rootObj.parent == undefined then
			(
				free objlist
				objlist = (execute ( "$root/.../*")) as array
				--with undo on (
				try (
						with undo on 
						(
							tmp = Point()
							for obj in objlist do 
							(
								format "Baking %\r\n" (obj.name as string)
								for t = animationRange.start to animationRange.end by 1 do 
								(
									with animate on at time t ( tmp.transform =  obj.transform )
								)
								obj.transform.controller = transform_script()	
								obj.transform.controller = PRS()
								--obj.position.controller =  copy tmp.position.controller
								--obj.rotation.controller =  copy tmp.rotation.controller
								for i = animationRange.start to animationRange.end do 
								( 
									at time i , with animate on , in coordsys world
									(
										obj.transform = tmp.transform 
									 )
								)
								deletekeys (obj[3][3].keys) #allkeys
								if animationRange.start != 0 then
								(
									deletekey obj[3][1].keys 1
									deletekey obj[3][2].keys 1
									deletekey obj[3][3].keys 1
								)
								
							)
							delete tmp
							tmp = undefined
						) 
				) catch ()  
				
			 )
		)
	 )
		
	fn fn_export oldDir = 
	(
		arrExport = #()
		strTempPath =  maxfilepath + @"\temp" 
		strBipedPath = strTempPath + @"\biped"
		strFBXPath = strTempPath + @"\fbx"
		makedir strTempPath all:true
		--makedir strBipedPath all:true
		makedir strFBXPath all:true
		try
		(
			objlist = #()
			objlist = (execute ( "$root/.../*")) as array
			--skinMesh = undefined
			--for a in objects where (classof a == PolyMeshObject) do ( skinMesh = a )
			for a in objects where (classof a == PolyMeshObject or classof a ==  Editable_Mesh ) do ( appendifunique objlist a)
			arrExport = objlist
			--appendifunique arrExport skinMesh	

			if (objlist.count  < 1) then format "\tFound No Root Bone.\r\n" else
			(
				--- Step 1:save baked max file with original constraint
				--saveMaxFile  ( strBipedPath + "\\" + (filterstring maxfilename ".")[1] + "_biped.max" ) clearNeedSaveFlag:true useNewFile:false quiet:true
				--- Step 2: save baked max file without original constraint				
				fn_bakeAnimation()
				objlist = #()
				objlist = (execute ( "$root/.../*")) as array
				--skinMesh = undefined
				--for a in objects where (classof a == PolyMeshObject) do ( skinMesh = a )
				for a in objects where (classof a == PolyMeshObject or classof a ==  Editable_Mesh  ) do ( appendifunique objlist a)	
				arrExport = objlist
				--appendifunique arrExport skinMesh	
				delete ( for a in objects where (( finditem arrExport a ) == 0 ) collect a )
				if animationrange.start != 0 do fn_moveKeys()
				--saveMaxFile  ( strTempPath + "\\" + (filterstring maxfilename ".")[1] + "_nobiped.max" ) clearNeedSaveFlag:true useNewFile:false quiet:true
				--saveMaxFile  ( strTempPath + "\\" +  maxfilename ) clearNeedSaveFlag:true useNewFile:false quiet:true
				
				--- Step 3:	offset keys if needed and export baked fbx file without original constraint
				select arrExport
				Filename = strFBXPath  + "\\" + (filterstring ("f" + substring maxfilename 2 100) ".")[1] + ".fbx"
				format "\tExporting FBX file %\r\n" Filename
				FbxExporterSetParam "EmbedTextures" false 
				exportfile Filename #noPrompt selectedOnly:TRUE 
			)
		 ) catch()
	 )
	 
	fn fn_displayHUD =
	(
	  gw.setTransform (matrix3 1)
	  gw.setColor #Line yellow
	  for o in objects where not o.isHiddenInVpt do
	  --gw.text [o.pos.x,o.pos.y,0] (o as string) color:yellow
	  --gw.enlargeUpdateRect #whole  
	  
	  vec3_offset1 = [-45,0,0]
	  vec3_offset2 = [5,5,0]
	  
	  gw.wPolyline #([20, 30, 0], [20, 120, 0]) false
	  gw.wPolyline #([20, 70, 0], [70, 70, 0]) false
	  gw.wPolyline #([70, 70, 0], [70, 120, 0]) false 
	  
	  gw.wPolyline #([120, 70, 0]-[5,0,0], [120, 120, 0]-[5,0,0]) false 
	  
	  gw.wPolyline #([160, 70, 0], [185, 70, 0]) false 
	  gw.wPolyline #([160, 45, 0], [160, 120, 0]) false 
	  gw.wPolyline #([160, 120, 0], [185, 120, 0]) false 
	  
	  gw.wPolyline #([270, 30, 0]+  vec3_offset1,[270, 120, 0]+  vec3_offset1) false 
	  gw.wPolyline #([270, 70, 0]+  vec3_offset1,[320, 70, 0]+  vec3_offset1)  false
	  gw.wPolyline #([320, 70, 0]+  vec3_offset1,[320, 120, 0]+  vec3_offset1) false
	  gw.wPolyline #([270, 120, 0]+  vec3_offset1,[320, 120, 0]+  vec3_offset1) false
	  
		
	  gw.wPolyline #([345, 70, 0]+  vec3_offset1,[345, 120, 0]+  vec3_offset1) false 
	  gw.wPolyline #([270, 70, 0]+ [75,0,0]+  vec3_offset1,[320, 70, 0]+[75,0,0]+  vec3_offset1)  false
	  gw.wPolyline #([320, 70, 0]+[75,0,0]+  vec3_offset1,[320, 120, 0]+[75,0,0]+  vec3_offset1) false
	  gw.wPolyline #([270, 120, 0]+[75,0,0]+  vec3_offset1,[320, 120, 0]+[75,0,0]+  vec3_offset1) false
	  
	  gw.wPolyline #([345, 70, 0]+[75,0,0]+  vec3_offset1,[345,120,0]+[75,0,0]+  vec3_offset1) false 
	  gw.wPolyline #([270, 70, 0]+[75,0,0]+[75,0,0]+  vec3_offset1,[320, 70,0]+[75,0,0]+[75,0,0]+  vec3_offset1)  false
	  gw.wPolyline #([320, 70, 0]+[75,0,0]+[75,0,0]+  vec3_offset1,[320,120,0]+[75,0,0]+[75,0,0]+  vec3_offset1) false

	  gw.wPolyline #([345, 70, 0]+[150,0,0]+  vec3_offset1,[345,120,0]+[150,0,0]+  vec3_offset1) false 
	  gw.wPolyline #([270, 70, 0]+[150,0,0]+[75,0,0]+  vec3_offset1,[320, 70,0]+[150,0,0]+[75,0,0]+  vec3_offset1)  false
	  gw.wPolyline #([270, 95, 0]+[150,0,0]+[75,0,0]+  vec3_offset1,[320, 95,0]+[150,0,0]+[75,0,0]+  vec3_offset1)  false
	  gw.wPolyline #([270, 120,0]+[150,0,0]+[75,0,0]+  vec3_offset1,[320,120,0]+[150,0,0]+[75,0,0]+  vec3_offset1) false
	  gw.wPolyline #([320, 70,0]+[150,0,0]+[75,0,0]+  vec3_offset1,[320, 95,0]+[150,0,0]+[75,0,0]+  vec3_offset1) false
	  
	  --gw.wPolyline #([580,30,0]+  vec3_offset1,[580,95,0]+  vec3_offset1) false
	  --gw.wPolyline #([580,105,0]+  vec3_offset1,[580,120,0]+  vec3_offset1) false
	  
	  gw.wPolyline #([20, 30, 0]+  vec3_offset2, [20, 120, 0]+  vec3_offset2) false
	  gw.wPolyline #([20, 70, 0]+  vec3_offset2, [70, 70, 0]+  vec3_offset2) false
	  gw.wPolyline #([70, 70, 0]+  vec3_offset2, [70, 120, 0]+  vec3_offset2) false 
	  
	  gw.wPolyline #([120, 70, 0]-[5,0,0]+  vec3_offset2, [120, 120, 0]-[5,0,0]+  vec3_offset2) false 
	  
	  gw.wPolyline #([160, 70, 0]+  vec3_offset2, [185, 70, 0]+  vec3_offset2) false 
	  gw.wPolyline #([160, 45, 0]+  vec3_offset2, [160, 120, 0]+  vec3_offset2) false 
	  gw.wPolyline #([160, 120, 0]+  vec3_offset2, [185, 120, 0]+ vec3_offset2) false 
	  
	  gw.wPolyline #([270, 30, 0]+  vec3_offset1+  vec3_offset2,[270, 120, 0]+  vec3_offset1+  vec3_offset2) false 
	  gw.wPolyline #([270, 70, 0]+  vec3_offset1+  vec3_offset2,[320, 70, 0]+  vec3_offset1+  vec3_offset2)  false
	  gw.wPolyline #([320, 70, 0]+  vec3_offset1+  vec3_offset2,[320, 120, 0]+  vec3_offset1+  vec3_offset2) false
	  gw.wPolyline #([270, 120, 0]+  vec3_offset1+  vec3_offset2,[320, 120, 0]+  vec3_offset1+  vec3_offset2) false
	  
		
	  gw.wPolyline #([345, 70, 0]+  vec3_offset1+  vec3_offset2,[345, 120, 0]+  vec3_offset1+  vec3_offset2) false 
	  gw.wPolyline #([270, 70, 0]+ [75,0,0]+  vec3_offset1+  vec3_offset2,[320, 70, 0]+[75,0,0]+  vec3_offset1+  vec3_offset2)  false
	  gw.wPolyline #([320, 70, 0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320, 120, 0]+[75,0,0]+  vec3_offset1+  vec3_offset2) false
	  gw.wPolyline #([270, 120, 0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320, 120, 0]+[75,0,0]+  vec3_offset1+  vec3_offset2) false
	  
	  gw.wPolyline #([345, 70, 0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[345,120,0]+[75,0,0]+  vec3_offset1+  vec3_offset2) false 
	  gw.wPolyline #([270, 70, 0]+[75,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320, 70,0]+[75,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2)  false
	  gw.wPolyline #([320, 70, 0]+[75,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320,120,0]+[75,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2) false

	  gw.wPolyline #([345, 70, 0]+[150,0,0]+  vec3_offset1+  vec3_offset2,[345,120,0]+[150,0,0]+  vec3_offset1+  vec3_offset2) false 
	  gw.wPolyline #([270, 70, 0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320, 70,0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2)  false
	  gw.wPolyline #([270, 95, 0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320, 95,0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2)  false
	  gw.wPolyline #([270, 120,0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320,120,0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2) false
	  gw.wPolyline #([320, 70,0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2,[320, 95,0]+[150,0,0]+[75,0,0]+  vec3_offset1+  vec3_offset2) false
	  --gw.wPolyline #([580,30,0]+  vec3_offset1+  vec3_offset2,[580,95,0]+  vec3_offset1+  vec3_offset2) false
	  --gw.wPolyline #([580,105,0]+  vec3_offset1+  vec3_offset2,[580,120,0]+  vec3_offset1) false
	  completeRedraw()
	  gw.enlargeUpdateRect #whole
	  gw.updateScreen()	 
		--disableSceneRedraw() 
		--enableSceneRedraw() 
	)   
	
	fn fn_gw_head =
	(
		gw.setTransform (matrix3 1);
		gw.hText [250,601,10] "Rename A \"head\" Bone!" color:yellow;
		for i = 1 to 3 do ( gw.hMarker [190+ i * 15 , 610, 10]  #diamond  color:yellow);
		for i = 1 to 3 do ( gw.hMarker [380 + i * 15 , 610, 10]  #diamond  color:yellow);
		gw.enlargeUpdateRect #whole  ;
	    completeRedraw()
	    gw.updateScreen()	 
	)
	
	fn fn_gw_center =
	(
		gw.setTransform (matrix3 1);
		gw.hText [250,701,10] "Rename A \"center\" Bone!" color:yellow;
		for i = 1 to 3 do ( gw.hMarker [190+ i * 15 , 710, 10]  #diamond  color:yellow);
		for i = 1 to 3 do ( gw.hMarker [380 + i * 15 , 710, 10]  #diamond  color:yellow);
		gw.enlargeUpdateRect #whole  ;
	    completeRedraw()
	    gw.updateScreen()	 
	)
	
	on execute do	
	(--filein (getdir #maxroot+"scripts\\TLM_Assets_Inspector.ms")
		try(destroyDialog ::RL_Main_CR)catch()
		
		
		rollout RL_bal_dialog "BoneLimit" width:80 height:140
		(
			radiobuttons rbtn_bal columns:4 labels:#("1", "2","3","4") default:3 offsets:#([30,-16], [0,-16], [30,-16], [0,-16]) 
			 --radiobuttons rad_buttons "Deal:" columns:1 labels:#("Big", "Bigger", "Biggest", "Huge") offsets:#([0,0], [10,10], [20,20], [30,0]) 
			button btn_bal "OK" width:20 height:16  pos:[100,30] --align:#right --pos:[180,90]			
			
			on RL_bal_dialog open do
			(
				int_bal = 3
			 )	
			
			on rbtn_bal changed state do
			(
				int_bal = case RL_bal_dialog.rbtn_bal.state of
				(
					1: 1
					2: 2
					3: 3
					4: 4
				 );
				 print ("int_bal = " + (int_bal as string));
			 )
			 
			on btn_bal pressed do
			(
				for a in arr_skinMesh do
				(
					a.modifiers[1].bone_limit = int_bal
				 )

				try(destroydialog ::RL_bal_dialog) catch()
			 )
		 )
		 
		rollout RL_DSR "Rebuilder" width:245 height:200
		(
			local str_prefix = "_new"
			
			group "Parameters"
			(
				radiobuttons rb_isFullbody labels:#("Fullbody", "Selection") pos:[10,26]
				spinner spn_boneSize "Size:  " fieldWidth:35 range:[1,25,10] scale:1 pos:[150,26]
				colorpicker theColor "Color:" color:[30,140,195] modal:false pos:[150,54] height:16
			)
			button btn1 "Build" width:60 height:16  pos:[5,81]
			button btn_head "head" width:40 height:16  pos:[70,81] 
			button btn_center "center" width:40 height:16  pos:[115,81] 
			button btn_hitbone "hitbone" width:40 height:16  pos:[160,81] --align:#right --pos:[180,90]
			button btn_cancel "cancel" width:40 height:16  pos:[205,81] --align:#right --pos:[180,90]
			button btn_skin "***  skin  ***" width:240 height:16

			on theColor changed new_col do 
			(
				boneColor = new_col
				if (selection.count == 1) then 
				(
					if --classof (selection[1]) == BoneGeometry and 
					(selection[1]).parent == undefined and (toLower (selection[1].name as string) == (selection[1].name as string)) then
					(
						rootBone = selection[1];
						arr_Bones = execute ( "$" + (rootBone.name as string) + "/.../*")
						arr_Bones.count
						for a in arr_Bones where (toLower (a.name as string) == (a.name as string)) do
						( a.wirecolor = boneColor)
					)
				)
			 )
	
			on spn_boneSize changed newValue do
			(
				boneSize = newValue
				if (selection.count == 1) then 
				(
					if -- classof (selection[1]) == BoneGeometry and 
					(selection[1]).parent == undefined and (toLower (selection[1].name as string) == (selection[1].name as string)) then
					(
						rootBone = selection[1];
						arr_Bones = execute ( "$" + (rootBone.name as string) + "/.../*")
						arr_Bones.count
						for a in arr_Bones where (((classof a ) == BoneGeometry) and  (toLower (a.name as string) ==  (a.name as string))) do
						(
							a.width = boneSize;
							a.height = boneSize;
						 )
					)
				)
			 )
			
			on rb_isFullbody changed theState do
			( 
				if (rb_isFullbody.state == 1 ) then (index_fullbody = 1) else index_fullbody = 0	
				print index_fullbody
			 )
			
			on edt1 changed state do  str_prefix = "_" + edt1.text
			
			on btn_reset pressed do
			(
				edt1.text = "new"
				str_prefix = "_" + edt1.text
			 )
				
			on btn1 pressed do 
			( 
				free arr_Dummy
				free arr_Bones
				free arr_newName
				free arr_skinMesh
				free arr_bones
				
				case index_fullbody of 
				(
					1 : (
							if (selection.count == 1) then 
							(
								if (classof (selection[1]) == BoneGeometry or classof (selection[1]) == Biped_Object) and (selection[1]).parent == undefined then
								(
									rootBone = selection[1];
									arr_Bones = execute ( "$" + (rootBone.name as string) + "/.../*")
									arr_Bones.count
								 ) else RL_Main_CR.theSubRollout.RL_Output.dnc_label2.text = "Select  root  bone  First\r\n"	
							 ) else RL_Main_CR.theSubRollout.RL_Output.dnc_label2.text = "Select  root  bone  First\r\n"
						 )
						 
					0 : (
							if (selection.count > 0) then
							(
								(arr_Bones = ( for a in selection collect a ) ;
								rootBone = undefined)
							 ) else RL_Main_CR.theSubRollout.RL_Output.dnc_label2.text = "Select some bones first."
						 )
				 )
				 
				if (arr_Bones.count > 0) do
				(
					arr_allObjNames = for someObj in objects where (classof someObj == BoneGeometry or classof someObj == biped_Object or classof someObj == Dummy ) collect (someObj.name as string)
					arr_boneNames = for x in arr_Bones collect x.name
					
					if ( 
							( index_fullbody == 0 and  rootBone == undefined and  ((finditem arr_allObjNames "root") == 0 )) or 
							( index_fullbody == 1 and  rootBone != undefined  and  ((finditem arr_allObjNames "root") == 0 ))
						) then
					(	
						 
						 obj_spine1 =  undefined
						 obj_neck = undefined
						 obj_neck1 = undefined
						 obj_head = undefined
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
						
						rootDummy = Dummy()
						rootDummy.position = [0,0,0]
						rootDummy.name = "root"
						
						for d in arr_Bones where (((d.children.count == 0 and classof d == dummy ) == false ) and ((classof d == biped_object and d.parent == undefined ) == false) and ( findstring d.name "Footsteps") == undefined ) do
						( 
							newNametmp = fn_toLower (d.name as string)
							newName = fn_removeSpaces newNameTmp
							append arr_newName newName

							if ((finditem arr_allObjNames newName) == 0 ) then
							(	
								obj = bonesys.createbone [0,0,0] [1,0,0] [0,0,1]
								obj.width = boneSize
								obj.height = boneSize
								obj.wirecolor = boneColor
								
								if (classof d == bonegeometry) then ( obj.length = d.length )
								else if( d.children != undefined ) then
								(
									obj.length = case d.children.count of
									(
										0: 5
										1: abs(distance d.transform.row4  d.children[1].transform.row4)
										default: 5
									 )
									
								 ) else obj.length = 5
								
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
								
								obj.position.controller = position_constraint()
								obj.position.controller.appendTarget d 100

								obj.rotation.controller = Orientation_Constraint ()
								obj.rotation.controller.appendTarget d 100
								obj.rotation.controller.relative = off	
								
								obj.parent = rootDummy
							 )				 
						 )
						 

						 
						RL_Main_CR.theSubRollout.RL_Output.dnc_label2.text = ""
						--messagebox("Select and rename a 'hitbone'!")
						
						try(unregisterRedrawViewsCallback ::fn_displayHUD) catch()
						try(unregisterRedrawViewsCallback ::fn_gw_head) catch()
						try(unregisterRedrawViewsCallback ::fn_gw_center) catch()
						registerRedrawViewsCallback ::fn_displayHUD 
						registerRedrawViewsCallback fn_gw_head
						registerRedrawViewsCallback fn_gw_center
						if arr_newName.count > 0 and arr_Dummy.count > 0 and arr_Dummy.count == arr_newName.count do
						( for i = 1 to arr_Dummy.count do arr_Dummy[i].name = arr_newName[i] )
						
					for a in arr_Bones do 
					(
						if (a.name == "bip001_pelvis" and a.parent != undefined) != true then
						hide a
					 )
					 
					 
					 if arr_Dummy.count > 0 then
					 (
						msg = ""
						for a in arr_Dummy do
						(
							if ((tolower a.name[1] != a.name[1]) or (findstring a.name "bip001_" != 1 )) and (findstring a.name "bone" != 1 ) then
							( msg = msg + a.name + "\r\n")
						 )
						 if msg != "" then 
						 (
							 msg += "\r\nCaution:Wrong Naming Convention!\r\n";
							 messagebox msg
						  )
					  )
						
						) else (RL_Main_CR.theSubRollout.RL_Output.dnc_label2.text = "There is a root object already.")
						
					--SchematicViews.open "My Schematic View"
				)
			)
			
			on btn_skin pressed do
			(
				fn_addSkin()
				fn_addBone()
				createdialog RL_bal_dialog width:140 height:60
			 )
						
			on btn_head pressed do 
			(
				isHead = false
				for a in objects do 
				(
					if a.name == "head" then isHead = True
				 ) 
				if isHead == false then
				(
					if selection.count > 0 and classof(selection[1]) == BoneGeometry then
					(
						selection[1].name = "head"
						try(unregisterRedrawViewsCallback fn_gw_head) catch()
					 ) else messagebox("Select a joint first!")
				 ) else messagebox("head bone already exists!")
			)
			
			on btn_center pressed do 
			(
				isCenter = false
				for a in objects do 
				(
					if a.name == "center" then isCenter = True
					
				 ) 
				if isCenter == false then
				(
					if selection.count > 0 and classof(selection[1]) == BoneGeometry then
					(
						selection[1].name = "center"
						try(unregisterRedrawViewsCallback fn_gw_center) catch()
					 ) else messagebox("Select a joint first!")
				 ) else messagebox("center bone already exists!")
			)
			
			on btn_hitbone pressed do 
			(
				isHitbone = false
				for a in objects do 
				(
					if a.name == "hitbone" then isHitbone = True
					
				 ) 
				if isHitbone == false then
				(
					if selection.count > 0 and classof(selection[1]) == BoneGeometry then
					(
						selection[1].name = "hitbone"
						try(unregisterRedrawViewsCallback ::fn_displayHUD) catch()
					 ) else messagebox("Select a joint first!")
				 ) else messagebox("Hitbone already exists!")
			
			)
			
			on btn_cancel pressed do
			(
				try(unregisterRedrawViewsCallback ::fn_displayHUD) catch()
				try(unregisterRedrawViewsCallback fn_gw_center) catch()
				try(unregisterRedrawViewsCallback fn_gw_head) catch()
			 )
					  
			on btn2 pressed do dnc_label.text = ""
		 )
		 
		 
		rollout RL_Toolkit "Batch Processor" width:245 height:200
		(
			group "File"
			(
				multiListBox fileList  items:#() selection:#() width:233 height:8 pos:[10,25]
				button btn_OpenFiles "Load Files" height:16 width:60  align:#right apos:[10,120] 
			)
			
			group  "Output" 
			(
				dropdownlist ddl_paths   width:195 height:20 items:#(GetDir #export) tooltip:"" across:2
				button btn_selectPath "..." width:25 height:20 offset:[45,0]
				label lb_hitbone "Chk Hitbone"  pos:[14,220] --align:#right
				checkbox chbx_checkHitbone checked:false pos:[74,220] --align:#right
				spinner spn_fps "FPS:" fieldWidth:27 range:[1,60,24] scale:1 pos:[93,220] type:#integer
				button btn_export "Bake|Export" offset:[0,-24]  align:#right --width:80 height:16  --offset:[80,0]	
			--dotnetcontrol dnc_content  "System.Windows.Forms.Label" width:240 height:90 offset:[0,0] -- pos:[0,0]
			--label lbl_content "1.Bake Animation 2.Save As Max Files With And Without Original Skeleton"    width:50 height:16 offset:[0,0]
			 )
			 
			 
			on RL_Toolkit open do
			(
				/*
				dnc_content.text = 
				"Process:\r\n" +
				"1.Bake animation for new skeleton.\r\n" + 
				"2.Save max files with and without deleted\r\n  original skeleton.\r\n" +
				"3.Export fbx for animation-baked character."
				*/
			 )
			 
			 
			on btn_OpenFiles pressed do
			(
				free fileArray
				free listOfMaxFiles
				free hashListFinal
				newArr = #()
				 
				theDialog = dotNetObject "System.Windows.Forms.OpenFileDialog" --create a OpenFileDialog 
				theDialog.title = "PLEASE Select One Or More Files" --set the title
				theDialog.Multiselect = true --allow multiple files to be selected
				theDialog.Filter = "MAX Files (*.max)|*.max|All Files (*.*)|*.*" --specify the filter
				theDialog.FilterIndex = 1 --set the filter drop-down list to All Files
				result = theDialog.showDialog() --display the dialog, get result into variable
				result.ToString()
				resultStr = (result as string)
				
				if result.Equals result.OK do fileArray =  theDialog.filenames
					
				result.Equals result.OK
				for i in fileArray do appendifunique listOfMaxFiles (i as string)
				fileList.items = listOfMaxFiles
				if result.Equals result.Cancel do ( print "Cancel")
			 )
				

			on ddl_paths selected i do
			(
				str_exportPath = ddl_paths.items[i]
				print str_exportPath
			)
			
			 
			on fileList selectionEnd do
			(  
				for i = 1 to fileList.items.count do
				(
					if fileList.selection[i] == true do
						appendifunique hashListFinal fileList.items[i];
					if fileList.selection[i] == false and  ( (finditem hashListFinal fileList.items[i]) != 0 ) do
					(
						if hashListFinal.count == 1 then ( free hashListFinal  ) else 
							deleteitem hashListFinal (finditem hashListFinal fileList.items[i])	
					)
				)
				print ("\n\n" + hashListFinal.count as string + " Files Selected:\r\n")
				print hashListFinal
			)
				 
			on btn_selectPath pressed do
			(
				OutputArr = ddl_paths.items
				newArr = #()
				for i = 1 to OutputArr.count do
				(
					item = OutputArr[i]
					newArr[i+1] = item
				)
				OutputArr = newArr
				OutputArr[1] = getSavePath "Output Path:" initialDir:"C:\\" as string--getOpenFileName() --(getDir #maxroot)
				ddl_paths.items = OutputArr
				ddl_paths.selection = 1 
				print OutputArr[1]
				str_exportPath = OutputArr[1]
			 )
			
			on spn_fps changed index do
			(
				myFPS = index;
				print myFPS
			)
			  
			on btn_export pressed do 
			(
				hasNoHitbone = false
				if hashListFinal[1] != undefined do 
				(
					for i in hashListFinal do
					(
						loadMaxFile i  quiet:true ;
						framerate = myFPS
						if chbx_checkHitbone.checked then
						(
							if (fn_hasHitbone() == true) then
							--fn_bakeAnimation();
							( 
								fn_export str_exportPath 
								--fn_resetScene()
							)
							else
								(
								  if ( hasNoHitbone == false ) then
								  (fn_createCheckLog())
								  format "\"%\" doesn't has a hitbone." i to:logStream
								  hasNoHitbone = true
								 )
						 ) 
						 else 
						 (
							 fn_export str_exportPath
						 )
					)
					fn_resetScene()
				 )
				free hashListFinal
				fileList.items = #()
				if  ( hasNoHitbone == true ) then 
				(
					close logStream
					ShellLaunch "explorer.exe" ("/e,/select,\"" + (log_file as string) + "\"")
				)
			 )
		)
		
		rollout RL_Output "Message" width:245 height:100
		(
			--label lbl1 "Prefix:" pos:[10,10] width:30 height:16
			local dnColor2 = dotnetclass "system.drawing.color"
			--label lbl_output "Output Message:" pos:[10,34] width:40 height:16
			dotnetcontrol dnc_label2  "System.Windows.Forms.Label" width:258 height:50 pos:[0,0]
		 )	
		
		rollout RL_Main_CR "Skeleton Rebuilder"
		(
			subRollout theSubRollout pos:[-1,-1] width:265 height:490 align:#center
			on RL_Main_CR open do 
			(
				AddSubRollout RL_Main_CR.theSubRollout RL_DSR ;
				AddSubRollout RL_Main_CR.theSubRollout RL_Toolkit; 
				AddSubRollout RL_Main_CR.theSubRollout RL_Output;
			 )
		 )
		createdialog RL_Main_CR width:260 height:475
	 )
)
 
-------rename all boneGeometry with a "bip01_" prefix to one with "bip001_" prefix 
macroScript rename_bip01
category:"TLMtools"
ButtonText:"RenameBip01"
toolTip:"RenameBip01"
(
	on execute do	
	(
		for a in objects where ((classof a ) == bonegeometry ) do
		(
			
			if ((findstring a.name "bip01_") == 1 ) then
			(a.name = ("bip001" + (substring a.name 6 100)))
		 )
	)
 )