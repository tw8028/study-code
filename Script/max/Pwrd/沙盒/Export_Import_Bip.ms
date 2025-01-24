try
(
	destroydialog Export_Import_Bip
)
catch
(
)

rollout Export_Import_Bip "导入导出骨骼" width:480 height:184
(
	-- controller --
	groupBox	grp			""				pos:[8,0]		width:466	height:80
	editText	edt_export	""				pos:[76,20]		width:344	height:17
	label		lb_export	"用于导出："		pos:[19,21]		width:61	height:17
	button		btn_export	"..."			pos:[427,20]	width:30	height:17
	editText	edt_import	""				pos:[76,48]		width:344	height:17
	label		lb_import	"用于导入："		pos:[19,49]		width:61	height:17
	button		btn_import	"..."			pos:[427,48]	width:30	height:17
	groupBox	grp_out		""				pos:[19,89]		width:444	height:87
	groupBox	grp_inner	""				pos:[22,92]		width:438	height:81
	button		btn_execute	"开始换骨大法"	pos:[25,101]	width:432	height:69	enabled:true
	
	-- function --
	fn MakePathExist strPath =
	(
		arrPathPart = filterstring strPath @"\/"
		
		nLength = arrPathPart.count
		if getFilenameType (filenamefrompath strPath) != "" do
		(
			nLength = arrPathPart.count - 1
		)
		
		strPath = ""
		for i = 1 to nLength do
		(
			strPath = strPath + arrPathPart[i] + @"\"
			if not doesfileexist strPath do
			(
				makedir strPath
			)
		)
	)
	
	-- event --
	on btn_export pressed do
	(
		folderBrowserDialog = dotnetobject "System.Windows.Forms.FolderBrowserDialog"
		folderBrowserDialog.Description = "请选择文件夹"
		
		dialogResult = dotnetclass "System.Windows.Forms.DialogResult"
		if (folderBrowserDialog.ShowDialog() == dialogResult.OK) do
		(
			edt_export.text = trimright folderBrowserDialog.SelectedPath "\\" + "\\"
		)
	)
	
	on btn_import pressed do
	(
		fileBrowserDialog					= dotnetobject "System.Windows.Forms.OpenFileDialog"
		fileBrowserDialog.Filter			= "max文件|*.max";
		fileBrowserDialog.RestoreDirectory	= true;
		
		dialogResult = dotnetclass "System.Windows.Forms.DialogResult"
		if (fileBrowserDialog.ShowDialog() == dialogResult.OK) do
		(
			edt_import.text = fileBrowserDialog.FileName
		)
	)
	
	on btn_execute pressed do
	(
		if edt_export.text == "" do
		(
			messagebox "导出路径不能为空"
			return 0
		)
		
		if not doesfileexist edt_import.text do
		(
			messagebox "标准max文件不存在，请检查"
			return 0
		)
		
		edt_export.text = trimright edt_export.text "\\" + "\\"
		Directory		= dotnetclass "System.IO.Directory"
		SearchOption	= dotnetclass "System.IO.SearchOption"
		arrFilePath		= Directory.GetFiles edt_export.text "*.max" SearchOption.AllDirectories
		if (arrFilePath.count == 0) do
		(
			messagebox "导出目录下没有发现max文件"
			return 0
		)
		
		-- 保存bip文件
		strExportPath = edt_export.text + @"NewMotion\"
		for strFilePath in arrFilePath do
		(
			-- 生成bip文件
			loadMaxFile strFilePath quiet:true
			strFileName = (filterstring maxfilename ".")[1]
			strBipPath = strExportPath + strFileName + "_" + (animationRange.start as string) + (animationRange.end as string) + ".bip"
			MakePathExist strBipPath
			
			arrBip = for a in objects where (classof a == biped_object) collect a	-- 使用第一个bipobject 条件是只能有一套骨骼
			biped.saveBipFile arrBip[1].controller strBipPath
			
			-- 根据标准max文件配合bip文件生成新max文件
			loadmaxfile edt_import.text quiet:true
			arrBip = for a in objects where (classof a == biped_object) collect a	-- 使用第一个bipobject 条件是只能有一套骨骼
			
			biped.loadBipFile arrBip[1].controller strBipPath
			strBipName		= getFilenameFile strBipPath
			arrNamePart		= filterstring strBipName "_"
			strRange		= arrNamePart[arrNamePart.count]
			arrRange		= filterstring strRange "f"
			animationRange	= (interval (arrRange[1] as Time) (arrRange[2] as Time))
			
			strMaxName = substring strBipName 1 (strBipName.count - strRange.count - 1)
			strMaxPath = (getFilenamePath strBipPath) + strMaxName + ".max"
			saveMaxFile strMaxPath quiet:true
			deletefile strBipPath
		)
	)
)
createdialog Export_Import_Bip
