macroScript SkinTransfer
category:"LGTools"
ButtonText:"SkinTransfer"
toolTip:"SkinTransfer"
--icon:#("chrRebuilder",1)
( 
	global RL_ST_main
	local RL_ST, RL_null
	--local DNC_tabs,theSubRollout
	local Tabs_Rollouts
	local LastSubRollout = 1
	local fn_backupMaxFile,fn_skinOps,fn_skinOpsLoop,fn_merge,fn_clearOldBones,fn_addNewSkins, \
			fn_EnvelopeCallback,fn_loadEnvelope
	local polyArray = #()
	local newBones = #()
	local polyArray = #()
	
	local _zeroBones = #()
	local _goodBones = #()
	local fn_fbxExport
	local arrExport = #()
	local fbxFileName = ""
	local objlist = #()
		
	fn fn_backupMaxFile = 
	(
		--save as and load backup file
		_bkFileName = maxfilepath + (filterstring maxfilename ".")[1] + "_backup.max"
		saveMaxFile _bkFileName clearNeedSaveFlag:true useNewFile:false quiet:true
	)
	

	fn fn_skinOps  obj = 
	(
		_envPath = maxfilepath + obj.name + ".env"
		if ((classof obj.modifiers[1]) == skin) then
		( 	_skin = obj.modifiers[1]  )
		select obj
		setCommandPanelTaskMode mode:#modify
		skinOps.saveEnvelope _skin  _envPath
		deletemodifier obj obj.modifiers[1]
		completeRedraw()
		True
	)
	
	
	fn fn_skinOpsLoop  =
	(
		--collect skin objects
		skinArray = #()
		skinArray =  for x in objects where (( classof x == PolyMeshObject ) and 
		(findstring x.name "basic" == undefined ) and
		(findstring x.name "gbase" == undefined )) collect x

		--save envs and delete skins
		if ( skinArray.count > 0 ) then
		(
			for a in skinArray do ( fn_skinOps a )
		)
	)
	

	fn fn_merge = 
	(
		baseFile =  (GetDir #defaults) + "\\xbase_skin.max"
		mergemaxfile baseFile #deleteOldDups quiet:true
	)

	fn fn_clearOldBones = 
	(
		select $Bip001...*
		oldBones  = (selection as array)
		if ( oldBones.count > 0 ) then delete oldBones
	)
	
	
	fn fn_addNewSkins = 
	(
		free polyArray
		free newBones
		free polyArray
		--collect poly objects
		--polyArray = #()
		polyArray =  ( for x in objects where (( classof x == editable_poly ) and 
		(findstring x.name "basic" == undefined ) and
		(findstring x.name "gbase" == undefined ))  collect x )

		
		--collect root bones and delete root object

		
		--add skins to poly objects
		if ( polyArray.count > 0 ) then
		(
			for a in polyArray do 
			(
				print a.name;
				addmodifier a ( skin() );
				completeRedraw();
				select $root...*
				newBones = ( selection as array )
				select a
				setCommandPanelTaskMode mode:#modify
				for b in newBones do skinops.addbone a.modifiers[#skin] b 1;
				a.modifiers[#skin].bone_limit = 4;
				completeRedraw();
			)
		) else ( print "no poly ")
		
	)
	

	fn fn_EnvelopeCallback =
	(
		
		WindowHandle = DialogMonitorOPS.GetWindowHandle()
		theDialogName = UIAccessor.GetWindowText WindowHandle
		if theDialogName != undefined and matchpattern theDialogName pattern:"*Load Envelopes*" do
		UIAccessor.PressButtonByName WindowHandle "Match by Name"
		
		if theDialogName != undefined and matchpattern theDialogName pattern:"*Load Envelopes*" do
		UIAccessor.PressButtonByName WindowHandle "OK"
		true
	)

	fn fn_loadEnvelope = 
	(
		--collect skin objects
		skinArray = #()
		skinArray =  for x in objects where (( classof x == PolyMeshObject ) and 
		(findstring x.name "basic" == undefined ) and
		(findstring x.name "gbase" == undefined )) collect x

		for s in skinArray do
		(
			envPath = maxfilepath + "\\" + s.name + ".env"
			--envPath = @"E:\projects\PWRD\MXS\LovelyGirl\TransferSkin\assets\150407_girl\g150407_dress_girl.env"

			if ( doesfileexist envPath == true ) then
			(
				print envPath
				select s
				setCommandPanelTaskMode mode:#modify
				dialogMonitorOps.interactive = false
				dialogMonitorOps.unregisterNotification id:#test
				DialogMonitorOPS.RegisterNotification fn_EnvelopeCallback ID:#EnvelopeCallback
				DialogMonitorOPS.Enabled = true
				completeRedraw()
				skinOps.loadEnvelope $.modifiers[#Skin] envPath
				DialogMonitorOPS.Enabled = false
				DialogMonitorOPS.UnRegisterNotification ID:#EnvelopeCallback
				completeRedraw()
			) else print "env file doesn't exist."
		)
		
	)
	
	
	fn fn_removeNullBones obj  = 
	(
		select obj
		setCommandPanelTaskMode mode:#modify
		_skin  = obj.modifiers[#Skin]
		_numVerts = skinOps.GetNumberVertices _skin
		_numBones = skinOps.GetNumberBones _skin

		_vertBoneWeight = undefined

		free _zeroBones
		free _goodBones
		
		for i = 1 to _numVerts do
		(
			for j = 1 to 4 do
			(
				_vertBoneWeight = undefined;
				try
				(
					--print ("vert " + (j as string));
						_vertBoneWeight = ( skinops.getvertexweight _skin i j ) 
						--print _vertBoneWeight
				) catch( _vertBoneWeight = undefined )
				
				if _vertBoneWeight != undefined and _vertBoneWeight != 0.0 then 
				(
					_systemBoneID = skinOps.GetVertexWeightBoneID _skin i j;
					appendifunique _goodBones _systemBoneID
				)
				--if ( _vertBoneWeight != undefined and _vertBoneWeight != 0.0 ) then	exit
			)
		)
		
		sort _goodBones

		for i = 1 to _numBones do
		(
			if ((finditem _goodBones i ) == 0 ) then ( appendifunique _zeroBones i )
		)
/*
		if _vertBoneWeight ==  undefined or _vertBoneWeight == 0.0 then
		( append _zeroBones i )
		*/
			--_zeroBones;
		print ("_zeroBones.count " + (_zeroBones.count as string))

		--for a in _zeroBones do print ( a as string )
		
		for a = 1 to _zeroBones.count do
		(
			print ("a " + ( a as string ))
			--boneName = skinOps.GetBoneName _skin a 1
			print ("_zeroBones[a] " + (_zeroBones[a] as string ))
			skinops.removebone _skin  ( _zeroBones[a] - a + 1 )
			--else skinops.removebone _skin a	
		)
	)
	
	fn fn_removeNullBonesLoop =
	(
		--collect skin objects
		skinArray = #()
		skinArray =  for x in objects where (( classof x == PolyMeshObject ) and 
		(findstring x.name "basic" == undefined )) collect x
		--(findstring x.name "gbase" == undefined ))

		--fn_removeNullBones skinArray[3]
		
		for s in skinArray do
		(
			print s.name;
			fn_removeNullBones s;
		)
				
		_skinFileName = maxfilepath + maxfilename
		saveMaxFile _skinFileName clearNeedSaveFlag:true useNewFile:true quiet:true
	)
	
	
	
	fn fn_fbxExport  = 
	(
		free arrExport
		fbxFileName = ""
		if findstring maxfilename "girl" != undefined then
		fbxFileName = "f" + (filterstring (substring maxfilename 2 100) "girl")[1] + "girl.fbx"
		else fbxFileName = "f" + (filterstring (substring maxfilename 2 100) "boy")[1] + "boy.fbx"
		_fbxath =  maxfilepath + "\\export\\" + fbxFileName
		makedir (maxfilepath + "\\export\\") all:true
		
		try
		(
			print "exporting on..."
			free objlist
			--objlist = (execute ( "$root/.../*")) as array
			select $root...*
			objlist = ( selection as array )
				
			for x in objects where (( classof x == PolyMeshObject ) and 
			(findstring x.name "basic" == undefined ) and
			(findstring x.name "gbase" == undefined ))  do ( appendifunique objlist x )
			arrExport = objlist
			--appendifunique arrExport skinMesh	

			if (arrExport.count  < 1) then format "\tNothing to export" else
			(
				print "exporting on end..."
				print ("arrExport.count " + (arrExport.count as string) )
				select arrExport
				format "\tExporting FBX file %\r\n" Filename
				FbxExporterSetParam "EmbedTextures" false 
				exportfile _fbxath #noPrompt selectedOnly:TRUE 
			)
		 ) catch()
	 )
	
	
		
	on execute do
	(
		try( DestroyDialog ::RL_ST_main) catch()
		rollout RL_ST "Skin Transfer" width:130 height:140
		(
			button btn_backup "1  Backup                  "  width: 110 height:20 pos:[10,10] 
			button btn_exportEnv "2  Env Clear Merge  "  width: 110 height:20 pos:[10,35]
			button btn_reskinAndLoadEnv "3  Re-skin Load Env "  width: 110 height:20 pos:[10,60]
			button btn_removeNullBone "4  Remove Null Bone"  width: 110 height:20 pos:[10,85]
			button btn_exportFbx "5  Export Fbx          " width: 110 height:20 pos:[10,110]
			
			
			on btn_backup pressed do fn_backupMaxFile()
			
			on btn_exportEnv pressed do
			(
				fn_skinOpsLoop()
				fn_merge();
				fn_clearOldBones();
			)
			
			on btn_reskinAndLoadEnv pressed do
			(
				fn_addNewSkins();
				fn_loadEnvelope();
			)
			
			on btn_removeNullBone pressed do
			(
				fn_removeNullBonesLoop()
			)
			
			on btn_exportFbx pressed do
			(
				print "exporting...";
				fn_fbxExport();
			)
				
			
			
		)
		
		
		
		rollout RL_null "Other Tool" width:130 height:140
		(
			label lb_null "Nothing yet:)" 
		)
		

		Tabs_Rollouts = 
		#(
			#("SkinTransfer",#(RL_ST)),
			#("Other",#(RL_null))
		 )
		
		rollout RL_ST_main "Skin Toolset"  
		(
			
			dotNetControl DNC_tabs "System.Windows.Forms.TabControl" height:20 width:150 align:#left
			subRollout theSubRollout width:140 height:200 align:#center

			on DNC_tabs Selected item do
			(
				if LastSubRollout != (item.TabPageIndex+1) do
				(
					for subroll in Tabs_Rollouts[LastSubRollout][2] do
					removeSubRollout theSubRollout subroll
					for subroll in Tabs_Rollouts[LastSubRollout = item.TabPageIndex+1][2] do	
					(addSubRollout theSubRollout subroll)
					
				)
				if ( item.TabPageIndex == 0 ) then RL_ST_main.height = 200 else RL_ST_main.height = 150
			)

			on RL_ST_main open do
			(
				
				for a in Tabs_Rollouts do
				(
					 DNC_tabs.TabPages.add a[1]
				)
				
				
				for subroll in Tabs_Rollouts[1][2] do 
				addSubRollout theSubRollout subroll	
			)
		)  

		createdialog RL_ST_main  150 200

		--createdialog RL_ST
	)
	
	
)