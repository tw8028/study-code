--Animation
try(DestroyDialog SandBoxExportFbx)catch()
rollout SandBoxExportFbx "SandBoxExportFbx " width:500 height:309
(

	local m_maxFileArray
	local finalList = #()
	local newFinalList = #()
	
	button btn_getFilePath "LoadMaxPath" pos:[50,244] width:133 height:34 toolTip:""
	multiListBox mlbSelectedList "List:" pos:[15,47] width:450 height:10
	button btn_run "StartBacth" pos:[332,244] width:133 height:34 enabled:true toolTip:""
	spinner AniFramerate "AniFramerate£º" pos:[64,13] width:134 height:16 range:[0,60,24] type:#integer scale:1
	label lbl_count "" pos:[15,210] width:79 height:20
	button remove "Remove" pos:[192,244] width:133 height:34 toolTip:""
	
	Fn CleanOutRangeKeys inputObject = 
	(
	    startTime = AnimationRange.Start
	    endTime = AnimationRange.End
	    for i = 1 to inputObject.numSubs do
	    (
	        tempSubAnim = GetSubAnim inputObject i
	        tempController = tempSubAnim.Controller
	        
	        if tempController != undefined do
	        (
	            tempKeyList = tempController.Keys
	            
	            outEndKeysIndex = for i = 1 to tempKeyList.Count where tempKeyList[i].Time > endTime collect i
	            if outEndKeysIndex.Count > 0 do for i = 1 to outEndKeysIndex.Count do DeleteKey tempKeyList tempKeyList.count
	            
	            outStartKeysIndex = for i = 1 to tempKeyList.Count where  tempKeyList[i].Time < startTime collect i
	            for i = 1 to outStartKeysIndex.Count do DeleteKey tempKeyList 1
	        )
	        if tempSubAnim.numSubs > 0 do CleanOutRangeKeys tempSubAnim
	    )
	)
	fn selectionEnd=(
		for i = 1 to mlbSelectedList.items.count do
			(
				if mlbSelectedList.selection[i] == true and ( (finditem finalList mlbSelectedList.items[i]) == 0 ) do
				(append finalList mlbSelectedList.items[i])
				if mlbSelectedList.selection[i] == false and  ( (finditem finalList mlbSelectedList.items[i]) != 0 ) do
				
				(
					if finalList.count == 1 then ( free finalList  ) else 
					(deleteitem finalList (finditem finalList mlbSelectedList.items[i])	)
				)
			
			)			
		)

	fn updateCount =(
		selectionEnd()
		lbl_count.text = "TotalNumber:" +(mlbSelectedList.items.count as string)
	)
	
	fn ReadMaxFile =
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
			if fileArray !=  undefined then
			(
				mlbSelectedList.items = fileArray	
			)
			updateCount()

		)
	
	on btn_getFilePath pressed do
	(
		ReadMaxFile()
	)
	on btn_run pressed do
	(
		
		if mlbSelectedList.items.count != 0 then
		(
			
			for tp_Mf in mlbSelectedList.items do
			(
				
				loadmaxfile tp_Mf Quiet:true
	
				filepath = getfilenamepath tp_Mf	
				filename =getfilenamefile tp_Mf
	
				
				start = animationRange.start
				end =animationRange.end
				for b in objects do
				(
					if classof b==BoneGeometry then
					(
						bhc =b.controller
						num= numkeys bhc
						print b.name
						if num <=1 then
						(
							for en=0 to end  do
							(
								addnewkey bhc en
							)
						)
					)
				)
				actionMan.executeAction 0 "40021"  -- Selection: Select All
				
				FbxExporterSetParam "BakeAnimation" true "BakeFrameStart" animationRange.start "BakeFrameEnd" animationRange.end 
				
	
				myfbxpath =filepath+"temp/"+filename+".fbx"
				makedir myfbxpath
	            --exportFile (myfbxpath) #noPrompt selectedOnly:true  using:FBXEXP 
				exportFile (myfbxpath) #noPrompt  selectedOnly:true using:FBXEXP 		
				gc()
				resetMaxFile #noPrompt
				
				FBXImportersetParam "KeepFrameRate" true
				loadmaxfile myfbxpath Quiet:true #noPrompt
				
				
				for r in objects do
				(
					if(findstring r.name "Nub"!=undefined) then deselect r
					
					movekeys r.controller -start
				
				)
				for g in selection do
				(
					print g.name
				)
				FrameRate = AniFramerate.value
				animationRange = interval 0 (end-start) 
				for tempObject in Objects as Array do CleanOutRangeKeys tempObject
				FbxExporterSetParam "BakeAnimation" true  "BakeResampleAnimation" false 
				myfbxpath =filepath+"temp/"+filename+".fbx"
				
				exportFile (myfbxpath) #noPrompt selectedOnly:true  using:FBXEXP 		
				gc()
				resetMaxFile #noPrompt	

			)
						
		)
		
	)
	on remove pressed do
	(
	
		for i = 1 to mlbSelectedList.items.count do
			(
				if mlbSelectedList.selection[i] == false do
					(
						append newFinalList mlbSelectedList.items[i]
					)							
			)
	
		mlbSelectedList.items = newFinalList
		print newFinalList.count
		print newFinalList
		newFinalList = #()
		print newFinalList
		updateCount()
		
	)
)
createDialog SandBoxExportFbx