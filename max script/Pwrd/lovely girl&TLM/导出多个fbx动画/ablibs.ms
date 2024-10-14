
--global ablibs_enabled
--if ablibs_enabled == undefined then
(
	global logStream
	global fn_createCheckLog
	global fn_checkDialog
	global fn_resetScene
	global fn_reverseStr
	global fn_checkSpace
	global fn_checkGamma
	global fn_compareCase
	global getFilesRecursive
	global fn_checkKeys
	global fn_comparePolyCenterNormal
	global fn_findPolyDupFaces
	global fn_checkUnitGrid
	global fn_checkIsoVerts
	global fn_DeleteIsoMapVerts
	global fn_checkTransform
	global fn_findDoubleVerts
	global fn_deleteKeys
		
	
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
		
		case of
		(
			(checkGenre == 1 and isPlayer == true): logGenre = "CHAR(Player)"
			(checkGenre == 1 and isWardrobe == true ): logGenre = "CHAR(Wardrobe)"
			--(checkGenre == 1 and isWardrobe == false and isPlayer == false ): logGenre = "CHAR(Boss_Monster)"
			(checkGenre == 1 and isSidekick == true ): logGenre = "CHAR(sidekick)"
			(checkGenre == 1 and isGeneric == true ): logGenre = "CHAR(monster_npc_boss_sidekickWeapon)"
			(checkGenre == 2 ): logGenre = "Weapon"
			(checkGenre == 3 ): logGenre = "Environment"
			Default: logGenre = "CHAR"
		 )
		
		log_file = (GetDir #export)+ "\\" + timeStrMod + "_" + logGenre + ".txt"

		logStream = createfile log_file
		format "% Assets Check Log :\n(%)\n\n" logGenre timeStrMod2 to:logStream
	)	
	
	fn fn_checkDialog = 
	(
		local hwnd = dialogMonitorOps.getWindowHandle()
		local hwnd2 = UIAccessor.GetFirstChildWindow hwnd
		local hwnd3 = UIAccessor.GetNextWindow hwnd2
		--print (UIAccessor.GetWindowText hwnd3)
		--print ("hwnd2 = " + (( UIAccessor.GetWindowText hwnd2) as string ))
		--print "t1.1"
		local dialogTitle = uiAccessor.getWindowText hwnd

		--print "t1.2"
		try(
			if (dialogTitle != undefined) 
			 then (
						if ((UIAccessor.GetWindowText hwnd3) == "·ñ(&N)" ) then 
						(	UIAccessor.PressButton hwnd3	)
						 
						if ((UIAccessor.GetWindowText hwnd2) == "&Yes" ) then 
						(	UIAccessor.PressButton hwnd2	)
						--if(dialogTitle == "Unwrap UVW") then (UIAccessor.PressDefaultButton() hwnd)
					)
			 ) catch()
		true
	 )

	fn fn_resetScene  =	 
	(	
		dialogMonitorOps.interactive = false
		dialogMonitorOps.unregisterNotification id:#test
		dialogMonitorOps.registerNotification fn_checkDialog id:#test
		dialogMonitorOps.enabled = true
		max reset file
		dialogMonitorOps.enabled = false
		Print "scene reset"
	 )	

	
	fn fn_checkTransform myMesh = 
	(
		if myMesh.transform.row1 != (matrix3 1).row1 or \
		myMesh.transform.row2 != (matrix3 1).row2 or \
		myMesh.transform.row3 != (matrix3 1).row3 or \
		myMesh.transform.row4 != (matrix3 1).row4
		then format "\tThe transform(%) of \"%\" is incorrect.\n" (myMesh.transform as string) (myMesh.name as string) to:logStream
	)		 
	 
	 
	fn getFilesRecursive root pattern =
	(
		dir_array = GetDirectories (root +"*")
		for d in dir_array do
		join dir_array (GetDirectories (d +"*"))
		my_files = #()

		for i= 1 to dir_array.count do
		(
			if (findstring dir_array[i] "reference\\") == undefined and \
			(findstring dir_array[i] "work\\") == undefined and \
			(findstring dir_array[i] "max\\") == undefined
			do (join my_files (getFiles (dir_array[i] + pattern))) 
		 )				
		my_files
	)
		
	fn fn_reverseStr inputStr =
	(
		newStrSep = #()
		for i = 1 to inputStr.count do (newStrSep[i] = inputStr[inputStr.count - i + 1])
		newStr = ""
		return (for i = 1 to newStrSep.count collect (newStr += newStrSep[i]))[inputStr.count]
	)	 
	
	fn fn_checkSpace a =
	(
		if (filterstring a " ").count > 1 then (format "\n\tThe name of \"%\" CONTAINS SPACE(s).\r\n" a to:logStream) 
	)
	
			
	fn fn_checkGamma = 
	(
		currentGamma = IDisplayGamma.colorCorrectionMode as string
		if currentGamma != "none" then
		(
			--IDisplayGamma.colorCorrectionMode = #none ;
			format "\tThe Gamma/LUT mode was \"%\".Please adjust it to \"NONE\".\n" currentGamma to:logStream
		) 
	)
			
	
	fn fn_compareCase myStr testGenre testAsset = 
	(
		lowerCaseGroup = "abcdefghijklmnopqrstuvwxyz"
		upperCaseGroup = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			
		if tolower myStr != myStr then
		(	
			for i = 1 to myStr.count do
			(
				tmpStr = substring myStr 1 i
				ModTmpStr = tolower tmpStr
				if ModTmpStr[i] != tmpStr[i] do
				(format "\tThe %th character \"%\" in \"%\" is in UPPER CASE.\n" (i as string) (tmpStr[i] as string) (testAsset as string) to:logStream)
			)	
		) 
	)
	
	
		
	fn fn_checkKeys obj= 
	(
		if numKeys obj.scale.controller != 0 then
		(
			for i = 1 to (numKeys obj.scale.controller) do
			(
				format "\tThere is a REDUNDANT SCALE KEY on % of timeslider.\n" (getkeytime obj.scale.controller i as string) to:logStream
			)
		)
		
		if numKeys obj.rotation.controller != 0 do
		(
			for i = 1 to (numKeys obj.rotation.controller) do
			(
				format "\tThere is a REDUNDANT ROTATION KEY on % of timeslider.\n" (getkeytime obj.rotation.controller i as  string) to:logStream
			)
		)
	   
		if numKeys obj.position.controller != 0 do
		(
			for i = 1 to (numKeys obj.position.controller) do
			(
				format "\tThere is a REDUNDANT POSITION KEY on % of timeslider.\n" (getkeytime obj.position.controller i as string) to:logStream
			)
		)
	)
	
	
	fn fn_comparePolyCenterNormal arrFace arrNorm = 
	(
		local invNorm, index
		local numDupFaces = 0
		for i = 1 to ArrFace.count 
			do 
			(
				index = findItem arrFace arrFace[i];
				if index != 0 and index != i
					then 
						(
							local invNorm = (arrNorm[index]*[-1,-1,-1])
							if (arrNorm[i] == arrNorm[index]) or (arrNorm[i] == invNorm) 
								then 
									(
									numDupFaces += 1
									format "\tThere are OVERLAPPING FACES ON THIS POSITION: % \n" ((arrFace[i]) as string) to:logStream											
									)
						)
			)
		--if numDupFaces > 0 do format " There are %  sets of OVERLAPPING FACES!\n\n" (numDupFaces as string) to:logStream
		"done"
	)
		

	fn fn_findPolyDupFaces obj = 
	(
		
		local arrFace = #()
		local arrNorm = #()
		
		for i = 1 to obj.faces.count 
			do
			(
				arrFace[i] = (polyOp.getSafeFaceCenter obj i)
				arrNorm[i] = (polyOp.getFaceNormal obj i)
			 )
		fn_comparePolyCenterNormal arrFace arrNorm
	)
	
	
	fn fn_checkUnitGrid = 
	(
		if units.SystemType != #centimeters
			then(format "\tUnit SYSTEM TYPE IS NOT CENTIMETERS!\n" to:logStream)
				else
					(
						if units.SystemScale != 1.0
							then (format "\tUnit SYSTEM SCALE IS NOT 1.0!\n" to:logStream)
					 )
		
	   if (getGridSpacing() != 10) 
			then(format "\tGRID SPACING IS NOT 10.!\n" to:logStream)
		
	 )
	 
	 	
	
	fn fn_checkIsoVerts testedMesh = 
	(
		hasIsoVerts = false
		isoVertsArray_ENV = #() 
		resultType_ENV = IsolatedVertices.Check currentTime testedMesh &isoVertsArray_ENV
		if (isoVertsArray_ENV.count != 0) do 
		(
			format "\tTHERE ARE ISOLATED VERTICES : %\n" (isoVertsArray_ENV as string) to:logStream
			hasIsoVerts = true
			
			)
	)
	
	fn fn_DeleteIsoMapVerts obj = 
	(
		bool_hasIsoMapVerts = obj.DeleteIsoMapVerts()
		if bool_hasIsoMapVerts == true do
			format "\tIsolated Map Verts Detected!\r\n" to:logStream
	 )
	 


		

	fn fn_findDoubleVerts obj =
	(
		arrVert = #()
		free arrVert
		for i = 1 to obj.numverts do
		(
		 arrVert[i] = polyop.getvert obj i
		 )
		b = 0		
		for i = 1 to arrVert.count do
		(
		 index = finditem arrVert arrVert[i];
		 if index != i do 
			 (
				arr_facesA = (polyOp.getfacesusingvert obj i) as array;
				arr_facesB = (polyOp.getfacesusingvert obj index) as array;
				arr_elementA = polyOp.getelementsusingface obj arr_facesA[1]
				arr_elementB = (polyOp.getelementsusingface obj arr_facesB[1])
				 
				if (arr_elementA == arr_elementB) do
				(
				 b += 1;
				 format "\tTHERE ARE OVERLAPPING VERTICES ON THIS POSITION:% \n" ((arrVert[i]) as string) to:logStream
				 )
			 )
		 )
		if b >0 do(format "\tTHERE ARE % OVERLAPPING VERTICES.\r\n" (b as string) to:logStream)
	) 
	
	fn fn_deleteKeys = 
	(
		for a in objects where (classof a == Editable_Mesh or classof a == Editable_Poly) do
		(
			deletekeys a[3][1].keys #allkeys
			deletekeys a[3][2].keys #allkeys
			deletekeys a[3][3].keys #allkeys
		)
	 )

	Print "ablibs loaded"
	--ablibs_enabled = true
)