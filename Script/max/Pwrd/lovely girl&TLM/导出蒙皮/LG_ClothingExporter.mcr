macroScript Clothing_Exporter
	category:"LGTools"
    ButtonText:"Export Cloth"
	toolTip:"Clothing Exporter"
(
	global RL_ClothingExporter
	local fn_getTexArr
	local arr_tex = #()
	local fn_rename
	local fn_deletePView
	local fn_getTexArr
	local str_exportPath = (GetDir #export)
	local str_texPath = (GetDir #export)
	local newName = "clothing"
	local str_correctLog = ""
	local fn_reverseStr
	local OutputArr = #()
	
	fn fn_reverseStr inputStr =
	(
		newStrSep = #()
		for i = 1 to inputStr.count do (newStrSep[i] = inputStr[inputStr.count - i + 1])
		newStr = ""
		return (for i = 1 to newStrSep.count collect (newStr += newStrSep[i]))[inputStr.count]
	)
	
	fn fn_rename obj = 
	(
		newName = "f" + (substring obj.name 2 100) 
		--newName = fn_reverseStr (substring (fn_reverseStr tmpName) 6 100)
		return newName
	)
			
	fn fn_deletePView = 
	(
		 arr_PView = for a in objects where (classof a) == Particle_View collect a
		 if (arr_PView.count > 0) then
		 (
			 append str_correctLog  ((arr_PView[1].name as string) + " is deleted.\n")
			 delete arr_PView
		  ) 
	 )
	
	fn fn_getTexArr obj= 
	(
		if obj != undefined then
		(	
			mat_sel = undefined
			mat_sel =  case  classof obj.material == multimaterial of
			(
				true :  obj.material[2]
				false : obj.material
				default:obj.material
			)  
			str_diff = undefined
			str_bump = undefined
			str_opacity = undefined
			str_spec = undefined
			if (mat_sel.diffusemap != undefined ) then (try( str_diff = ( substring (mat_sel.diffusemap.bitmap as string) 8 100)) catch())
			if (mat_sel.specularmap != undefined ) then (try( str_spec = ( substring (mat_sel.specularmap.bitmap as string) 8 100)) catch())
			if (mat_sel.opacityMap != undefined ) then (try( str_opacity = ( substring (mat_sel.opacityMap.bitmap as string) 8 100)) catch())
			if (mat_sel.bumpMap != undefined ) then (try( str_bump = ( substring (mat_sel.bumpMap.bitmap as string) 8 100)) catch())
			arr_tex = #(str_diff,str_bump,str_opacity,str_spec)	
			--for t in arr_tex do (print ((t as string) + "\r\n"))
		)
	)
	
	on execute do	
	(
		
		try(destroyDialog  ::RL_ClothingExporter)catch()
		
		rollout RL_ClothingExporter "Clothing Exporter"
		(
			on   RL_ClothingExporter open do
			( try() catch())
				 
			on  RL_ClothingExporter close do
			(try() catch())
				 
            group  "Output Path" 
			(
				dropdownlist ddl_paths   width:260 height:20 items:#(GetDir #export) tooltip:"" across:2
			 )
			button btn_selectPath "..." width:25 height:20 offset:[60,0]
			button btn_export "Export Selected Char" width:120 height:25 offset:[90,10]
			button btn_killPV "Clear PV" width:80 height:25 offset:[-20,-30]
			 
			
				
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
				print OutputArr[1]
				ddl_paths.items = OutputArr
				ddl_paths.selection = 1 
				print OutputArr[1]
				/*
				str_newFolder = fn_reverseStr ( substring (fn_reverseStr (filterstring ( substring maxfilename 2 100 ) ".")[1]) 6 100 )				
				str_exportPath = OutputArr[1] + @"\" + str_newFolder
				makedir str_exportPath all:true
				str_texPath = str_exportPath + @"\textures" 
				makedir str_texPath all:true
				*/
			 )
			 
			  
			on btn_export pressed do 
			(
				arrBip001= #()
				arrExport = #()
				objSelected = $
				if ((classof objSelected) == PolyMeshObject) then
				(
						
					if selection.count > 0 then
					(
						try(
								OutputArr = ::RL_ClothingExporter.ddl_paths.items
								--::RL_ClothingExporter.ddl_paths.selection = 1 
								
								--str_newFolder = fn_reverseStr ( substring (fn_reverseStr (filterstring ( substring (selection[1].name as string) 2 100 ) ".")[1]) 6 100 )	
								str_newFolder = substring (selection[1].name as string) 2 100						
								--str_exportPath = OutputArr[1] + @"\" + str_newFolder
								str_exportPath = ::RL_ClothingExporter.ddl_paths.items[::RL_ClothingExporter.ddl_paths.selection] + @"\" + str_newFolder
								makedir str_exportPath all:true
								str_texPath = str_exportPath + @"\textures" 
								makedir str_texPath all:true
								
								select $Bip001...*
								arrBip001 =  getCurrentSelection()
								arrExport = arrBip001
								appendifunique arrExport objSelected
								select arrExport
								--print (fn_rename objSelected)
								fn_rename objSelected
								
								Filename = str_exportPath + "\\" + newName + ".fbx"
								exportfile Filename #noPrompt selectedOnly:TRUE 
								
								fn_getTexArr objSelected
								
								for t in arr_tex where ( t != undefined ) do 
								(
									str_texName = (filterstring t @"\")[(filterstring t @"\").count]
									print (str_texPath  + @"\" + str_texName + "\r\n")
									print (t + "\r\n")
									copyfile t (str_texPath  + @"\" + str_texName)
								 )
							) catch()
					 )
				 )	  
			 )
			 
			 on btn_killPV pressed do
			 (
				 fn_deletePView()
				if (str_correctLog != "" ) then (messageBox str_correctLog;str_correctLog = "") else (messageBox "No particle view found.")	
			  )
			 
			on ddl_paths selected i do
			(
				arr_exportPath = ddl_paths.items[i]
			 )
		 )
		 
		 
		createdialog  RL_ClothingExporter width:320 height:110 lockHeight:false lockWidth:false
		 
	 )
)