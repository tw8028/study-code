//Maya ASCII 2022 scene
//Name: ZL_gr_ts_swimring01_002.0006.ma
//Last modified: Mon, Aug 07, 2023 11:00:37 AM
//Codeset: 936
requires "fbxmaya" "2020.1";
file -rdi 1 -ns "ZL_gr_hd_bj_coconut01_rig" -rfn "ZL_gr_hd_bj_coconut01_rigRN"
		 -op "v=0;" -typ "mayaAscii" "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/啫喱个人空间道具绑定/ZL_gr_hd_bj_coconut01_rig.ma";
file -rdi 1 -ns "ZL_gr_hd_bj_swimring01_rig" -rfn "ZL_gr_hd_bj_swimring01_rigRN"
		 -op "v=0;" -typ "mayaAscii" "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/啫喱个人空间道具绑定/ZL_gr_hd_bj_swimring01_rig.ma";
file -rdi 1 -ns "ZL_avatar_2022_rig" -rfn "ZL_avatar_2022_rigRN" -op "v=0;"
		 -typ "mayaAscii" "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/ZL_avatar/ZL_avatar_2022_rig.ma";
file -rdi 1 -ns "ZL_zt_book01_rig" -rfn "ZL_zt_book01_rigRN" -op "v=0;" -typ
		 "mayaAscii" "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/啫喱状态空间道具绑定/ZL_zt_book01_rig.ma";
file -rdi 1 -ns "cam_gr" -rfn "cam_grRN" -op "v=0;" -typ "FBX export" "D:/ZL_gr_ts_swimring01_001/cam_gr.fbx";
file -r -ns "ZL_gr_hd_bj_coconut01_rig" -dr 1 -rfn "ZL_gr_hd_bj_coconut01_rigRN"
		 -op "v=0;" -typ "mayaAscii" "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/啫喱个人空间道具绑定/ZL_gr_hd_bj_coconut01_rig.ma";
file -r -ns "ZL_gr_hd_bj_swimring01_rig" -dr 1 -rfn "ZL_gr_hd_bj_swimring01_rigRN"
		 -op "v=0;" -typ "mayaAscii" "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/啫喱个人空间道具绑定/ZL_gr_hd_bj_swimring01_rig.ma";
file -r -ns "ZL_avatar_2022_rig" -dr 1 -rfn "ZL_avatar_2022_rigRN" -op "v=0;" -typ
		 "mayaAscii" "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/ZL_avatar/ZL_avatar_2022_rig.ma";
file -r -ns "ZL_zt_book01_rig" -dr 1 -rfn "ZL_zt_book01_rigRN" -op "v=0;" -typ "mayaAscii"
		 "D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//rig/啫喱状态空间道具绑定/ZL_zt_book01_rig.ma";
file -r -ns "cam_gr" -dr 1 -rfn "cam_grRN" -op "v=0;" -typ "FBX export" "D:/ZL_gr_ts_swimring01_001/cam_gr.fbx";
requires maya "2022";
requires "stereoCamera" "10.0";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "4.2.1";
requires "rpmaya" "2.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202102181415-29bfc1879c";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "AD871FEB-49BA-E286-AE2F-4090543C70CB";
createNode transform -s -n "persp";
	rename -uid "D1185555-41F2-8F81-39E6-32944393C605";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 262.64329880345662 80.181377593592032 428.27927969909564 ;
	setAttr ".r" -type "double3" -7.5383527300759088 -688.19999999994252 4.6778768480285279e-16 ;
	setAttr ".rp" -type "double3" 0 4.2632564145606011e-14 0 ;
	setAttr ".rpt" -type "double3" 3.4631004414420527e-13 -4.5787431173457394e-14 -2.743193207994553e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "741D44BD-4E8C-D7F0-A748-D996850C3EB9";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 493.80182797855946;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "293A4346-4D36-80C4-A258-9183F34E7B93";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "D8799BC9-43B8-E8CB-2C4F-8B977681A9C4";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 609.82708101102628;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "0FFFCE2D-4C24-9DE6-D531-50A9388AA97A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "1FA894F8-49DC-6C68-AECF-8DA4B505259D";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 611.55340453091424;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "6B6F664C-416B-2226-5882-0BB50B968F40";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 46.011269306439836 -31.11428939669554 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "0A8DF386-49F4-B74B-B151-18BBCF2EDA19";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 368.3075412285155;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode fosterParent -n "ZL_gr_hd_bj_coconut01_rigRNfosterParent1";
	rename -uid "3B4375FF-43D7-8B26-E0F2-2BBDC272E9FD";
createNode parentConstraint -n "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1" 
		-p "ZL_gr_hd_bj_coconut01_rigRNfosterParent1";
	rename -uid "C57C548A-41FB-83ED-8E24-BBB52FC4541A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "IKArm_RW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -7.7346700367467633 -8.1053115098368593 -1.5694380541163255 ;
	setAttr ".tg[0].tor" -type "double3" -3.9805831558621581 -22.736377333150479 -157.88475530000727 ;
	setAttr ".lr" -type "double3" -41.542798731882456 -92.993313831274165 41.680662686050809 ;
	setAttr ".rst" -type "double3" -35.380786148591554 48.225421290367166 30.176168810883116 ;
	setAttr ".rsrr" -type "double3" -8.7936590506648145 -102.38922115124662 10.136237055455375 ;
	setAttr -k on ".w0";
createNode fosterParent -n "ZL_avatar_2022_rigRNfosterParent1";
	rename -uid "B367FDC5-4EAB-F5B5-793A-D7B743BB85C4";
createNode parentConstraint -n "world_ctrl_parentConstraint1" -p "ZL_avatar_2022_rigRNfosterParent1";
	rename -uid "D05E8036-4A0F-A2B5-8B77-74A58F56B7C3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "ZL_gr_hd_bj_swimring01_Circle_01W0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 18.261191202969503 0.93731699854812744 2.4245683361081758 ;
	setAttr ".tg[0].tor" -type "double3" 0 116.57146156980953 0 ;
	setAttr ".lr" -type "double3" -0.13852409901511029 13.572108773591161 -1.050063428751115 ;
	setAttr ".rst" -type "double3" -9.1280338657942295 0.53731699854812742 3.7086379565327618 ;
	setAttr ".rsrr" -type "double3" 0 4.4310385958276113 0 ;
	setAttr -k on ".w0";
createNode fosterParent -n "ZL_zt_book01_rigRNfosterParent1";
	rename -uid "C65F15DD-42B9-F891-55A6-0E97E1F66AB2";
createNode parentConstraint -n "ZL_zt_book01_root_parentConstraint1" -p "ZL_zt_book01_rigRNfosterParent1";
	rename -uid "D77CE02D-41D6-1C61-0F50-7C960DCB10AA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "IKArm_LW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 26.529377342022268 -16.140422889617227 10.040671375101471 ;
	setAttr ".tg[0].tor" -type "double3" -7.733329644541767 -75.067548600705379 155.21211056549856 ;
	setAttr ".lr" -type "double3" -26.687659479471858 62.313245661075634 0.67609154304139718 ;
	setAttr ".rst" -type "double3" 52.533967693812457 87.442934528438329 6.2692053861783616 ;
	setAttr ".rsrr" -type "double3" -19.796952505869498 68.123959479173166 6.5122394349567667 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "FA5334B9-49F1-1531-66ED-7E998A5E2CBD";
	setAttr -s 16 ".lnk";
	setAttr -s 16 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "635B29BD-40CA-83A9-AED1-ACB87AD85EDB";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 1 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "C8BE2734-4CB5-D2ED-0E02-64B4CA128DBA";
createNode displayLayerManager -n "layerManager";
	rename -uid "B0BC643C-417A-6506-EF48-939292BB58EC";
	setAttr ".cdl" 3;
	setAttr -s 4 ".dli[1:3]"  1 2 3;
	setAttr -s 4 ".dli";
createNode displayLayer -n "defaultLayer";
	rename -uid "F42C30D0-4017-04A3-F9F7-B98A24ABC83A";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "8B33FB1A-4881-FB02-013B-109B3183E199";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "FF216D8D-498D-47AD-9E38-1F951E6C97D1";
	setAttr ".g" yes;
createNode reference -n "ZL_gr_hd_bj_coconut01_rigRN";
	rename -uid "085B4707-4C44-C2B4-0B6B-7ABA3D1ABA3E";
	setAttr -s 20 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"ZL_gr_hd_bj_coconut01_rigRN"
		"ZL_gr_hd_bj_coconut01_rigRN" 0
		"ZL_gr_hd_bj_coconut01_rigRN" 25
		0 "|ZL_gr_hd_bj_coconut01_rigRNfosterParent1|ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1" 
		"|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M" 
		"-s -r "
		2 "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig" "translate" " -type \"double3\" 0 0 0"
		
		2 "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_mod|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_mod_LOD1" 
		"visibility" " 0"
		2 "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_mod|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_mod_LOD2" 
		"visibility" " 0"
		2 "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01" 
		"rotate" " -type \"double3\" 0 0 0"
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.translateX" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[1]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.translateY" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[2]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.translateZ" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[3]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.rotateY" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[4]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.rotateX" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[5]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.rotateZ" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[6]" ""
		5 3 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.rotateOrder" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[7]" ""
		5 3 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.parentInverseMatrix" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[8]" ""
		5 3 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.rotatePivot" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[9]" ""
		5 3 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M.rotatePivotTranslate" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[10]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.translateX" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[11]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.translateY" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[12]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.translateZ" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[13]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.rotateX" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[14]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.rotateY" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[15]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.rotateZ" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[16]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.scaleX" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[17]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.scaleY" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[18]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.scaleZ" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[19]" ""
		5 4 "ZL_gr_hd_bj_coconut01_rigRN" "|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_rig|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle_M|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle01|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle03|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_grp04|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_1|ZL_gr_hd_bj_coconut01_rig:ZL_gr_hd_bj_coconut01_Circle04_2.visibility" 
		"ZL_gr_hd_bj_coconut01_rigRN.placeHolderList[20]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode reference -n "ZL_gr_hd_bj_swimring01_rigRN";
	rename -uid "B8CEAD0E-4FC3-0A56-FB46-4793BE7AA6DD";
	setAttr -s 59 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".phl[31]" 0;
	setAttr ".phl[32]" 0;
	setAttr ".phl[33]" 0;
	setAttr ".phl[34]" 0;
	setAttr ".phl[35]" 0;
	setAttr ".phl[36]" 0;
	setAttr ".phl[37]" 0;
	setAttr ".phl[38]" 0;
	setAttr ".phl[39]" 0;
	setAttr ".phl[40]" 0;
	setAttr ".phl[41]" 0;
	setAttr ".phl[42]" 0;
	setAttr ".phl[43]" 0;
	setAttr ".phl[44]" 0;
	setAttr ".phl[45]" 0;
	setAttr ".phl[46]" 0;
	setAttr ".phl[47]" 0;
	setAttr ".phl[48]" 0;
	setAttr ".phl[49]" 0;
	setAttr ".phl[50]" 0;
	setAttr ".phl[51]" 0;
	setAttr ".phl[52]" 0;
	setAttr ".phl[53]" 0;
	setAttr ".phl[54]" 0;
	setAttr ".phl[55]" 0;
	setAttr ".phl[56]" 0;
	setAttr ".phl[57]" 0;
	setAttr ".phl[58]" 0;
	setAttr ".phl[59]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"ZL_gr_hd_bj_swimring01_rigRN"
		"ZL_gr_hd_bj_swimring01_rigRN" 0
		"ZL_gr_hd_bj_swimring01_rigRN" 67
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_mod|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_mod_LOD1" 
		"visibility" " 0"
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_mod|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_mod_LOD2" 
		"visibility" " 0"
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root" 
		"visibility" " 1"
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01" 
		"visibility" " 1"
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01" 
		"scale" " -type \"double3\" 1 1 1"
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root.rotateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[1]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root.rotateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[2]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root.rotateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[3]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root.drawOverride" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[4]" ""
		5 3 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.translate" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[5]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.translateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[6]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.translateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[7]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.translateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[8]" ""
		5 3 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.rotatePivot" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[9]" ""
		5 3 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.rotatePivotTranslate" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[10]" ""
		5 3 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.rotate" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[11]" ""
		5 3 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.rotateOrder" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[12]" ""
		5 3 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.scale" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[13]" ""
		5 3 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.parentMatrix" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[14]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01.drawOverride" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[15]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.translateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[16]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.translateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[17]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.translateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[18]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.rotateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[19]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.rotateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[20]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.rotateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[21]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.scaleX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[22]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.scaleY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[23]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.scaleZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[24]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.visibility" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[25]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03.drawOverride" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[26]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.translateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[27]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.translateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[28]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.translateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[29]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.rotateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[30]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.rotateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[31]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.rotateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[32]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.scaleX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[33]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.scaleY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[34]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.scaleZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[35]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.visibility" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[36]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04.drawOverride" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[37]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.translateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[38]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.translateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[39]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.translateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[40]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.rotateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[41]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.rotateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[42]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.rotateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[43]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.scaleX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[44]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.scaleY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[45]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.scaleZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[46]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.visibility" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[47]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_03|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_04|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_05.drawOverride" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[48]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.translateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[49]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.translateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[50]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.translateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[51]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.rotateX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[52]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.rotateY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[53]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.rotateZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[54]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.scaleX" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[55]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.scaleY" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[56]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.scaleZ" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[57]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.visibility" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[58]" ""
		5 4 "ZL_gr_hd_bj_swimring01_rigRN" "|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_rig|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_root|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_01|ZL_gr_hd_bj_swimring01_rig:ZL_gr_hd_bj_swimring01_Circle_02.drawOverride" 
		"ZL_gr_hd_bj_swimring01_rigRN.placeHolderList[59]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode reference -n "ZL_avatar_2022_rigRN";
	rename -uid "DE063769-461A-40B6-2F93-0D9330429374";
	setAttr -s 703 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".phl[31]" 0;
	setAttr ".phl[32]" 0;
	setAttr ".phl[33]" 0;
	setAttr ".phl[34]" 0;
	setAttr ".phl[35]" 0;
	setAttr ".phl[36]" 0;
	setAttr ".phl[37]" 0;
	setAttr ".phl[38]" 0;
	setAttr ".phl[39]" 0;
	setAttr ".phl[40]" 0;
	setAttr ".phl[41]" 0;
	setAttr ".phl[42]" 0;
	setAttr ".phl[43]" 0;
	setAttr ".phl[44]" 0;
	setAttr ".phl[45]" 0;
	setAttr ".phl[46]" 0;
	setAttr ".phl[47]" 0;
	setAttr ".phl[48]" 0;
	setAttr ".phl[49]" 0;
	setAttr ".phl[50]" 0;
	setAttr ".phl[51]" 0;
	setAttr ".phl[52]" 0;
	setAttr ".phl[53]" 0;
	setAttr ".phl[54]" 0;
	setAttr ".phl[55]" 0;
	setAttr ".phl[56]" 0;
	setAttr ".phl[57]" 0;
	setAttr ".phl[58]" 0;
	setAttr ".phl[59]" 0;
	setAttr ".phl[60]" 0;
	setAttr ".phl[61]" 0;
	setAttr ".phl[62]" 0;
	setAttr ".phl[63]" 0;
	setAttr ".phl[64]" 0;
	setAttr ".phl[65]" 0;
	setAttr ".phl[66]" 0;
	setAttr ".phl[67]" 0;
	setAttr ".phl[68]" 0;
	setAttr ".phl[69]" 0;
	setAttr ".phl[70]" 0;
	setAttr ".phl[71]" 0;
	setAttr ".phl[72]" 0;
	setAttr ".phl[73]" 0;
	setAttr ".phl[74]" 0;
	setAttr ".phl[75]" 0;
	setAttr ".phl[76]" 0;
	setAttr ".phl[77]" 0;
	setAttr ".phl[78]" 0;
	setAttr ".phl[79]" 0;
	setAttr ".phl[80]" 0;
	setAttr ".phl[81]" 0;
	setAttr ".phl[82]" 0;
	setAttr ".phl[83]" 0;
	setAttr ".phl[84]" 0;
	setAttr ".phl[85]" 0;
	setAttr ".phl[86]" 0;
	setAttr ".phl[87]" 0;
	setAttr ".phl[88]" 0;
	setAttr ".phl[89]" 0;
	setAttr ".phl[90]" 0;
	setAttr ".phl[91]" 0;
	setAttr ".phl[92]" 0;
	setAttr ".phl[93]" 0;
	setAttr ".phl[94]" 0;
	setAttr ".phl[95]" 0;
	setAttr ".phl[96]" 0;
	setAttr ".phl[97]" 0;
	setAttr ".phl[98]" 0;
	setAttr ".phl[99]" 0;
	setAttr ".phl[100]" 0;
	setAttr ".phl[101]" 0;
	setAttr ".phl[102]" 0;
	setAttr ".phl[103]" 0;
	setAttr ".phl[104]" 0;
	setAttr ".phl[105]" 0;
	setAttr ".phl[106]" 0;
	setAttr ".phl[107]" 0;
	setAttr ".phl[108]" 0;
	setAttr ".phl[109]" 0;
	setAttr ".phl[110]" 0;
	setAttr ".phl[111]" 0;
	setAttr ".phl[112]" 0;
	setAttr ".phl[113]" 0;
	setAttr ".phl[114]" 0;
	setAttr ".phl[115]" 0;
	setAttr ".phl[116]" 0;
	setAttr ".phl[117]" 0;
	setAttr ".phl[118]" 0;
	setAttr ".phl[119]" 0;
	setAttr ".phl[120]" 0;
	setAttr ".phl[121]" 0;
	setAttr ".phl[122]" 0;
	setAttr ".phl[123]" 0;
	setAttr ".phl[124]" 0;
	setAttr ".phl[125]" 0;
	setAttr ".phl[126]" 0;
	setAttr ".phl[127]" 0;
	setAttr ".phl[128]" 0;
	setAttr ".phl[129]" 0;
	setAttr ".phl[130]" 0;
	setAttr ".phl[131]" 0;
	setAttr ".phl[132]" 0;
	setAttr ".phl[133]" 0;
	setAttr ".phl[134]" 0;
	setAttr ".phl[135]" 0;
	setAttr ".phl[136]" 0;
	setAttr ".phl[137]" 0;
	setAttr ".phl[138]" 0;
	setAttr ".phl[139]" 0;
	setAttr ".phl[140]" 0;
	setAttr ".phl[141]" 0;
	setAttr ".phl[142]" 0;
	setAttr ".phl[143]" 0;
	setAttr ".phl[144]" 0;
	setAttr ".phl[145]" 0;
	setAttr ".phl[146]" 0;
	setAttr ".phl[147]" 0;
	setAttr ".phl[148]" 0;
	setAttr ".phl[149]" 0;
	setAttr ".phl[150]" 0;
	setAttr ".phl[151]" 0;
	setAttr ".phl[152]" 0;
	setAttr ".phl[153]" 0;
	setAttr ".phl[154]" 0;
	setAttr ".phl[155]" 0;
	setAttr ".phl[156]" 0;
	setAttr ".phl[157]" 0;
	setAttr ".phl[158]" 0;
	setAttr ".phl[159]" 0;
	setAttr ".phl[160]" 0;
	setAttr ".phl[161]" 0;
	setAttr ".phl[162]" 0;
	setAttr ".phl[163]" 0;
	setAttr ".phl[164]" 0;
	setAttr ".phl[165]" 0;
	setAttr ".phl[166]" 0;
	setAttr ".phl[167]" 0;
	setAttr ".phl[168]" 0;
	setAttr ".phl[169]" 0;
	setAttr ".phl[170]" 0;
	setAttr ".phl[171]" 0;
	setAttr ".phl[172]" 0;
	setAttr ".phl[173]" 0;
	setAttr ".phl[174]" 0;
	setAttr ".phl[175]" 0;
	setAttr ".phl[176]" 0;
	setAttr ".phl[177]" 0;
	setAttr ".phl[178]" 0;
	setAttr ".phl[179]" 0;
	setAttr ".phl[180]" 0;
	setAttr ".phl[181]" 0;
	setAttr ".phl[182]" 0;
	setAttr ".phl[183]" 0;
	setAttr ".phl[184]" 0;
	setAttr ".phl[185]" 0;
	setAttr ".phl[186]" 0;
	setAttr ".phl[187]" 0;
	setAttr ".phl[188]" 0;
	setAttr ".phl[189]" 0;
	setAttr ".phl[190]" 0;
	setAttr ".phl[191]" 0;
	setAttr ".phl[192]" 0;
	setAttr ".phl[193]" 0;
	setAttr ".phl[194]" 0;
	setAttr ".phl[195]" 0;
	setAttr ".phl[196]" 0;
	setAttr ".phl[197]" 0;
	setAttr ".phl[198]" 0;
	setAttr ".phl[199]" 0;
	setAttr ".phl[200]" 0;
	setAttr ".phl[201]" 0;
	setAttr ".phl[202]" 0;
	setAttr ".phl[203]" 0;
	setAttr ".phl[204]" 0;
	setAttr ".phl[205]" 0;
	setAttr ".phl[206]" 0;
	setAttr ".phl[207]" 0;
	setAttr ".phl[208]" 0;
	setAttr ".phl[209]" 0;
	setAttr ".phl[210]" 0;
	setAttr ".phl[211]" 0;
	setAttr ".phl[212]" 0;
	setAttr ".phl[213]" 0;
	setAttr ".phl[214]" 0;
	setAttr ".phl[215]" 0;
	setAttr ".phl[216]" 0;
	setAttr ".phl[217]" 0;
	setAttr ".phl[218]" 0;
	setAttr ".phl[219]" 0;
	setAttr ".phl[220]" 0;
	setAttr ".phl[221]" 0;
	setAttr ".phl[222]" 0;
	setAttr ".phl[223]" 0;
	setAttr ".phl[224]" 0;
	setAttr ".phl[225]" 0;
	setAttr ".phl[226]" 0;
	setAttr ".phl[227]" 0;
	setAttr ".phl[228]" 0;
	setAttr ".phl[229]" 0;
	setAttr ".phl[230]" 0;
	setAttr ".phl[231]" 0;
	setAttr ".phl[232]" 0;
	setAttr ".phl[233]" 0;
	setAttr ".phl[234]" 0;
	setAttr ".phl[235]" 0;
	setAttr ".phl[236]" 0;
	setAttr ".phl[237]" 0;
	setAttr ".phl[238]" 0;
	setAttr ".phl[239]" 0;
	setAttr ".phl[240]" 0;
	setAttr ".phl[241]" 0;
	setAttr ".phl[242]" 0;
	setAttr ".phl[243]" 0;
	setAttr ".phl[244]" 0;
	setAttr ".phl[245]" 0;
	setAttr ".phl[246]" 0;
	setAttr ".phl[247]" 0;
	setAttr ".phl[248]" 0;
	setAttr ".phl[249]" 0;
	setAttr ".phl[250]" 0;
	setAttr ".phl[251]" 0;
	setAttr ".phl[252]" 0;
	setAttr ".phl[253]" 0;
	setAttr ".phl[254]" 0;
	setAttr ".phl[255]" 0;
	setAttr ".phl[256]" 0;
	setAttr ".phl[257]" 0;
	setAttr ".phl[258]" 0;
	setAttr ".phl[259]" 0;
	setAttr ".phl[260]" 0;
	setAttr ".phl[261]" 0;
	setAttr ".phl[262]" 0;
	setAttr ".phl[263]" 0;
	setAttr ".phl[264]" 0;
	setAttr ".phl[265]" 0;
	setAttr ".phl[266]" 0;
	setAttr ".phl[267]" 0;
	setAttr ".phl[268]" 0;
	setAttr ".phl[269]" 0;
	setAttr ".phl[270]" 0;
	setAttr ".phl[271]" 0;
	setAttr ".phl[272]" 0;
	setAttr ".phl[273]" 0;
	setAttr ".phl[274]" 0;
	setAttr ".phl[275]" 0;
	setAttr ".phl[276]" 0;
	setAttr ".phl[277]" 0;
	setAttr ".phl[278]" 0;
	setAttr ".phl[279]" 0;
	setAttr ".phl[280]" 0;
	setAttr ".phl[281]" 0;
	setAttr ".phl[282]" 0;
	setAttr ".phl[283]" 0;
	setAttr ".phl[284]" 0;
	setAttr ".phl[285]" 0;
	setAttr ".phl[286]" 0;
	setAttr ".phl[287]" 0;
	setAttr ".phl[288]" 0;
	setAttr ".phl[289]" 0;
	setAttr ".phl[290]" 0;
	setAttr ".phl[291]" 0;
	setAttr ".phl[292]" 0;
	setAttr ".phl[293]" 0;
	setAttr ".phl[294]" 0;
	setAttr ".phl[295]" 0;
	setAttr ".phl[296]" 0;
	setAttr ".phl[297]" 0;
	setAttr ".phl[298]" 0;
	setAttr ".phl[299]" 0;
	setAttr ".phl[300]" 0;
	setAttr ".phl[301]" 0;
	setAttr ".phl[302]" 0;
	setAttr ".phl[303]" 0;
	setAttr ".phl[304]" 0;
	setAttr ".phl[305]" 0;
	setAttr ".phl[306]" 0;
	setAttr ".phl[307]" 0;
	setAttr ".phl[308]" 0;
	setAttr ".phl[309]" 0;
	setAttr ".phl[310]" 0;
	setAttr ".phl[311]" 0;
	setAttr ".phl[312]" 0;
	setAttr ".phl[313]" 0;
	setAttr ".phl[314]" 0;
	setAttr ".phl[315]" 0;
	setAttr ".phl[316]" 0;
	setAttr ".phl[317]" 0;
	setAttr ".phl[318]" 0;
	setAttr ".phl[319]" 0;
	setAttr ".phl[320]" 0;
	setAttr ".phl[321]" 0;
	setAttr ".phl[322]" 0;
	setAttr ".phl[323]" 0;
	setAttr ".phl[324]" 0;
	setAttr ".phl[325]" 0;
	setAttr ".phl[326]" 0;
	setAttr ".phl[327]" 0;
	setAttr ".phl[328]" 0;
	setAttr ".phl[329]" 0;
	setAttr ".phl[330]" 0;
	setAttr ".phl[331]" 0;
	setAttr ".phl[332]" 0;
	setAttr ".phl[333]" 0;
	setAttr ".phl[334]" 0;
	setAttr ".phl[335]" 0;
	setAttr ".phl[336]" 0;
	setAttr ".phl[337]" 0;
	setAttr ".phl[338]" 0;
	setAttr ".phl[339]" 0;
	setAttr ".phl[340]" 0;
	setAttr ".phl[341]" 0;
	setAttr ".phl[342]" 0;
	setAttr ".phl[343]" 0;
	setAttr ".phl[344]" 0;
	setAttr ".phl[345]" 0;
	setAttr ".phl[346]" 0;
	setAttr ".phl[347]" 0;
	setAttr ".phl[348]" 0;
	setAttr ".phl[349]" 0;
	setAttr ".phl[350]" 0;
	setAttr ".phl[351]" 0;
	setAttr ".phl[352]" 0;
	setAttr ".phl[353]" 0;
	setAttr ".phl[354]" 0;
	setAttr ".phl[355]" 0;
	setAttr ".phl[356]" 0;
	setAttr ".phl[357]" 0;
	setAttr ".phl[358]" 0;
	setAttr ".phl[359]" 0;
	setAttr ".phl[360]" 0;
	setAttr ".phl[361]" 0;
	setAttr ".phl[362]" 0;
	setAttr ".phl[363]" 0;
	setAttr ".phl[364]" 0;
	setAttr ".phl[365]" 0;
	setAttr ".phl[366]" 0;
	setAttr ".phl[367]" 0;
	setAttr ".phl[368]" 0;
	setAttr ".phl[369]" 0;
	setAttr ".phl[370]" 0;
	setAttr ".phl[371]" 0;
	setAttr ".phl[372]" 0;
	setAttr ".phl[373]" 0;
	setAttr ".phl[374]" 0;
	setAttr ".phl[375]" 0;
	setAttr ".phl[376]" 0;
	setAttr ".phl[377]" 0;
	setAttr ".phl[378]" 0;
	setAttr ".phl[379]" 0;
	setAttr ".phl[380]" 0;
	setAttr ".phl[381]" 0;
	setAttr ".phl[382]" 0;
	setAttr ".phl[383]" 0;
	setAttr ".phl[384]" 0;
	setAttr ".phl[385]" 0;
	setAttr ".phl[386]" 0;
	setAttr ".phl[387]" 0;
	setAttr ".phl[388]" 0;
	setAttr ".phl[389]" 0;
	setAttr ".phl[390]" 0;
	setAttr ".phl[391]" 0;
	setAttr ".phl[392]" 0;
	setAttr ".phl[393]" 0;
	setAttr ".phl[394]" 0;
	setAttr ".phl[395]" 0;
	setAttr ".phl[396]" 0;
	setAttr ".phl[397]" 0;
	setAttr ".phl[398]" 0;
	setAttr ".phl[399]" 0;
	setAttr ".phl[400]" 0;
	setAttr ".phl[401]" 0;
	setAttr ".phl[402]" 0;
	setAttr ".phl[403]" 0;
	setAttr ".phl[404]" 0;
	setAttr ".phl[405]" 0;
	setAttr ".phl[406]" 0;
	setAttr ".phl[407]" 0;
	setAttr ".phl[408]" 0;
	setAttr ".phl[409]" 0;
	setAttr ".phl[410]" 0;
	setAttr ".phl[411]" 0;
	setAttr ".phl[412]" 0;
	setAttr ".phl[413]" 0;
	setAttr ".phl[414]" 0;
	setAttr ".phl[415]" 0;
	setAttr ".phl[416]" 0;
	setAttr ".phl[417]" 0;
	setAttr ".phl[418]" 0;
	setAttr ".phl[419]" 0;
	setAttr ".phl[420]" 0;
	setAttr ".phl[421]" 0;
	setAttr ".phl[422]" 0;
	setAttr ".phl[423]" 0;
	setAttr ".phl[424]" 0;
	setAttr ".phl[425]" 0;
	setAttr ".phl[426]" 0;
	setAttr ".phl[427]" 0;
	setAttr ".phl[428]" 0;
	setAttr ".phl[429]" 0;
	setAttr ".phl[430]" 0;
	setAttr ".phl[431]" 0;
	setAttr ".phl[432]" 0;
	setAttr ".phl[433]" 0;
	setAttr ".phl[434]" 0;
	setAttr ".phl[435]" 0;
	setAttr ".phl[436]" 0;
	setAttr ".phl[437]" 0;
	setAttr ".phl[438]" 0;
	setAttr ".phl[439]" 0;
	setAttr ".phl[440]" 0;
	setAttr ".phl[441]" 0;
	setAttr ".phl[442]" 0;
	setAttr ".phl[443]" 0;
	setAttr ".phl[444]" 0;
	setAttr ".phl[445]" 0;
	setAttr ".phl[446]" 0;
	setAttr ".phl[447]" 0;
	setAttr ".phl[448]" 0;
	setAttr ".phl[449]" 0;
	setAttr ".phl[450]" 0;
	setAttr ".phl[451]" 0;
	setAttr ".phl[452]" 0;
	setAttr ".phl[453]" 0;
	setAttr ".phl[454]" 0;
	setAttr ".phl[455]" 0;
	setAttr ".phl[456]" 0;
	setAttr ".phl[457]" 0;
	setAttr ".phl[458]" 0;
	setAttr ".phl[459]" 0;
	setAttr ".phl[460]" 0;
	setAttr ".phl[461]" 0;
	setAttr ".phl[462]" 0;
	setAttr ".phl[463]" 0;
	setAttr ".phl[464]" 0;
	setAttr ".phl[465]" 0;
	setAttr ".phl[466]" 0;
	setAttr ".phl[467]" 0;
	setAttr ".phl[468]" 0;
	setAttr ".phl[469]" 0;
	setAttr ".phl[470]" 0;
	setAttr ".phl[471]" 0;
	setAttr ".phl[472]" 0;
	setAttr ".phl[473]" 0;
	setAttr ".phl[474]" 0;
	setAttr ".phl[475]" 0;
	setAttr ".phl[476]" 0;
	setAttr ".phl[477]" 0;
	setAttr ".phl[478]" 0;
	setAttr ".phl[479]" 0;
	setAttr ".phl[480]" 0;
	setAttr ".phl[481]" 0;
	setAttr ".phl[482]" 0;
	setAttr ".phl[483]" 0;
	setAttr ".phl[484]" 0;
	setAttr ".phl[485]" 0;
	setAttr ".phl[486]" 0;
	setAttr ".phl[487]" 0;
	setAttr ".phl[488]" 0;
	setAttr ".phl[489]" 0;
	setAttr ".phl[490]" 0;
	setAttr ".phl[491]" 0;
	setAttr ".phl[492]" 0;
	setAttr ".phl[493]" 0;
	setAttr ".phl[494]" 0;
	setAttr ".phl[495]" 0;
	setAttr ".phl[496]" 0;
	setAttr ".phl[497]" 0;
	setAttr ".phl[498]" 0;
	setAttr ".phl[499]" 0;
	setAttr ".phl[500]" 0;
	setAttr ".phl[501]" 0;
	setAttr ".phl[502]" 0;
	setAttr ".phl[503]" 0;
	setAttr ".phl[504]" 0;
	setAttr ".phl[505]" 0;
	setAttr ".phl[506]" 0;
	setAttr ".phl[507]" 0;
	setAttr ".phl[508]" 0;
	setAttr ".phl[509]" 0;
	setAttr ".phl[510]" 0;
	setAttr ".phl[511]" 0;
	setAttr ".phl[512]" 0;
	setAttr ".phl[513]" 0;
	setAttr ".phl[514]" 0;
	setAttr ".phl[515]" 0;
	setAttr ".phl[516]" 0;
	setAttr ".phl[517]" 0;
	setAttr ".phl[518]" 0;
	setAttr ".phl[519]" 0;
	setAttr ".phl[520]" 0;
	setAttr ".phl[521]" 0;
	setAttr ".phl[522]" 0;
	setAttr ".phl[523]" 0;
	setAttr ".phl[524]" 0;
	setAttr ".phl[525]" 0;
	setAttr ".phl[526]" 0;
	setAttr ".phl[527]" 0;
	setAttr ".phl[528]" 0;
	setAttr ".phl[529]" 0;
	setAttr ".phl[530]" 0;
	setAttr ".phl[531]" 0;
	setAttr ".phl[532]" 0;
	setAttr ".phl[533]" 0;
	setAttr ".phl[534]" 0;
	setAttr ".phl[535]" 0;
	setAttr ".phl[536]" 0;
	setAttr ".phl[537]" 0;
	setAttr ".phl[538]" 0;
	setAttr ".phl[539]" 0;
	setAttr ".phl[540]" 0;
	setAttr ".phl[541]" 0;
	setAttr ".phl[542]" 0;
	setAttr ".phl[543]" 0;
	setAttr ".phl[544]" 0;
	setAttr ".phl[545]" 0;
	setAttr ".phl[546]" 0;
	setAttr ".phl[547]" 0;
	setAttr ".phl[548]" 0;
	setAttr ".phl[549]" 0;
	setAttr ".phl[550]" 0;
	setAttr ".phl[551]" 0;
	setAttr ".phl[552]" 0;
	setAttr ".phl[553]" 0;
	setAttr ".phl[554]" 0;
	setAttr ".phl[555]" 0;
	setAttr ".phl[556]" 0;
	setAttr ".phl[557]" 0;
	setAttr ".phl[558]" 0;
	setAttr ".phl[559]" 0;
	setAttr ".phl[560]" 0;
	setAttr ".phl[561]" 0;
	setAttr ".phl[562]" 0;
	setAttr ".phl[563]" 0;
	setAttr ".phl[564]" 0;
	setAttr ".phl[565]" 0;
	setAttr ".phl[566]" 0;
	setAttr ".phl[567]" 0;
	setAttr ".phl[568]" 0;
	setAttr ".phl[569]" 0;
	setAttr ".phl[570]" 0;
	setAttr ".phl[571]" 0;
	setAttr ".phl[572]" 0;
	setAttr ".phl[573]" 0;
	setAttr ".phl[574]" 0;
	setAttr ".phl[575]" 0;
	setAttr ".phl[576]" 0;
	setAttr ".phl[577]" 0;
	setAttr ".phl[578]" 0;
	setAttr ".phl[579]" 0;
	setAttr ".phl[580]" 0;
	setAttr ".phl[581]" 0;
	setAttr ".phl[582]" 0;
	setAttr ".phl[583]" 0;
	setAttr ".phl[584]" 0;
	setAttr ".phl[585]" 0;
	setAttr ".phl[586]" 0;
	setAttr ".phl[587]" 0;
	setAttr ".phl[588]" 0;
	setAttr ".phl[589]" 0;
	setAttr ".phl[590]" 0;
	setAttr ".phl[591]" 0;
	setAttr ".phl[592]" 0;
	setAttr ".phl[593]" 0;
	setAttr ".phl[594]" 0;
	setAttr ".phl[595]" 0;
	setAttr ".phl[596]" 0;
	setAttr ".phl[597]" 0;
	setAttr ".phl[598]" 0;
	setAttr ".phl[599]" 0;
	setAttr ".phl[600]" 0;
	setAttr ".phl[601]" 0;
	setAttr ".phl[602]" 0;
	setAttr ".phl[603]" 0;
	setAttr ".phl[604]" 0;
	setAttr ".phl[605]" 0;
	setAttr ".phl[606]" 0;
	setAttr ".phl[607]" 0;
	setAttr ".phl[608]" 0;
	setAttr ".phl[609]" 0;
	setAttr ".phl[610]" 0;
	setAttr ".phl[611]" 0;
	setAttr ".phl[612]" 0;
	setAttr ".phl[613]" 0;
	setAttr ".phl[614]" 0;
	setAttr ".phl[615]" 0;
	setAttr ".phl[616]" 0;
	setAttr ".phl[617]" 0;
	setAttr ".phl[618]" 0;
	setAttr ".phl[619]" 0;
	setAttr ".phl[620]" 0;
	setAttr ".phl[621]" 0;
	setAttr ".phl[622]" 0;
	setAttr ".phl[623]" 0;
	setAttr ".phl[624]" 0;
	setAttr ".phl[625]" 0;
	setAttr ".phl[626]" 0;
	setAttr ".phl[627]" 0;
	setAttr ".phl[628]" 0;
	setAttr ".phl[629]" 0;
	setAttr ".phl[630]" 0;
	setAttr ".phl[631]" 0;
	setAttr ".phl[632]" 0;
	setAttr ".phl[633]" 0;
	setAttr ".phl[634]" 0;
	setAttr ".phl[635]" 0;
	setAttr ".phl[636]" 0;
	setAttr ".phl[637]" 0;
	setAttr ".phl[638]" 0;
	setAttr ".phl[639]" 0;
	setAttr ".phl[640]" 0;
	setAttr ".phl[641]" 0;
	setAttr ".phl[642]" 0;
	setAttr ".phl[643]" 0;
	setAttr ".phl[644]" 0;
	setAttr ".phl[645]" 0;
	setAttr ".phl[646]" 0;
	setAttr ".phl[647]" 0;
	setAttr ".phl[648]" 0;
	setAttr ".phl[649]" 0;
	setAttr ".phl[650]" 0;
	setAttr ".phl[651]" 0;
	setAttr ".phl[652]" 0;
	setAttr ".phl[653]" 0;
	setAttr ".phl[654]" 0;
	setAttr ".phl[655]" 0;
	setAttr ".phl[656]" 0;
	setAttr ".phl[657]" 0;
	setAttr ".phl[658]" 0;
	setAttr ".phl[659]" 0;
	setAttr ".phl[660]" 0;
	setAttr ".phl[661]" 0;
	setAttr ".phl[662]" 0;
	setAttr ".phl[663]" 0;
	setAttr ".phl[664]" 0;
	setAttr ".phl[665]" 0;
	setAttr ".phl[666]" 0;
	setAttr ".phl[667]" 0;
	setAttr ".phl[668]" 0;
	setAttr ".phl[669]" 0;
	setAttr ".phl[670]" 0;
	setAttr ".phl[671]" 0;
	setAttr ".phl[672]" 0;
	setAttr ".phl[673]" 0;
	setAttr ".phl[674]" 0;
	setAttr ".phl[675]" 0;
	setAttr ".phl[676]" 0;
	setAttr ".phl[677]" 0;
	setAttr ".phl[678]" 0;
	setAttr ".phl[679]" 0;
	setAttr ".phl[680]" 0;
	setAttr ".phl[681]" 0;
	setAttr ".phl[682]" 0;
	setAttr ".phl[683]" 0;
	setAttr ".phl[684]" 0;
	setAttr ".phl[685]" 0;
	setAttr ".phl[686]" 0;
	setAttr ".phl[687]" 0;
	setAttr ".phl[688]" 0;
	setAttr ".phl[689]" 0;
	setAttr ".phl[690]" 0;
	setAttr ".phl[691]" 0;
	setAttr ".phl[692]" 0;
	setAttr ".phl[693]" 0;
	setAttr ".phl[694]" 0;
	setAttr ".phl[695]" 0;
	setAttr ".phl[696]" 0;
	setAttr ".phl[697]" 0;
	setAttr ".phl[698]" 0;
	setAttr ".phl[699]" 0;
	setAttr ".phl[700]" 0;
	setAttr ".phl[701]" 0;
	setAttr ".phl[702]" 0;
	setAttr ".phl[703]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"ZL_avatar_2022_rigRN"
		"ZL_avatar_2022_rigRN" 0
		"ZL_avatar_2022_rigRN" 744
		0 "|ZL_avatar_2022_rigRNfosterParent1|world_ctrl_parentConstraint1" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl" 
		"-s -r "
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:Geometry|ZL_avatar_2022_rig:ZL_cloth_upper_112_low_mod|ZL_avatar_2022_rig:ZL_cloth_upper_112_low_mod" 
		"visibility" " 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:Geometry|ZL_avatar_2022_rig:ZL_cloth_pants_078_low_mod|ZL_avatar_2022_rig:ZL_cloth_pants_078_low_mod" 
		"visibility" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:Geometry|ZL_avatar_2022_rig:ZL_avatar_hair_090_low_mod|ZL_avatar_2022_rig:ZL_avatar_hair_090_low_mod" 
		"visibility" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:world_ctrlShape" 
		"overrideDisplayType" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:root_ctrlShape" 
		"overrideDisplayType" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MainShape" 
		"overrideDisplayType" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M" 
		"visibility" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M" 
		"Global" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToRoot_M|ZL_avatar_2022_rig:FKOffsetHip_R|ZL_avatar_2022_rig:FKGlobalStaticHip_R|ZL_avatar_2022_rig:FKGlobalHip_R|ZL_avatar_2022_rig:FKExtraHip_R|ZL_avatar_2022_rig:FKHip_R" 
		"rotate" " -type \"double3\" 0 0 34.74413329792903227"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToRoot_M|ZL_avatar_2022_rig:FKOffsetHip_R|ZL_avatar_2022_rig:FKGlobalStaticHip_R|ZL_avatar_2022_rig:FKGlobalHip_R|ZL_avatar_2022_rig:FKExtraHip_R|ZL_avatar_2022_rig:FKHip_R|ZL_avatar_2022_rig:FKXHip_R|ZL_avatar_2022_rig:FKOffsetKnee_R|ZL_avatar_2022_rig:FKExtraKnee_R|ZL_avatar_2022_rig:FKKnee_R" 
		"rotate" " -type \"double3\" 0 0 -80.04017112336326534"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToRoot_M|ZL_avatar_2022_rig:FKOffsetHip_R|ZL_avatar_2022_rig:FKGlobalStaticHip_R|ZL_avatar_2022_rig:FKGlobalHip_R|ZL_avatar_2022_rig:FKExtraHip_R|ZL_avatar_2022_rig:FKHip_R|ZL_avatar_2022_rig:FKXHip_R|ZL_avatar_2022_rig:FKOffsetKnee_R|ZL_avatar_2022_rig:FKExtraKnee_R|ZL_avatar_2022_rig:FKKnee_R|ZL_avatar_2022_rig:FKXKnee_R|ZL_avatar_2022_rig:FKOffsetAnkle_R|ZL_avatar_2022_rig:FKExtraAnkle_R|ZL_avatar_2022_rig:FKAnkle_R" 
		"rotate" " -type \"double3\" 0 0 -30.86706260508548993"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M" 
		"visibility" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M" 
		"visibility" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"visibility" " 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"follow" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"stretchy" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"antiPop" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"Lenght1" " -k 1 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"Lenght2" " -k 1 1"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"Fatness1" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"Fatness2" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R" 
		"volume" " -k 1 10"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_L|ZL_avatar_2022_rig:PoleExtraArm_L|ZL_avatar_2022_rig:PoleArm_L" 
		"follow" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_L|ZL_avatar_2022_rig:PoleExtraArm_L|ZL_avatar_2022_rig:PoleArm_L" 
		"lock" " -k 1 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Happy|ZL_avatar_2022_rig:Slide_bar06|ZL_avatar_2022_rig:bar06" 
		"translateY" " 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Happy|ZL_avatar_2022_rig:Slide_bar07|ZL_avatar_2022_rig:bar07" 
		"translateY" " 0.16188041544345491"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Giggle|ZL_avatar_2022_rig:Slide_bar08|ZL_avatar_2022_rig:bar08" 
		"translateY" " 0"
		2 "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Terrified|ZL_avatar_2022_rig:Slide_barR11|ZL_avatar_2022_rig:barR11" 
		"translateY" " 0"
		2 "ZL_avatar_2022_rig:file14" "fileTextureName" " -type \"string\" \"D:/ZL_gr_ts_swimring01_001/Maya/Maya 2018//sourceimages/tex2022/ZL_cloth_upper_112_low_mod_02_D.png\""
		
		2 "ZL_avatar_2022_rig:file14" "colorSpace" " -type \"string\" \"sRGB\""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[1]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[2]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[3]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[4]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[5]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[6]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.rotateOrder" 
		"ZL_avatar_2022_rigRN.placeHolderList[7]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.parentInverseMatrix" 
		"ZL_avatar_2022_rigRN.placeHolderList[8]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.rotatePivot" 
		"ZL_avatar_2022_rigRN.placeHolderList[9]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl.rotatePivotTranslate" 
		"ZL_avatar_2022_rigRN.placeHolderList[10]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[11]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[12]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[13]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[14]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[15]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[16]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[17]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[18]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[19]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[20]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[21]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[22]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[23]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEye_R|ZL_avatar_2022_rig:FKExtraEye_R|ZL_avatar_2022_rig:FKEye_g_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[24]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetToothUp_M|ZL_avatar_2022_rig:FKExtraToothUp_M|ZL_avatar_2022_rig:FKToothUp_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[25]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[26]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetToothDown_M|ZL_avatar_2022_rig:FKExtraToothDown_M|ZL_avatar_2022_rig:FKToothDown_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[27]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetTongue1_M|ZL_avatar_2022_rig:FKExtraTongue1_M|ZL_avatar_2022_rig:FKTongue1_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[28]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetTongue1_M|ZL_avatar_2022_rig:FKExtraTongue1_M|ZL_avatar_2022_rig:FKTongue1_M|ZL_avatar_2022_rig:FKXTongue1_M|ZL_avatar_2022_rig:FKOffsetTongue2_M|ZL_avatar_2022_rig:FKExtraTongue2_M|ZL_avatar_2022_rig:FKTongue2_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[29]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetTongue1_M|ZL_avatar_2022_rig:FKExtraTongue1_M|ZL_avatar_2022_rig:FKTongue1_M|ZL_avatar_2022_rig:FKXTongue1_M|ZL_avatar_2022_rig:FKOffsetTongue2_M|ZL_avatar_2022_rig:FKExtraTongue2_M|ZL_avatar_2022_rig:FKTongue2_M|ZL_avatar_2022_rig:FKXTongue2_M|ZL_avatar_2022_rig:FKOffsetTongue3_M|ZL_avatar_2022_rig:FKExtraTongue3_M|ZL_avatar_2022_rig:FKTongue3_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[30]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetTongue1_M|ZL_avatar_2022_rig:FKExtraTongue1_M|ZL_avatar_2022_rig:FKTongue1_M|ZL_avatar_2022_rig:FKXTongue1_M|ZL_avatar_2022_rig:FKOffsetTongue2_M|ZL_avatar_2022_rig:FKExtraTongue2_M|ZL_avatar_2022_rig:FKTongue2_M|ZL_avatar_2022_rig:FKXTongue2_M|ZL_avatar_2022_rig:FKOffsetTongue3_M|ZL_avatar_2022_rig:FKExtraTongue3_M|ZL_avatar_2022_rig:FKTongue3_M|ZL_avatar_2022_rig:FKXTongue3_M|ZL_avatar_2022_rig:FKOffsetTongue4_M|ZL_avatar_2022_rig:FKExtraTongue4_M|ZL_avatar_2022_rig:FKTongue4_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[31]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouthDown_M|ZL_avatar_2022_rig:FKExtraMouthDown_M|ZL_avatar_2022_rig:FKMouthDown_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[32]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth05_R|ZL_avatar_2022_rig:FKExtraMouth05_R|ZL_avatar_2022_rig:FKMouth05_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[33]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth06_R|ZL_avatar_2022_rig:FKExtraMouth06_R|ZL_avatar_2022_rig:FKMouth06_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[34]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth07_R|ZL_avatar_2022_rig:FKExtraMouth07_R|ZL_avatar_2022_rig:FKMouth07_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[35]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth08_R|ZL_avatar_2022_rig:FKExtraMouth08_R|ZL_avatar_2022_rig:FKMouth08_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[36]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth12_R|ZL_avatar_2022_rig:FKExtraMouth12_R|ZL_avatar_2022_rig:FKMouth12_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[37]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth09_R|ZL_avatar_2022_rig:FKExtraMouth09_R|ZL_avatar_2022_rig:FKMouth09_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[38]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth10_R|ZL_avatar_2022_rig:FKExtraMouth10_R|ZL_avatar_2022_rig:FKMouth10_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[39]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth11_R|ZL_avatar_2022_rig:FKExtraMouth11_R|ZL_avatar_2022_rig:FKMouth11_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[40]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouthDown1_M|ZL_avatar_2022_rig:FKExtraMouthDown1_M|ZL_avatar_2022_rig:FKMouthDown1_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[41]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth05_L|ZL_avatar_2022_rig:FKExtraMouth05_L|ZL_avatar_2022_rig:FKMouth05_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[42]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth06_L|ZL_avatar_2022_rig:FKExtraMouth06_L|ZL_avatar_2022_rig:FKMouth06_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[43]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth07_L|ZL_avatar_2022_rig:FKExtraMouth07_L|ZL_avatar_2022_rig:FKMouth07_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[44]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth08_L|ZL_avatar_2022_rig:FKExtraMouth08_L|ZL_avatar_2022_rig:FKMouth08_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[45]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth12_L|ZL_avatar_2022_rig:FKExtraMouth12_L|ZL_avatar_2022_rig:FKMouth12_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[46]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth09_L|ZL_avatar_2022_rig:FKExtraMouth09_L|ZL_avatar_2022_rig:FKMouth09_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[47]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth10_L|ZL_avatar_2022_rig:FKExtraMouth10_L|ZL_avatar_2022_rig:FKMouth10_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[48]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetJaw_M|ZL_avatar_2022_rig:FKExtraJaw_M|ZL_avatar_2022_rig:FKJaw_M|ZL_avatar_2022_rig:FKXJaw_M|ZL_avatar_2022_rig:FKOffsetMouth11_L|ZL_avatar_2022_rig:FKExtraMouth11_L|ZL_avatar_2022_rig:FKMouth11_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[49]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_R|ZL_avatar_2022_rig:FKExtraEyebrow1_R|ZL_avatar_2022_rig:FKEyebrow1_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[50]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_R|ZL_avatar_2022_rig:FKExtraEyebrow1_R|ZL_avatar_2022_rig:FKEyebrow1_R|ZL_avatar_2022_rig:FKXEyebrow1_R|ZL_avatar_2022_rig:FKOffsetEyebrow2_R|ZL_avatar_2022_rig:FKExtraEyebrow2_R|ZL_avatar_2022_rig:FKEyebrow2_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[51]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_R|ZL_avatar_2022_rig:FKExtraEyebrow1_R|ZL_avatar_2022_rig:FKEyebrow1_R|ZL_avatar_2022_rig:FKXEyebrow1_R|ZL_avatar_2022_rig:FKOffsetEyebrow2_R|ZL_avatar_2022_rig:FKExtraEyebrow2_R|ZL_avatar_2022_rig:FKEyebrow2_R|ZL_avatar_2022_rig:FKXEyebrow2_R|ZL_avatar_2022_rig:FKOffsetEyebrow3_R|ZL_avatar_2022_rig:FKExtraEyebrow3_R|ZL_avatar_2022_rig:FKEyebrow3_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[52]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_R|ZL_avatar_2022_rig:FKExtraEyebrow1_R|ZL_avatar_2022_rig:FKEyebrow1_R|ZL_avatar_2022_rig:FKXEyebrow1_R|ZL_avatar_2022_rig:FKOffsetEyebrow4_R|ZL_avatar_2022_rig:FKExtraEyebrow4_R|ZL_avatar_2022_rig:FKEyebrow4_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[53]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_R|ZL_avatar_2022_rig:FKExtraEyebrow1_R|ZL_avatar_2022_rig:FKEyebrow1_R|ZL_avatar_2022_rig:FKXEyebrow1_R|ZL_avatar_2022_rig:FKOffsetEyebrow4_R|ZL_avatar_2022_rig:FKExtraEyebrow4_R|ZL_avatar_2022_rig:FKEyebrow4_R|ZL_avatar_2022_rig:FKXEyebrow4_R|ZL_avatar_2022_rig:FKOffsetEyebrow5_R|ZL_avatar_2022_rig:FKExtraEyebrow5_R|ZL_avatar_2022_rig:FKEyebrow5_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[54]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouthUp_M|ZL_avatar_2022_rig:FKExtraMouthUp_M|ZL_avatar_2022_rig:FKMouthUp_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[55]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth_R|ZL_avatar_2022_rig:FKExtraMouth_R|ZL_avatar_2022_rig:FKMouth_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[56]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth01_R|ZL_avatar_2022_rig:FKExtraMouth01_R|ZL_avatar_2022_rig:FKMouth01_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[57]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth02_R|ZL_avatar_2022_rig:FKExtraMouth02_R|ZL_avatar_2022_rig:FKMouth02_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[58]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth03_R|ZL_avatar_2022_rig:FKExtraMouth03_R|ZL_avatar_2022_rig:FKMouth03_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[59]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth04_R|ZL_avatar_2022_rig:FKExtraMouth04_R|ZL_avatar_2022_rig:FKMouth04_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[60]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetNose_M|ZL_avatar_2022_rig:FKExtraNose_M|ZL_avatar_2022_rig:FKNose_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[61]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_R|ZL_avatar_2022_rig:FKExtraEars_R|ZL_avatar_2022_rig:FKEars_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[62]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetCheek_R|ZL_avatar_2022_rig:FKExtraCheek_R|ZL_avatar_2022_rig:FKCheek_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[63]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyeStartled_R|ZL_avatar_2022_rig:FKExtraEyeStartled_R|ZL_avatar_2022_rig:FKEyeStartled_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[64]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyePain_R|ZL_avatar_2022_rig:FKExtraEyePain_R|ZL_avatar_2022_rig:FKEyePain_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[65]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouthUp1_M|ZL_avatar_2022_rig:FKExtraMouthUp1_M|ZL_avatar_2022_rig:FKMouthUp1_M.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[66]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth1_R|ZL_avatar_2022_rig:FKExtraMouth1_R|ZL_avatar_2022_rig:FKMouth1_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[67]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth13_R|ZL_avatar_2022_rig:FKExtraMouth13_R|ZL_avatar_2022_rig:FKMouth13_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[68]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth14_R|ZL_avatar_2022_rig:FKExtraMouth14_R|ZL_avatar_2022_rig:FKMouth14_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[69]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth15_R|ZL_avatar_2022_rig:FKExtraMouth15_R|ZL_avatar_2022_rig:FKMouth15_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[70]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth16_R|ZL_avatar_2022_rig:FKExtraMouth16_R|ZL_avatar_2022_rig:FKMouth16_R.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[71]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEye_L|ZL_avatar_2022_rig:FKExtraEye_L|ZL_avatar_2022_rig:FKEye_g_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[72]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_L|ZL_avatar_2022_rig:FKExtraEyebrow1_L|ZL_avatar_2022_rig:FKEyebrow1_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[73]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_L|ZL_avatar_2022_rig:FKExtraEyebrow1_L|ZL_avatar_2022_rig:FKEyebrow1_L|ZL_avatar_2022_rig:FKXEyebrow1_L|ZL_avatar_2022_rig:FKOffsetEyebrow2_L|ZL_avatar_2022_rig:FKExtraEyebrow2_L|ZL_avatar_2022_rig:FKEyebrow2_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[74]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_L|ZL_avatar_2022_rig:FKExtraEyebrow1_L|ZL_avatar_2022_rig:FKEyebrow1_L|ZL_avatar_2022_rig:FKXEyebrow1_L|ZL_avatar_2022_rig:FKOffsetEyebrow2_L|ZL_avatar_2022_rig:FKExtraEyebrow2_L|ZL_avatar_2022_rig:FKEyebrow2_L|ZL_avatar_2022_rig:FKXEyebrow2_L|ZL_avatar_2022_rig:FKOffsetEyebrow3_L|ZL_avatar_2022_rig:FKExtraEyebrow3_L|ZL_avatar_2022_rig:FKEyebrow3_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[75]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_L|ZL_avatar_2022_rig:FKExtraEyebrow1_L|ZL_avatar_2022_rig:FKEyebrow1_L|ZL_avatar_2022_rig:FKXEyebrow1_L|ZL_avatar_2022_rig:FKOffsetEyebrow4_L|ZL_avatar_2022_rig:FKExtraEyebrow4_L|ZL_avatar_2022_rig:FKEyebrow4_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[76]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyebrow1_L|ZL_avatar_2022_rig:FKExtraEyebrow1_L|ZL_avatar_2022_rig:FKEyebrow1_L|ZL_avatar_2022_rig:FKXEyebrow1_L|ZL_avatar_2022_rig:FKOffsetEyebrow4_L|ZL_avatar_2022_rig:FKExtraEyebrow4_L|ZL_avatar_2022_rig:FKEyebrow4_L|ZL_avatar_2022_rig:FKXEyebrow4_L|ZL_avatar_2022_rig:FKOffsetEyebrow5_L|ZL_avatar_2022_rig:FKExtraEyebrow5_L|ZL_avatar_2022_rig:FKEyebrow5_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[77]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth_L|ZL_avatar_2022_rig:FKExtraMouth_L|ZL_avatar_2022_rig:FKMouth_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[78]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth01_L|ZL_avatar_2022_rig:FKExtraMouth01_L|ZL_avatar_2022_rig:FKMouth01_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[79]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth02_L|ZL_avatar_2022_rig:FKExtraMouth02_L|ZL_avatar_2022_rig:FKMouth02_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[80]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth03_L|ZL_avatar_2022_rig:FKExtraMouth03_L|ZL_avatar_2022_rig:FKMouth03_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[81]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth04_L|ZL_avatar_2022_rig:FKExtraMouth04_L|ZL_avatar_2022_rig:FKMouth04_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[82]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[83]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[84]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[85]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[86]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[87]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[88]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[89]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[90]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[91]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[92]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEars_L|ZL_avatar_2022_rig:FKExtraEars_L|ZL_avatar_2022_rig:FKEars_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[93]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetCheek_L|ZL_avatar_2022_rig:FKExtraCheek_L|ZL_avatar_2022_rig:FKCheek_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[94]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyeStartled_L|ZL_avatar_2022_rig:FKExtraEyeStartled_L|ZL_avatar_2022_rig:FKEyeStartled_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[95]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetEyePain_L|ZL_avatar_2022_rig:FKExtraEyePain_L|ZL_avatar_2022_rig:FKEyePain_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[96]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth1_L|ZL_avatar_2022_rig:FKExtraMouth1_L|ZL_avatar_2022_rig:FKMouth1_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[97]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth13_L|ZL_avatar_2022_rig:FKExtraMouth13_L|ZL_avatar_2022_rig:FKMouth13_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[98]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth14_L|ZL_avatar_2022_rig:FKExtraMouth14_L|ZL_avatar_2022_rig:FKMouth14_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[99]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth15_L|ZL_avatar_2022_rig:FKExtraMouth15_L|ZL_avatar_2022_rig:FKMouth15_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[100]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetNeck_M|ZL_avatar_2022_rig:FKExtraNeck_M|ZL_avatar_2022_rig:FKNeck_M|ZL_avatar_2022_rig:FKXNeck_M|ZL_avatar_2022_rig:FKOffsetHead_M|ZL_avatar_2022_rig:FKGlobalStaticHead_M|ZL_avatar_2022_rig:FKGlobalHead_M|ZL_avatar_2022_rig:FKExtraHead_M|ZL_avatar_2022_rig:FKHead_M|ZL_avatar_2022_rig:FKXHead_M|ZL_avatar_2022_rig:FKOffsetMouth16_L|ZL_avatar_2022_rig:FKExtraMouth16_L|ZL_avatar_2022_rig:FKMouth16_L.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[101]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[102]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[103]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[104]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[105]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[106]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[107]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[108]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[109]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[110]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_R|ZL_avatar_2022_rig:FKExtraScapula_R|ZL_avatar_2022_rig:FKScapula_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[111]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[112]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[113]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[114]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[115]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[116]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[117]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[118]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[119]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[120]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToChest_M|ZL_avatar_2022_rig:FKOffsetScapula_L|ZL_avatar_2022_rig:FKExtraScapula_L|ZL_avatar_2022_rig:FKScapula_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[121]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[122]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[123]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[124]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[125]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[126]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[127]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[128]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[129]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[130]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[131]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[132]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[133]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[134]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[135]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[136]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[137]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[138]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[139]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[140]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[141]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[142]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[143]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[144]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[145]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[146]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[147]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[148]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[149]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[150]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_R|ZL_avatar_2022_rig:SDKFKMiddleFinger1_R|ZL_avatar_2022_rig:FKExtraMiddleFinger1_R|ZL_avatar_2022_rig:FKMiddleFinger1_R|ZL_avatar_2022_rig:FKXMiddleFinger1_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_R|ZL_avatar_2022_rig:SDKFKMiddleFinger2_R|ZL_avatar_2022_rig:FKExtraMiddleFinger2_R|ZL_avatar_2022_rig:FKMiddleFinger2_R|ZL_avatar_2022_rig:FKXMiddleFinger2_R|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_R|ZL_avatar_2022_rig:SDKFKMiddleFinger3_R|ZL_avatar_2022_rig:FKExtraMiddleFinger3_R|ZL_avatar_2022_rig:FKMiddleFinger3_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[151]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[152]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[153]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[154]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[155]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[156]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[157]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[158]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[159]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[160]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[161]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[162]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[163]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[164]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[165]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[166]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[167]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[168]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[169]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[170]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[171]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[172]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[173]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[174]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[175]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[176]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[177]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[178]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[179]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[180]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetThumbFinger1_R|ZL_avatar_2022_rig:FKExtraThumbFinger1_R|ZL_avatar_2022_rig:FKThumbFinger1_R|ZL_avatar_2022_rig:FKXThumbFinger1_R|ZL_avatar_2022_rig:FKOffsetThumbFinger2_R|ZL_avatar_2022_rig:SDKFKThumbFinger2_R|ZL_avatar_2022_rig:FKExtraThumbFinger2_R|ZL_avatar_2022_rig:FKThumbFinger2_R|ZL_avatar_2022_rig:FKXThumbFinger2_R|ZL_avatar_2022_rig:FKOffsetThumbFinger3_R|ZL_avatar_2022_rig:SDKFKThumbFinger3_R|ZL_avatar_2022_rig:FKExtraThumbFinger3_R|ZL_avatar_2022_rig:FKThumbFinger3_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[181]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[182]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[183]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[184]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[185]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[186]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[187]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[188]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[189]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[190]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[191]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[192]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[193]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[194]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[195]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[196]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[197]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[198]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[199]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[200]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[201]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[202]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[203]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[204]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[205]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[206]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[207]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[208]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[209]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[210]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetIndexFinger1_R|ZL_avatar_2022_rig:SDKFKIndexFinger1_R|ZL_avatar_2022_rig:FKExtraIndexFinger1_R|ZL_avatar_2022_rig:FKIndexFinger1_R|ZL_avatar_2022_rig:FKXIndexFinger1_R|ZL_avatar_2022_rig:FKOffsetIndexFinger2_R|ZL_avatar_2022_rig:SDKFKIndexFinger2_R|ZL_avatar_2022_rig:FKExtraIndexFinger2_R|ZL_avatar_2022_rig:FKIndexFinger2_R|ZL_avatar_2022_rig:FKXIndexFinger2_R|ZL_avatar_2022_rig:FKOffsetIndexFinger3_R|ZL_avatar_2022_rig:SDKFKIndexFinger3_R|ZL_avatar_2022_rig:FKExtraIndexFinger3_R|ZL_avatar_2022_rig:FKIndexFinger3_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[211]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[212]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[213]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[214]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[215]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[216]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[217]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[218]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[219]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[220]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[221]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[222]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[223]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[224]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[225]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[226]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[227]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[228]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[229]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[230]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[231]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[232]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[233]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[234]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[235]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[236]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[237]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[238]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[239]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[240]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_R|ZL_avatar_2022_rig:FKOffsetRingFinger1_R|ZL_avatar_2022_rig:SDKFKRingFinger1_R|ZL_avatar_2022_rig:FKExtraRingFinger1_R|ZL_avatar_2022_rig:FKRingFinger1_R|ZL_avatar_2022_rig:FKXRingFinger1_R|ZL_avatar_2022_rig:FKOffsetRingFinger2_R|ZL_avatar_2022_rig:SDKFKRingFinger2_R|ZL_avatar_2022_rig:FKExtraRingFinger2_R|ZL_avatar_2022_rig:FKRingFinger2_R|ZL_avatar_2022_rig:FKXRingFinger2_R|ZL_avatar_2022_rig:FKOffsetRingFinger3_R|ZL_avatar_2022_rig:SDKFKRingFinger3_R|ZL_avatar_2022_rig:FKExtraRingFinger3_R|ZL_avatar_2022_rig:FKRingFinger3_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[241]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[242]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[243]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[244]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[245]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[246]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[247]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[248]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[249]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[250]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[251]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[252]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[253]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[254]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[255]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[256]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[257]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[258]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[259]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[260]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[261]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[262]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[263]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[264]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[265]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[266]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:FKXRoot_M|ZL_avatar_2022_rig:FKOffsetSpine1_M|ZL_avatar_2022_rig:HipSwingerStabilizer|ZL_avatar_2022_rig:FKExtraSpine1_M|ZL_avatar_2022_rig:FKSpine1_M|ZL_avatar_2022_rig:FKXSpine1_M|ZL_avatar_2022_rig:FKOffsetSpine2_M|ZL_avatar_2022_rig:FKExtraSpine2_M|ZL_avatar_2022_rig:FKSpine2_M|ZL_avatar_2022_rig:FKXSpine2_M|ZL_avatar_2022_rig:FKOffsetChest_M|ZL_avatar_2022_rig:FKExtraChest_M|ZL_avatar_2022_rig:FKChest_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[267]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:HipSwingerOffset_M|ZL_avatar_2022_rig:HipSwinger_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[268]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:HipSwingerOffset_M|ZL_avatar_2022_rig:HipSwinger_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[269]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:HipSwingerOffset_M|ZL_avatar_2022_rig:HipSwinger_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[270]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKOffsetRoot_M|ZL_avatar_2022_rig:FKExtraRoot_M|ZL_avatar_2022_rig:FKRoot_M|ZL_avatar_2022_rig:HipSwingerOffset_M|ZL_avatar_2022_rig:HipSwinger_M.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[271]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[272]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[273]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[274]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[275]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[276]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[277]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[278]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[279]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[280]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[281]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[282]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[283]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[284]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[285]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[286]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[287]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[288]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[289]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[290]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[291]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[292]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[293]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[294]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[295]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[296]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[297]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[298]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[299]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[300]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger1_L|ZL_avatar_2022_rig:SDKFKMiddleFinger1_L|ZL_avatar_2022_rig:FKExtraMiddleFinger1_L|ZL_avatar_2022_rig:FKMiddleFinger1_L|ZL_avatar_2022_rig:FKXMiddleFinger1_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger2_L|ZL_avatar_2022_rig:SDKFKMiddleFinger2_L|ZL_avatar_2022_rig:FKExtraMiddleFinger2_L|ZL_avatar_2022_rig:FKMiddleFinger2_L|ZL_avatar_2022_rig:FKXMiddleFinger2_L|ZL_avatar_2022_rig:FKOffsetMiddleFinger3_L|ZL_avatar_2022_rig:SDKFKMiddleFinger3_L|ZL_avatar_2022_rig:FKExtraMiddleFinger3_L|ZL_avatar_2022_rig:FKMiddleFinger3_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[301]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[302]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[303]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[304]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[305]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[306]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[307]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[308]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[309]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[310]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[311]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[312]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[313]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[314]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[315]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[316]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[317]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[318]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[319]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[320]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[321]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[322]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[323]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[324]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[325]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[326]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[327]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[328]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[329]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[330]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetThumbFinger1_L|ZL_avatar_2022_rig:FKExtraThumbFinger1_L|ZL_avatar_2022_rig:FKThumbFinger1_L|ZL_avatar_2022_rig:FKXThumbFinger1_L|ZL_avatar_2022_rig:FKOffsetThumbFinger2_L|ZL_avatar_2022_rig:SDKFKThumbFinger2_L|ZL_avatar_2022_rig:FKExtraThumbFinger2_L|ZL_avatar_2022_rig:FKThumbFinger2_L|ZL_avatar_2022_rig:FKXThumbFinger2_L|ZL_avatar_2022_rig:FKOffsetThumbFinger3_L|ZL_avatar_2022_rig:SDKFKThumbFinger3_L|ZL_avatar_2022_rig:FKExtraThumbFinger3_L|ZL_avatar_2022_rig:FKThumbFinger3_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[331]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[332]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[333]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[334]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[335]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[336]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[337]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[338]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[339]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[340]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[341]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[342]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[343]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[344]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[345]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[346]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[347]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[348]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[349]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[350]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[351]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[352]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[353]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[354]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[355]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[356]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[357]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[358]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[359]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[360]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetIndexFinger1_L|ZL_avatar_2022_rig:SDKFKIndexFinger1_L|ZL_avatar_2022_rig:FKExtraIndexFinger1_L|ZL_avatar_2022_rig:FKIndexFinger1_L|ZL_avatar_2022_rig:FKXIndexFinger1_L|ZL_avatar_2022_rig:FKOffsetIndexFinger2_L|ZL_avatar_2022_rig:SDKFKIndexFinger2_L|ZL_avatar_2022_rig:FKExtraIndexFinger2_L|ZL_avatar_2022_rig:FKIndexFinger2_L|ZL_avatar_2022_rig:FKXIndexFinger2_L|ZL_avatar_2022_rig:FKOffsetIndexFinger3_L|ZL_avatar_2022_rig:SDKFKIndexFinger3_L|ZL_avatar_2022_rig:FKExtraIndexFinger3_L|ZL_avatar_2022_rig:FKIndexFinger3_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[361]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[362]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[363]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[364]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[365]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[366]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[367]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[368]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[369]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[370]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[371]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[372]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[373]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[374]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[375]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[376]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[377]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[378]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[379]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[380]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[381]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[382]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[383]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[384]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[385]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[386]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[387]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[388]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[389]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[390]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKSystem|ZL_avatar_2022_rig:FKParentConstraintToWrist_L|ZL_avatar_2022_rig:FKOffsetRingFinger1_L|ZL_avatar_2022_rig:SDKFKRingFinger1_L|ZL_avatar_2022_rig:FKExtraRingFinger1_L|ZL_avatar_2022_rig:FKRingFinger1_L|ZL_avatar_2022_rig:FKXRingFinger1_L|ZL_avatar_2022_rig:FKOffsetRingFinger2_L|ZL_avatar_2022_rig:SDKFKRingFinger2_L|ZL_avatar_2022_rig:FKExtraRingFinger2_L|ZL_avatar_2022_rig:FKRingFinger2_L|ZL_avatar_2022_rig:FKXRingFinger2_L|ZL_avatar_2022_rig:FKOffsetRingFinger3_L|ZL_avatar_2022_rig:SDKFKRingFinger3_L|ZL_avatar_2022_rig:FKExtraRingFinger3_L|ZL_avatar_2022_rig:FKRingFinger3_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[391]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.scale" 
		"ZL_avatar_2022_rigRN.placeHolderList[392]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.translate" 
		"ZL_avatar_2022_rigRN.placeHolderList[393]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[394]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[395]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[396]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.rotatePivot" 
		"ZL_avatar_2022_rigRN.placeHolderList[397]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.rotatePivotTranslate" 
		"ZL_avatar_2022_rigRN.placeHolderList[398]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.parentMatrix" 
		"ZL_avatar_2022_rigRN.placeHolderList[399]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.rotate" 
		"ZL_avatar_2022_rigRN.placeHolderList[400]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[401]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[402]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[403]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_R|ZL_avatar_2022_rig:IKExtraArm_R|ZL_avatar_2022_rig:IKArm_R.rotateOrder" 
		"ZL_avatar_2022_rigRN.placeHolderList[404]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_R|ZL_avatar_2022_rig:PoleExtraArm_R|ZL_avatar_2022_rig:PoleArm_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[405]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_R|ZL_avatar_2022_rig:PoleExtraArm_R|ZL_avatar_2022_rig:PoleArm_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[406]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_R|ZL_avatar_2022_rig:PoleExtraArm_R|ZL_avatar_2022_rig:PoleArm_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[407]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_R|ZL_avatar_2022_rig:PoleExtraArm_R|ZL_avatar_2022_rig:PoleArm_R.follow" 
		"ZL_avatar_2022_rigRN.placeHolderList[408]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_R|ZL_avatar_2022_rig:PoleExtraArm_R|ZL_avatar_2022_rig:PoleArm_R.lock" 
		"ZL_avatar_2022_rigRN.placeHolderList[409]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[410]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[411]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[412]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[413]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[414]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[415]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[416]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[417]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[418]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.swivel" 
		"ZL_avatar_2022_rigRN.placeHolderList[419]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.rollAngle" 
		"ZL_avatar_2022_rigRN.placeHolderList[420]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.roll" 
		"ZL_avatar_2022_rigRN.placeHolderList[421]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.stretchy" 
		"ZL_avatar_2022_rigRN.placeHolderList[422]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.antiPop" 
		"ZL_avatar_2022_rigRN.placeHolderList[423]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.Lenght1" 
		"ZL_avatar_2022_rigRN.placeHolderList[424]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.Lenght2" 
		"ZL_avatar_2022_rigRN.placeHolderList[425]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.Fatness1" 
		"ZL_avatar_2022_rigRN.placeHolderList[426]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.Fatness2" 
		"ZL_avatar_2022_rigRN.placeHolderList[427]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.volume" 
		"ZL_avatar_2022_rigRN.placeHolderList[428]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[429]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[430]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[431]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[432]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[433]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[434]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[435]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[436]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[437]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[438]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[439]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[440]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[441]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[442]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[443]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[444]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[445]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[446]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[447]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[448]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[449]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[450]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[451]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[452]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[453]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[454]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[455]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[456]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[457]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[458]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:RollOffsetToes_R|ZL_avatar_2022_rig:RollRollerToes_R|ZL_avatar_2022_rig:RollExtraToes_R|ZL_avatar_2022_rig:RollToes_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[459]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[460]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[461]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[462]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[463]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[464]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[465]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[466]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[467]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[468]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_R|ZL_avatar_2022_rig:IKExtraLeg_R|ZL_avatar_2022_rig:IKLeg_R|ZL_avatar_2022_rig:RollOffsetHeel_R|ZL_avatar_2022_rig:RollRollerHeel_R|ZL_avatar_2022_rig:RollExtraHeel_R|ZL_avatar_2022_rig:RollHeel_R|ZL_avatar_2022_rig:RollOffsetToesEnd_R|ZL_avatar_2022_rig:RollRollerToesEnd_R|ZL_avatar_2022_rig:RollExtraToesEnd_R|ZL_avatar_2022_rig:RollToesEnd_R|ZL_avatar_2022_rig:IKOffsetToes_R|ZL_avatar_2022_rig:IKExtraToes_R|ZL_avatar_2022_rig:IKToes_R.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[469]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_R|ZL_avatar_2022_rig:PoleExtraLeg_R|ZL_avatar_2022_rig:PoleLeg_R.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[470]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_R|ZL_avatar_2022_rig:PoleExtraLeg_R|ZL_avatar_2022_rig:PoleLeg_R.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[471]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_R|ZL_avatar_2022_rig:PoleExtraLeg_R|ZL_avatar_2022_rig:PoleLeg_R.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[472]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_R|ZL_avatar_2022_rig:PoleExtraLeg_R|ZL_avatar_2022_rig:PoleLeg_R.follow" 
		"ZL_avatar_2022_rigRN.placeHolderList[473]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_R|ZL_avatar_2022_rig:PoleExtraLeg_R|ZL_avatar_2022_rig:PoleLeg_R.lock" 
		"ZL_avatar_2022_rigRN.placeHolderList[474]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.scale" 
		"ZL_avatar_2022_rigRN.placeHolderList[475]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[476]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[477]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[478]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.translate" 
		"ZL_avatar_2022_rigRN.placeHolderList[479]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[480]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[481]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[482]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.rotatePivot" 
		"ZL_avatar_2022_rigRN.placeHolderList[483]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.rotatePivotTranslate" 
		"ZL_avatar_2022_rigRN.placeHolderList[484]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.parentMatrix" 
		"ZL_avatar_2022_rigRN.placeHolderList[485]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.rotate" 
		"ZL_avatar_2022_rigRN.placeHolderList[486]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[487]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[488]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[489]" ""
		5 3 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.rotateOrder" 
		"ZL_avatar_2022_rigRN.placeHolderList[490]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.follow" 
		"ZL_avatar_2022_rigRN.placeHolderList[491]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.stretchy" 
		"ZL_avatar_2022_rigRN.placeHolderList[492]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.antiPop" 
		"ZL_avatar_2022_rigRN.placeHolderList[493]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.Lenght1" 
		"ZL_avatar_2022_rigRN.placeHolderList[494]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.Lenght2" 
		"ZL_avatar_2022_rigRN.placeHolderList[495]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.Fatness1" 
		"ZL_avatar_2022_rigRN.placeHolderList[496]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.Fatness2" 
		"ZL_avatar_2022_rigRN.placeHolderList[497]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.volume" 
		"ZL_avatar_2022_rigRN.placeHolderList[498]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetArm_L|ZL_avatar_2022_rig:IKExtraArm_L|ZL_avatar_2022_rig:IKArm_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[499]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_L|ZL_avatar_2022_rig:PoleExtraArm_L|ZL_avatar_2022_rig:PoleArm_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[500]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_L|ZL_avatar_2022_rig:PoleExtraArm_L|ZL_avatar_2022_rig:PoleArm_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[501]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetArm_L|ZL_avatar_2022_rig:PoleExtraArm_L|ZL_avatar_2022_rig:PoleArm_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[502]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[503]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[504]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[505]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[506]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[507]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[508]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[509]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[510]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[511]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.swivel" 
		"ZL_avatar_2022_rigRN.placeHolderList[512]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.rollAngle" 
		"ZL_avatar_2022_rigRN.placeHolderList[513]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.roll" 
		"ZL_avatar_2022_rigRN.placeHolderList[514]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.stretchy" 
		"ZL_avatar_2022_rigRN.placeHolderList[515]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.antiPop" 
		"ZL_avatar_2022_rigRN.placeHolderList[516]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.Lenght1" 
		"ZL_avatar_2022_rigRN.placeHolderList[517]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.Lenght2" 
		"ZL_avatar_2022_rigRN.placeHolderList[518]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.Fatness1" 
		"ZL_avatar_2022_rigRN.placeHolderList[519]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.Fatness2" 
		"ZL_avatar_2022_rigRN.placeHolderList[520]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.volume" 
		"ZL_avatar_2022_rigRN.placeHolderList[521]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[522]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[523]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[524]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[525]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[526]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[527]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[528]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[529]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[530]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[531]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[532]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[533]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[534]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[535]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[536]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[537]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[538]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[539]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[540]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[541]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[542]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[543]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[544]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[545]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[546]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[547]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[548]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[549]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[550]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[551]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:RollOffsetToes_L|ZL_avatar_2022_rig:RollRollerToes_L|ZL_avatar_2022_rig:RollExtraToes_L|ZL_avatar_2022_rig:RollToes_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[552]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[553]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[554]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[555]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[556]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.scaleX" 
		"ZL_avatar_2022_rigRN.placeHolderList[557]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.scaleY" 
		"ZL_avatar_2022_rigRN.placeHolderList[558]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.scaleZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[559]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[560]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[561]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:IKOffsetLeg_L|ZL_avatar_2022_rig:IKExtraLeg_L|ZL_avatar_2022_rig:IKLeg_L|ZL_avatar_2022_rig:RollOffsetHeel_L|ZL_avatar_2022_rig:RollRollerHeel_L|ZL_avatar_2022_rig:RollExtraHeel_L|ZL_avatar_2022_rig:RollHeel_L|ZL_avatar_2022_rig:RollOffsetToesEnd_L|ZL_avatar_2022_rig:RollRollerToesEnd_L|ZL_avatar_2022_rig:RollExtraToesEnd_L|ZL_avatar_2022_rig:RollToesEnd_L|ZL_avatar_2022_rig:IKOffsetToes_L|ZL_avatar_2022_rig:IKExtraToes_L|ZL_avatar_2022_rig:IKToes_L.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[562]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_L|ZL_avatar_2022_rig:PoleExtraLeg_L|ZL_avatar_2022_rig:PoleLeg_L.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[563]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_L|ZL_avatar_2022_rig:PoleExtraLeg_L|ZL_avatar_2022_rig:PoleLeg_L.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[564]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_L|ZL_avatar_2022_rig:PoleExtraLeg_L|ZL_avatar_2022_rig:PoleLeg_L.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[565]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_L|ZL_avatar_2022_rig:PoleExtraLeg_L|ZL_avatar_2022_rig:PoleLeg_L.follow" 
		"ZL_avatar_2022_rigRN.placeHolderList[566]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:IKSystem|ZL_avatar_2022_rig:IKHandle|ZL_avatar_2022_rig:PoleOffsetLeg_L|ZL_avatar_2022_rig:PoleExtraLeg_L|ZL_avatar_2022_rig:PoleLeg_L.lock" 
		"ZL_avatar_2022_rigRN.placeHolderList[567]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintArm_R|ZL_avatar_2022_rig:FKIKArm_R.FKIKBlend" 
		"ZL_avatar_2022_rigRN.placeHolderList[568]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintArm_R|ZL_avatar_2022_rig:FKIKArm_R.IKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[569]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintArm_R|ZL_avatar_2022_rig:FKIKArm_R.FKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[570]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintLeg_R|ZL_avatar_2022_rig:FKIKLeg_R.FKIKBlend" 
		"ZL_avatar_2022_rigRN.placeHolderList[571]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintLeg_R|ZL_avatar_2022_rig:FKIKLeg_R.IKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[572]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintLeg_R|ZL_avatar_2022_rig:FKIKLeg_R.FKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[573]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintSpine_M|ZL_avatar_2022_rig:FKIKSpine_M.FKIKBlend" 
		"ZL_avatar_2022_rigRN.placeHolderList[574]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintSpine_M|ZL_avatar_2022_rig:FKIKSpine_M.IKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[575]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintSpine_M|ZL_avatar_2022_rig:FKIKSpine_M.FKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[576]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintArm_L|ZL_avatar_2022_rig:FKIKArm_L.FKIKBlend" 
		"ZL_avatar_2022_rigRN.placeHolderList[577]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintArm_L|ZL_avatar_2022_rig:FKIKArm_L.IKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[578]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintArm_L|ZL_avatar_2022_rig:FKIKArm_L.FKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[579]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintLeg_L|ZL_avatar_2022_rig:FKIKLeg_L.FKIKBlend" 
		"ZL_avatar_2022_rigRN.placeHolderList[580]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintLeg_L|ZL_avatar_2022_rig:FKIKLeg_L.IKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[581]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:FKIKSystem|ZL_avatar_2022_rig:FKIKParentConstraintLeg_L|ZL_avatar_2022_rig:FKIKLeg_L.FKVis" 
		"ZL_avatar_2022_rigRN.placeHolderList[582]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.translateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[583]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[584]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.translateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[585]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.rotateX" 
		"ZL_avatar_2022_rigRN.placeHolderList[586]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.rotateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[587]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.rotateZ" 
		"ZL_avatar_2022_rigRN.placeHolderList[588]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.CenterBtwFeet" 
		"ZL_avatar_2022_rigRN.placeHolderList[589]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:RootSystem|ZL_avatar_2022_rig:RootCenterBtwLegsBlended_M|ZL_avatar_2022_rig:RootOffsetX_M|ZL_avatar_2022_rig:RootExtraX_M|ZL_avatar_2022_rig:RootX_M.visibility" 
		"ZL_avatar_2022_rigRN.placeHolderList[590]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_R.spread" 
		"ZL_avatar_2022_rigRN.placeHolderList[591]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_R.indexCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[592]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_R.middleCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[593]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_R.ringCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[594]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_R.thumbCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[595]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_L.spread" 
		"ZL_avatar_2022_rigRN.placeHolderList[596]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_L.indexCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[597]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_L.middleCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[598]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_L.ringCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[599]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:MotionSystem|ZL_avatar_2022_rig:DrivingSystem|ZL_avatar_2022_rig:Fingers_L.thumbCurl" 
		"ZL_avatar_2022_rigRN.placeHolderList[600]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[601]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[602]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Smile2.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[603]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Smile2|ZL_avatar_2022_rig:Slide_bar01|ZL_avatar_2022_rig:bar01.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[604]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Smile2|ZL_avatar_2022_rig:Slide_bar01|ZL_avatar_2022_rig:bar01.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[605]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Sad2.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[606]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Sad2|ZL_avatar_2022_rig:Slide_bar02|ZL_avatar_2022_rig:bar02.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[607]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Sad2|ZL_avatar_2022_rig:Slide_bar03|ZL_avatar_2022_rig:bar03.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[608]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Angry2.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[609]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Angry2|ZL_avatar_2022_rig:Slide_bar04|ZL_avatar_2022_rig:bar04.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[610]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Angry2|ZL_avatar_2022_rig:Slide_bar05|ZL_avatar_2022_rig:bar05.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[611]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Twitched.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[612]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Twitched|ZL_avatar_2022_rig:Slide_barL06|ZL_avatar_2022_rig:barL06.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[613]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Twitched|ZL_avatar_2022_rig:Slide_barL06|ZL_avatar_2022_rig:L06.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[614]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Twitched|ZL_avatar_2022_rig:Slide_barR06|ZL_avatar_2022_rig:barR06.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[615]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Twitched|ZL_avatar_2022_rig:Slide_barR06|ZL_avatar_2022_rig:barR06.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[616]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Twitched|ZL_avatar_2022_rig:Slide_barR06|ZL_avatar_2022_rig:R06.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[617]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Happy.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[618]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Happy|ZL_avatar_2022_rig:Slide_bar06|ZL_avatar_2022_rig:bar06.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[619]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Happy|ZL_avatar_2022_rig:Slide_bar07|ZL_avatar_2022_rig:bar07.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[620]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Giggle.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[621]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Giggle|ZL_avatar_2022_rig:Slide_bar08|ZL_avatar_2022_rig:bar08.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[622]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Wave.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[623]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Wave|ZL_avatar_2022_rig:Slide_bar09|ZL_avatar_2022_rig:bar09.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[624]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Pout.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[625]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Pout|ZL_avatar_2022_rig:Slide_bar10|ZL_avatar_2022_rig:bar10.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[626]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Pout|ZL_avatar_2022_rig:Slide_bar10|ZL_avatar_2022_rig:bar10.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[627]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Laugh.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[628]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Laugh|ZL_avatar_2022_rig:Slide_bar17|ZL_avatar_2022_rig:bar17.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[629]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Poor.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[630]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Poor|ZL_avatar_2022_rig:Slide_bar11|ZL_avatar_2022_rig:bar11.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[631]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Bulging.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[632]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:Bulging|ZL_avatar_2022_rig:Slide_bar12|ZL_avatar_2022_rig:bar12.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[633]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:A.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[634]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:A|ZL_avatar_2022_rig:Slide_bar13|ZL_avatar_2022_rig:bar13.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[635]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:A|ZL_avatar_2022_rig:Slide_bar13|ZL_avatar_2022_rig:bar13.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[636]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:O.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[637]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:O|ZL_avatar_2022_rig:Slide_bar14|ZL_avatar_2022_rig:bar14.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[638]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:O|ZL_avatar_2022_rig:Slide_bar14|ZL_avatar_2022_rig:bar14.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[639]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:E.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[640]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:E|ZL_avatar_2022_rig:Slide_bar15|ZL_avatar_2022_rig:bar15.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[641]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:S.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[642]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:zui|ZL_avatar_2022_rig:S|ZL_avatar_2022_rig:Slide_bar16|ZL_avatar_2022_rig:bar16.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[643]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[644]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Startled.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[645]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Startled|ZL_avatar_2022_rig:Slide_barL01|ZL_avatar_2022_rig:barL01.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[646]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Startled|ZL_avatar_2022_rig:Slide_barL01|ZL_avatar_2022_rig:L01.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[647]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Startled|ZL_avatar_2022_rig:Slide_barR01|ZL_avatar_2022_rig:barR01.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[648]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Startled|ZL_avatar_2022_rig:Slide_barR01|ZL_avatar_2022_rig:R01.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[649]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Pain.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[650]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Pain|ZL_avatar_2022_rig:Slide_barL02|ZL_avatar_2022_rig:barL02.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[651]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Pain|ZL_avatar_2022_rig:Slide_barL02|ZL_avatar_2022_rig:L02.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[652]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Pain|ZL_avatar_2022_rig:Slide_barR02|ZL_avatar_2022_rig:barR02.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[653]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Pain|ZL_avatar_2022_rig:Slide_barR02|ZL_avatar_2022_rig:R02.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[654]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Terrified.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[655]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Terrified|ZL_avatar_2022_rig:Slide_barL11|ZL_avatar_2022_rig:barL11.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[656]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Terrified|ZL_avatar_2022_rig:Slide_barL11|ZL_avatar_2022_rig:L11.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[657]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Terrified|ZL_avatar_2022_rig:Slide_barR11|ZL_avatar_2022_rig:barR11.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[658]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Terrified|ZL_avatar_2022_rig:Slide_barR11|ZL_avatar_2022_rig:R11.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[659]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Close.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[660]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Close|ZL_avatar_2022_rig:Slide_barL09|ZL_avatar_2022_rig:barL09.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[661]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Close|ZL_avatar_2022_rig:Slide_barL09|ZL_avatar_2022_rig:barL09.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[662]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Close|ZL_avatar_2022_rig:Slide_barL09|ZL_avatar_2022_rig:L09.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[663]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Close|ZL_avatar_2022_rig:Slide_barR09|ZL_avatar_2022_rig:barR09.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[664]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Close|ZL_avatar_2022_rig:Slide_barR09|ZL_avatar_2022_rig:barR09.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[665]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Close|ZL_avatar_2022_rig:Slide_barR09|ZL_avatar_2022_rig:R09.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[666]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Wide.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[667]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Wide|ZL_avatar_2022_rig:Slide_barL10|ZL_avatar_2022_rig:barL10.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[668]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Wide|ZL_avatar_2022_rig:Slide_barL10|ZL_avatar_2022_rig:L10.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[669]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Wide|ZL_avatar_2022_rig:Slide_barR10|ZL_avatar_2022_rig:barR10.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[670]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Wide|ZL_avatar_2022_rig:Slide_barR10|ZL_avatar_2022_rig:R10.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[671]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Sad3.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[672]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Sad3|ZL_avatar_2022_rig:Slide_barL08|ZL_avatar_2022_rig:barL08.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[673]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Sad3|ZL_avatar_2022_rig:Slide_barL08|ZL_avatar_2022_rig:L08.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[674]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Sad3|ZL_avatar_2022_rig:Slide_barR08|ZL_avatar_2022_rig:barR08.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[675]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Sad3|ZL_avatar_2022_rig:Slide_barR08|ZL_avatar_2022_rig:R08.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[676]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Smile3.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[677]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Smile3|ZL_avatar_2022_rig:Slide_barL07|ZL_avatar_2022_rig:barL07.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[678]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Smile3|ZL_avatar_2022_rig:Slide_barL07|ZL_avatar_2022_rig:barL07.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[679]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Smile3|ZL_avatar_2022_rig:Slide_barL07|ZL_avatar_2022_rig:L07.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[680]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Smile3|ZL_avatar_2022_rig:Slide_barR07|ZL_avatar_2022_rig:barR07.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[681]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Smile3|ZL_avatar_2022_rig:Slide_barR07|ZL_avatar_2022_rig:barR07.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[682]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:yanjing|ZL_avatar_2022_rig:Smile3|ZL_avatar_2022_rig:Slide_barR07|ZL_avatar_2022_rig:R07.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[683]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[684]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Smile1.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[685]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Smile1|ZL_avatar_2022_rig:Slide_barL03|ZL_avatar_2022_rig:barL03.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[686]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Smile1|ZL_avatar_2022_rig:Slide_barL03|ZL_avatar_2022_rig:barL03.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[687]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Smile1|ZL_avatar_2022_rig:Slide_barL03|ZL_avatar_2022_rig:L03.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[688]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Smile1|ZL_avatar_2022_rig:Slide_barR03|ZL_avatar_2022_rig:barR03.translateY" 
		"ZL_avatar_2022_rigRN.placeHolderList[689]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Smile1|ZL_avatar_2022_rig:Slide_barR03|ZL_avatar_2022_rig:barR03.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[690]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Smile1|ZL_avatar_2022_rig:Slide_barR03|ZL_avatar_2022_rig:R03.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[691]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Sad1.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[692]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Sad1|ZL_avatar_2022_rig:Slide_barL04|ZL_avatar_2022_rig:barL04.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[693]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Sad1|ZL_avatar_2022_rig:Slide_barL04|ZL_avatar_2022_rig:L04.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[694]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Sad1|ZL_avatar_2022_rig:Slide_barR04|ZL_avatar_2022_rig:barR04.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[695]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Sad1|ZL_avatar_2022_rig:Slide_barR04|ZL_avatar_2022_rig:R04.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[696]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Angry1.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[697]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Angry1|ZL_avatar_2022_rig:Slide_barL05|ZL_avatar_2022_rig:barL05.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[698]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Angry1|ZL_avatar_2022_rig:Slide_barL05|ZL_avatar_2022_rig:L05.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[699]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Angry1|ZL_avatar_2022_rig:Slide_barR05|ZL_avatar_2022_rig:barR05.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[700]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:meimao|ZL_avatar_2022_rig:Angry1|ZL_avatar_2022_rig:Slide_barR05|ZL_avatar_2022_rig:R05.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[701]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:guangjiao.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[702]" ""
		5 4 "ZL_avatar_2022_rigRN" "|ZL_avatar_2022_rig:Group|ZL_avatar_2022_rig:world_ctrl|ZL_avatar_2022_rig:root_ctrl|ZL_avatar_2022_rig:Main|ZL_avatar_2022_rig:expression_panel_grp|ZL_avatar_2022_rig:expression_panel|ZL_avatar_2022_rig:guangjiao|ZL_avatar_2022_rig:Slide_bar18|ZL_avatar_2022_rig:bar18.drawOverride" 
		"ZL_avatar_2022_rigRN.placeHolderList[703]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "88E0DF83-4042-7267-C804-E98773B2198F";
	addAttr -ci true -sn "ARV_options" -ln "ARV_options" -dt "string";
	setAttr ".GI_diffuse_samples" 3;
	setAttr ".GI_transmission_samples" 0;
	setAttr ".GI_volume_samples" 0;
	setAttr ".GI_transmission_depth" 3;
	setAttr ".GI_total_depth" 6;
	setAttr ".auto_transparency_depth" 2;
	setAttr ".version" -type "string" "4.2.3";
	setAttr ".ARV_options" -type "string" "Test Resolution=100%;Color Management.Gamma=1;Color Management.Exposure=0;Background.BG=BG Color;Background.Color=0 0 0;Background.Image=;Background.Scale=1 1;Background.Offset=0 0;Background.Apply Color Management=1;Foreground.Enable FG=0;Foreground.Image=;Foreground.Scale=1 1;Foreground.Offset=0 0;Foreground.Apply Color Management=1;";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "7FEAD185-439A-BECF-516B-F5999A91E612";
	setAttr ".width" 1.5;
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "7DEE44A2-4285-FB6A-A934-CFACA1675071";
	setAttr ".color_management" 1;
	setAttr ".ai_translator" -type "string" "tif";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "A1E0FACA-4744-FCC8-C293-36B0714C9CE9";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode reference -n "ZL_zt_book01_rigRN";
	rename -uid "F782F460-45C2-BB5B-A6CC-5EA0903D3A3B";
	setAttr -s 31 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".phl[31]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"ZL_zt_book01_rigRN"
		"ZL_zt_book01_rigRN" 10
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_rotateX" 2 "add 0 0 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_rotateY" 2 "add 0 0 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_rotateZ" 2 "add 0 -0.074339576517084338 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_visibility" 2 "add 0 1 9 5 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_translateX" 2 "add 0 0 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_translateY" 2 "add 0 0 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_translateZ" 2 "add 0 0 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_scaleX" 2 "add 0 1 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_scaleY" 2 "add 0 1 18 18 1 0 0" "cut 1.25 46.25" 
		0
		7 "fcurve" "ZL_zt_book01_rig:ZL_zt_book01_L_scaleZ" 2 "add 0 1 18 18 1 0 0" "cut 1.25 46.25" 
		0
		"ZL_zt_book01_rigRN" 37
		0 "|ZL_zt_book01_rigRNfosterParent1|ZL_zt_book01_root_parentConstraint1" 
		"|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root" "-s -r "
		2 "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M" 
		"rotate" " -type \"double3\" 0 0 0"
		2 "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_01_mod|ZL_zt_book01_rig:ZL_zt_book01_01_mod_LOD1" 
		"visibility" " 0"
		2 "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_01_mod|ZL_zt_book01_rig:ZL_zt_book01_01_mod_LOD2" 
		"visibility" " 0"
		2 "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_02_mod|ZL_zt_book01_rig:ZL_zt_book01_02_mod_LOD1" 
		"visibility" " 0"
		2 "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_02_mod|ZL_zt_book01_rig:ZL_zt_book01_02_mod_LOD2" 
		"visibility" " 0"
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.translateX" 
		"ZL_zt_book01_rigRN.placeHolderList[1]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.translateY" 
		"ZL_zt_book01_rigRN.placeHolderList[2]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.translateZ" 
		"ZL_zt_book01_rigRN.placeHolderList[3]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.rotateX" 
		"ZL_zt_book01_rigRN.placeHolderList[4]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.rotateY" 
		"ZL_zt_book01_rigRN.placeHolderList[5]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.rotateZ" 
		"ZL_zt_book01_rigRN.placeHolderList[6]" ""
		5 3 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.rotateOrder" 
		"ZL_zt_book01_rigRN.placeHolderList[7]" ""
		5 3 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.parentInverseMatrix" 
		"ZL_zt_book01_rigRN.placeHolderList[8]" ""
		5 3 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.rotatePivot" 
		"ZL_zt_book01_rigRN.placeHolderList[9]" ""
		5 3 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.rotatePivotTranslate" 
		"ZL_zt_book01_rigRN.placeHolderList[10]" ""
		5 3 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root.jointOrient" 
		"ZL_zt_book01_rigRN.placeHolderList[11]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.scaleX" 
		"ZL_zt_book01_rigRN.placeHolderList[12]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.scaleY" 
		"ZL_zt_book01_rigRN.placeHolderList[13]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.scaleZ" 
		"ZL_zt_book01_rigRN.placeHolderList[14]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.rotateZ" 
		"ZL_zt_book01_rigRN.placeHolderList[15]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.rotateX" 
		"ZL_zt_book01_rigRN.placeHolderList[16]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.rotateY" 
		"ZL_zt_book01_rigRN.placeHolderList[17]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.visibility" 
		"ZL_zt_book01_rigRN.placeHolderList[18]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.translateX" 
		"ZL_zt_book01_rigRN.placeHolderList[19]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.translateY" 
		"ZL_zt_book01_rigRN.placeHolderList[20]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_L.translateZ" 
		"ZL_zt_book01_rigRN.placeHolderList[21]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.rotateZ" 
		"ZL_zt_book01_rigRN.placeHolderList[22]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.rotateX" 
		"ZL_zt_book01_rigRN.placeHolderList[23]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.rotateY" 
		"ZL_zt_book01_rigRN.placeHolderList[24]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.visibility" 
		"ZL_zt_book01_rigRN.placeHolderList[25]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.translateX" 
		"ZL_zt_book01_rigRN.placeHolderList[26]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.translateY" 
		"ZL_zt_book01_rigRN.placeHolderList[27]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.translateZ" 
		"ZL_zt_book01_rigRN.placeHolderList[28]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.scaleX" 
		"ZL_zt_book01_rigRN.placeHolderList[29]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.scaleY" 
		"ZL_zt_book01_rigRN.placeHolderList[30]" ""
		5 4 "ZL_zt_book01_rigRN" "|ZL_zt_book01_rig:ZL_zt_book01_rig|ZL_zt_book01_rig:ZL_zt_book01_root|ZL_zt_book01_rig:ZL_zt_book01_M|ZL_zt_book01_rig:ZL_zt_book01_R.scaleZ" 
		"ZL_zt_book01_rigRN.placeHolderList[31]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "4F377443-4626-BDE5-8ECF-2BBCE722F8AD";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 0\n            -nurbsCurves 0\n            -nurbsSurfaces 0\n            -polymeshes 1\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 0\n"
		+ "            -controlVertices 0\n            -hulls 0\n            -grid 1\n            -imagePlane 0\n            -joints 0\n            -ikHandles 0\n            -deformers 0\n            -dynamics 0\n            -particleInstancers 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nParticles 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n            -pluginShapes 0\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -motionTrails 0\n            -clipGhosts 0\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 910\n            -height 484\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n            -activeCustomGeometry \"meshShaderball\" \n"
		+ "            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 0 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n"
		+ "            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 909\n            -height 484\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n            -activeCustomGeometry \"meshShaderball\" \n            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 0\n            -nurbsCurves 0\n            -nurbsSurfaces 0\n            -polymeshes 1\n"
		+ "            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 0\n            -controlVertices 0\n            -hulls 0\n            -grid 1\n            -imagePlane 0\n            -joints 0\n            -ikHandles 0\n            -deformers 0\n            -dynamics 0\n            -particleInstancers 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nParticles 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n            -pluginShapes 0\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -motionTrails 0\n            -clipGhosts 0\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 910\n            -height 484\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n"
		+ "            -activeCustomGeometry \"meshShaderball\" \n            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 0 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n"
		+ "            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 0\n            -nurbsCurves 1\n            -nurbsSurfaces 0\n            -polymeshes 1\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 0\n            -controlVertices 0\n            -hulls 0\n            -grid 1\n            -imagePlane 0\n            -joints 0\n            -ikHandles 0\n            -deformers 0\n            -dynamics 0\n            -particleInstancers 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nParticles 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n"
		+ "            -pluginShapes 0\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -motionTrails 0\n            -clipGhosts 0\n            -greasePencils 0\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1826\n            -height 1016\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n            -activeCustomGeometry \"meshShaderball\" \n            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\toutlinerPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n"
		+ "            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"{}\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n"
		+ "            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n"
		+ "            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n"
		+ "            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n"
		+ "                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -isSet 0\n                -isSetMember 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                -selectionOrder \"display\" \n                -expandAttribute 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n"
		+ "                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -outliner \"graphEditor1OutlineEd\" \n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n"
		+ "                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n"
		+ "                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n"
		+ "                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n"
		+ "                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n"
		+ "                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n"
		+ "\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -editorChanged \"updateModelPanelBar\" \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n"
		+ "                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererOverrideName \"stereoOverrideVP2\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n"
		+ "                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n"
		+ "            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n"
		+ "            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n"
		+ "            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 0\n            -height 0\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n"
		+ "            -maxConstantTransparency 1\n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 0\n            -height 0\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n"
		+ "            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 0\n            -height 0\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 0\n            -height 0\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n"
		+ "            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 0\n            -height 0\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n"
		+ "            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n"
		+ "            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 0\n            -height 0\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -camera \\\"persp\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 4 4 \\n    -bumpResolution 4 4 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 0\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 0\\n    -nurbsCurves 1\\n    -nurbsSurfaces 0\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 0\\n    -hulls 0\\n    -grid 1\\n    -imagePlane 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -particleInstancers 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -pluginShapes 0\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -motionTrails 0\\n    -clipGhosts 0\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1826\\n    -height 1016\\n    -sceneRenderFilter 0\\n    -activeShadingGraph \\\"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\\\" \\n    -activeCustomGeometry \\\"meshShaderball\\\" \\n    -activeCustomLighSet \\\"defaultAreaLightSet\\\" \\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -camera \\\"persp\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 4 4 \\n    -bumpResolution 4 4 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 0\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 0\\n    -nurbsCurves 1\\n    -nurbsSurfaces 0\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 0\\n    -hulls 0\\n    -grid 1\\n    -imagePlane 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -particleInstancers 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nParticles 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -pluginShapes 0\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -motionTrails 0\\n    -clipGhosts 0\\n    -greasePencils 0\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1826\\n    -height 1016\\n    -sceneRenderFilter 0\\n    -activeShadingGraph \\\"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\\\" \\n    -activeCustomGeometry \\\"meshShaderball\\\" \\n    -activeCustomLighSet \\\"defaultAreaLightSet\\\" \\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 10 -size 200 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"1 0.000000 -1.000000 -0.000000 0.000000 0.000000 -1.000000\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "1CDD258C-401A-8B70-3F1D-3CB9FCCA9DD3";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 300 -ast 0 -aet 320 ";
	setAttr ".st" 6;
createNode animCurveTU -n "FKNeck_M_visibility";
	rename -uid "26695293-4419-2450-B435-1E9FBFE709D4";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kit[0:1]"  9 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
createNode animCurveTL -n "FKNeck_M_translateX";
	rename -uid "FC41CC1C-4706-D9C4-74C6-CF93AE61D8FE";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTL -n "FKNeck_M_translateY";
	rename -uid "C8177B75-4B53-F602-E84D-3F84BAA435DA";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTL -n "FKNeck_M_translateZ";
	rename -uid "5739B69A-433B-665C-3ECA-8580E23A2F04";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKNeck_M_scaleX";
	rename -uid "EED35563-4B34-85C2-14C6-14B4F18C5B0C";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKNeck_M_scaleY";
	rename -uid "7E7EAF68-47A3-A63B-0DE7-6BAE1B6AEDCE";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKNeck_M_scaleZ";
	rename -uid "9743E95F-4FDB-96F1-502E-C3B84F2EC47D";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTA -n "FKNeck_M_rotateX";
	rename -uid "02A70B15-496E-F345-BF95-0A965C113FB1";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0.41825249862900477 300 0.41825249862900477;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  0.99998143097759584 0.99998143097759584;
	setAttr -s 2 ".koy[0:1]"  -0.0060940708889736326 -0.0060940708889736326;
createNode animCurveTA -n "FKNeck_M_rotateY";
	rename -uid "B053F49A-428E-6FC3-B11A-AE838F7082F4";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -3.0165262392398255 300 -3.0165262392398255;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  0.99903646290825054 0.99903646290825054;
	setAttr -s 2 ".koy[0:1]"  0.04388787736689595 0.04388787736689595;
createNode animCurveTA -n "FKNeck_M_rotateZ";
	rename -uid "1740F53A-4C59-D630-0C32-7FAACF76C79E";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 10.558537528873677 300 10.558537528873677;
	setAttr -s 2 ".kit[0:1]"  18 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[0:1]"  0.99952836987605187 0.99952836987605187;
	setAttr -s 2 ".koy[0:1]"  -0.030708920738480482 -0.030708920738480482;
createNode animCurveTA -n "FKHead_M_rotateX";
	rename -uid "75842DF9-4B5D-F396-BCD4-26BF1EC11B6A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 17 ".ktv[0:16]"  0 20.612888131601945 9 21.793426296224414
		 17 24.452208815024463 37 25.317684802183681 73 22.643614588379673 156 24.328017104270753
		 164 23.204462200296501 173 19.201519909422679 180 11.35012199558847 193 2.9023951781603063
		 213 3.8613569978148101 227 4.9097338504982773 240 5.1671996816859549 262 6.7141037562269332
		 272 14.265512151861637 282 22.273810969983053 300 20.612888131601945;
	setAttr -s 17 ".kit[0:16]"  1 18 9 18 18 18 9 9 
		18 18 9 18 9 1 18 18 18;
	setAttr -s 17 ".kot[0:16]"  1 18 9 18 18 18 9 9 
		18 18 9 18 9 1 18 18 18;
	setAttr -s 17 ".kix[0:16]"  1 0.99308085423474146 0.99783541415211585 
		1 1 1 0.98776281201385185 0.93230558836949851 0.91976375192869531 1 0.99952253714330808 
		0.99967951137314703 0.99963587956173838 0.99679066232425495 0.92611022923702147 1 
		1;
	setAttr -s 17 ".kiy[0:16]"  0 0.11743260600189423 0.065760826210407311 
		0 0 0 -0.1559635444662886 -0.36167152209567605 -0.39247247118498563 0 0.030898183483895787 
		0.02531550000980123 0.026983481851487953 0.080052329779794651 0.37725302292036261 
		0 0;
	setAttr -s 17 ".kox[0:16]"  1 0.99308085423474157 0.99783541415211585 
		1 1 1 0.98776281201385185 0.93230558836949851 0.91976375192869531 1 0.99952253714330808 
		0.99967951137314692 0.99963587956173838 0.99679066686248297 0.92611022923702147 1 
		1;
	setAttr -s 17 ".koy[0:16]"  0 0.11743260600189424 0.065760826210407311 
		0 0 0 -0.1559635444662886 -0.36167152209567605 -0.39247247118498568 0 0.030898183483895787 
		0.02531550000980123 0.026983481851487953 0.080052273270946342 0.37725302292036261 
		0 0;
createNode animCurveTA -n "FKHead_M_rotateY";
	rename -uid "87ED6F9F-44C2-58D8-2BDA-ADB869F985B3";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 17 ".ktv[0:16]"  0 -19.833846433234729 9 -19.466336096697816
		 17 -16.977771846234749 37 -16.075146632711029 73 -14.218625010317439 156 -17.795805187989995
		 164 -21.851567771722749 173 -15.3500669312319 180 -13.71829879181489 193 -16.565983169128039
		 213 -16.870838860413201 227 -14.451447349453387 240 -14.119626083510511 262 -17.281349192499327
		 272 -13.913990530507283 282 -14.915403078305422 300 -19.833846433234729;
	setAttr -s 17 ".kit[0:16]"  1 18 9 18 18 18 9 1 
		9 1 9 18 9 9 9 9 18;
	setAttr -s 17 ".kot[0:16]"  1 18 9 18 18 18 9 1 
		9 1 9 18 9 9 9 9 18;
	setAttr -s 17 ".kix[0:16]"  1 0.99794918601610039 0.99799530722612106 
		0.99966739857231157 1 0.99903696789929175 0.99717482157028747 0.9248389646550278 
		0.9994937271133586 0.98600050819675056 0.99947022155878906 0.99919719833969145 0.99910506683463662 
		0.99999433943200422 0.99808720033945875 0.99392838695402652 1;
	setAttr -s 17 ".kiy[0:16]"  0 0.064011109424870136 0.063287966902407372 
		0.025789382149779733 0 -0.043876380554800774 0.075115745528255506 0.38035889559180325 
		-0.03181649668091982 -0.1667423096749886 0.032546523888506554 0.040061937423338571 
		-0.042297345370084227 0.0033646848217390147 0.061821844994637797 -0.11002891259558574 
		0;
	setAttr -s 17 ".kox[0:16]"  1 0.99794918601610039 0.99799530722612106 
		0.99966739857231146 1 0.99903696789929164 0.99717482157028747 0.92483897579843277 
		0.9994937271133586 0.9860004966392677 0.99947022155878906 0.99919719833969134 0.99910506683463662 
		0.99999433943200422 0.99808720033945875 0.99392838695402652 1;
	setAttr -s 17 ".koy[0:16]"  0 0.064011109424870122 0.063287966902407372 
		0.025789382149779733 0 -0.043876380554800767 0.075115745528255506 0.38035886849672107 
		-0.03181649668091982 -0.16674237801805949 0.032546523888506554 0.040061937423338571 
		-0.042297345370084227 0.0033646848217390147 0.061821844994637797 -0.11002891259558574 
		0;
createNode animCurveTA -n "FKHead_M_rotateZ";
	rename -uid "3050D772-42D1-2A5F-70F0-4785B21A7A26";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 17 ".ktv[0:16]"  0 25.360745833997029 9 25.66912087619129
		 17 26.893483149660163 37 26.40219879018559 73 24.12499737749916 156 24.589742860086304
		 164 24.133444190462708 173 20.741369117919383 180 17.620851295138912 193 14.674001297388914
		 213 17.889262461800111 227 6.7701071129354506 240 3.0773818037760958 262 0.10863605366637445
		 272 7.7383078390644586 282 17.094866625790193 300 25.360745833997029;
	setAttr -s 17 ".kit[0:16]"  1 18 9 18 18 18 9 9 
		18 18 9 18 9 18 18 18 18;
	setAttr -s 17 ".kot[0:16]"  1 18 9 18 18 18 9 9 
		18 18 9 18 9 18 18 18 18;
	setAttr -s 17 ".kix[0:16]"  1 0.99888755204484625 0.99990605141321443 
		0.9996651443699851 1 1 0.99304852514499276 0.97803457165652652 0.98761821900795022 
		1 0.99267346992277983 0.96113561170620487 0.99507108548534817 1 0.91372538209817089 
		0.9497589152911704 1;
	setAttr -s 17 ".kiy[0:16]"  0 0.047155682264754806 0.013707237038654377 
		-0.025876613606433133 0 0 -0.11770567831398233 -0.2084427418852354 -0.15687655491998959 
		0 -0.12082790286795546 -0.27607668483618719 -0.099164181189634965 0 0.40633228533990695 
		0.31298243213467963 0;
	setAttr -s 17 ".kox[0:16]"  1 0.99888755204484625 0.99990605141321443 
		0.99966514436998521 1 1 0.99304852514499276 0.97803457165652652 0.98761821900795022 
		1 0.99267346992277983 0.96113561170620476 0.99507108548534817 1 0.91372538209817089 
		0.9497589152911704 1;
	setAttr -s 17 ".koy[0:16]"  0 0.047155682264754806 0.013707237038654377 
		-0.025876613606433136 0 0 -0.11770567831398233 -0.2084427418852354 -0.15687655491998956 
		0 -0.12082790286795546 -0.27607668483618719 -0.099164181189634965 0 0.40633228533990695 
		0.31298243213467963 0;
createNode animCurveTU -n "FKEars_L_visibility";
	rename -uid "5C92F9DE-4265-C558-3DCC-6498A461490F";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[0:14]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
createNode animCurveTL -n "FKEars_L_translateX";
	rename -uid "C788D299-4BF8-DBB2-FC4F-979F337B2835";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKEars_L_translateY";
	rename -uid "FF5BBB83-4050-F20A-9648-DAA044018EB0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKEars_L_translateZ";
	rename -uid "9116A1AF-4E44-59F8-2EB9-0494142749D8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKEars_L_scaleX";
	rename -uid "413C1582-4F99-F76A-0DFA-BB999B2BD693";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKEars_L_scaleY";
	rename -uid "DB64881E-4596-9B67-CD12-0196EAEE18C4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKEars_L_scaleZ";
	rename -uid "BCA87CCF-4F7A-DAB3-92D1-948189FFF8B7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKEars_L_rotateX";
	rename -uid "443F8A04-430A-6204-CB43-EA905CECF3EB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKEars_L_rotateY";
	rename -uid "5CF2F290-47DD-0555-7535-E7A05014E3E2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKEars_L_rotateZ";
	rename -uid "A3F0D7A0-4335-5665-A8ED-E3A50DA87DA7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKScapula_R_visibility";
	rename -uid "8B1410D4-42F0-5354-A5CB-3780A4317308";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 73 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 300 1;
	setAttr -s 14 ".kit[0:13]"  9 1 9 9 9 9 9 9 
		9 9 9 9 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKScapula_R_translateX";
	rename -uid "AB2549DB-4A56-ABC4-7D62-A5AD85899B56";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 73 0 156 0 164 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 300 0;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKScapula_R_translateY";
	rename -uid "0CDFCCF8-4259-09D8-8186-A7AF6C445C76";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 73 0 156 0 164 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 300 0;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKScapula_R_translateZ";
	rename -uid "C5DFC1EC-4080-663E-75B9-1F9E09090491";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 73 0 156 0 164 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 300 0;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKScapula_R_scaleX";
	rename -uid "4B388CFD-47CB-0EEF-021F-BDA1A813D312";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 73 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 300 1;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKScapula_R_scaleY";
	rename -uid "5259D0FA-4931-659B-BDC6-05BF8B0449D5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 73 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 300 1;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKScapula_R_scaleZ";
	rename -uid "44A8BB3F-48AB-47AA-1306-6FBB8E28C620";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 73 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 300 1;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKScapula_R_rotateX";
	rename -uid "ACBE5787-46B8-528E-664F-56919B90D5B6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 9.0505962213544393 73 9.0505962213544393
		 156 0 164 0 173 0 180 0 187 0 193 0 207 0 240 0 262 0 272 -1.3471729934885823 279 9.0505962213544393
		 300 9.0505962213544393;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKScapula_R_rotateY";
	rename -uid "F29191EB-4492-02A2-6169-96A7BE909081";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 -29.945725470058285 73 -29.945725470058285
		 156 -30.656554999999997 164 -32.288228153948957 173 -30.656554999999997 180 -30.656554999999997
		 187 -30.656554999999997 193 -30.656554999999997 207 -30.656554999999997 240 -30.656554999999997
		 262 -30.656554999999997 272 -19.221627157806104 279 -29.945725470058285 300 -29.945725470058285;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 0.99990952563274271 1 1 1 1 1 1 1 1 1 
		1 1;
	setAttr -s 14 ".kiy[1:13]"  0 -0.013451414382999714 0 0 0 0 0 0 0 0 
		0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 0.99990952563274293 1 1 1 1 1 1 1 1 
		1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 -0.013451414382999715 0 0 0 0 0 0 0 
		0 0 0 0;
createNode animCurveTA -n "FKScapula_R_rotateZ";
	rename -uid "D4B349C8-41EA-076A-1B16-C89C9311F030";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 15.272864171374968 73 15.272864171374968
		 156 0 164 0 173 0 180 0 187 0 193 0 207 0 240 0 262 0 272 6.6299124077635314 279 15.272864171374968
		 300 15.272864171374968;
	setAttr -s 14 ".kit[1:13]"  1 18 18 18 18 18 18 18 
		18 18 18 1 1;
	setAttr -s 14 ".kot[0:13]"  1 1 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 0.90488322859231196 
		1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0.42565989077237881 
		0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 0.90488322859231207 
		1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0.42565989077237881 
		0 0;
createNode animCurveTU -n "FKScapula_L_visibility";
	rename -uid "2A0DD70A-4A05-7766-9AA0-4F9474392377";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kit[0:2]"  9 9 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
createNode animCurveTL -n "FKScapula_L_translateX";
	rename -uid "71A36CE1-4D00-C900-D214-00997EAB8DC6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTL -n "FKScapula_L_translateY";
	rename -uid "62003E0D-46A9-9A1D-9509-B08161693F06";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTL -n "FKScapula_L_translateZ";
	rename -uid "54FFAA71-4B2D-CC43-48BE-1390616B0482";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTU -n "FKScapula_L_scaleX";
	rename -uid "A2394475-47E0-846D-43DA-69B74548F233";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTU -n "FKScapula_L_scaleY";
	rename -uid "CBE3CF88-4953-6323-A6D7-93B5928157B7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTU -n "FKScapula_L_scaleZ";
	rename -uid "B011425F-4FA2-B19D-385A-20B081069108";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTA -n "FKScapula_L_rotateX";
	rename -uid "62A7820C-4689-B37C-81C7-5283BAD45CDB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTA -n "FKScapula_L_rotateY";
	rename -uid "AAC75648-48C1-224C-0D5E-B881D761B23A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -20 193 -20 300 -20;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTA -n "FKScapula_L_rotateZ";
	rename -uid "7345B5EB-4099-32DB-E4F4-06AA28F19A2F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[0:2]"  1 18 1;
	setAttr -s 3 ".kix[2]"  1;
	setAttr -s 3 ".kiy[2]"  0;
	setAttr -s 3 ".kox[0:2]"  1 1 1;
	setAttr -s 3 ".koy[0:2]"  0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_R_visibility";
	rename -uid "447682B0-4B98-691A-8EF8-0B8AD24B4676";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKMiddleFinger1_R_translateX";
	rename -uid "C6240656-4D7E-860A-FDE2-42ABBF26BFD2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger1_R_translateY";
	rename -uid "698C18CB-4FF3-56AE-2A38-8BAD73B85791";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger1_R_translateZ";
	rename -uid "0339316C-4B37-5379-2364-77B0FD100861";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_R_scaleX";
	rename -uid "CA6F450D-43F2-5397-1C2D-B086D1117596";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_R_scaleY";
	rename -uid "9A324A37-4B11-7D04-2EFB-7CB5B6807164";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_R_scaleZ";
	rename -uid "BDD11762-4B86-8FA9-D5C3-40A8E2158AE2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger1_R_rotateX";
	rename -uid "CE88B44A-4DF1-CB2C-E1EC-1B8E7124363D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger1_R_rotateY";
	rename -uid "B6EC5C33-4313-F8B2-15C9-AF8660D43226";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger1_R_rotateZ";
	rename -uid "9578FF87-495E-FA75-0B7E-DBBB2492A01D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger2_R_visibility";
	rename -uid "07BA7240-4B58-ECAE-8308-8D99C12EE923";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKMiddleFinger2_R_translateX";
	rename -uid "44D250BC-4665-09F4-71E1-FC9738F1B520";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger2_R_translateY";
	rename -uid "80AFBF2E-431C-6EDE-7568-4A8C76D851C1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger2_R_translateZ";
	rename -uid "7F2400C8-4312-EFD3-F149-3D9A30C84600";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger2_R_scaleX";
	rename -uid "3FF3957B-4B9B-F1F5-D8BE-0CAF8C2B5DEF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger2_R_scaleY";
	rename -uid "AF6BFBAD-4CA8-0A9D-8384-34AF92B5289C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger2_R_scaleZ";
	rename -uid "2D57F285-4606-453A-B0D5-C4BD04286604";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger2_R_rotateX";
	rename -uid "4F863489-44D2-46DB-C61F-DEA5AA419C24";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger2_R_rotateY";
	rename -uid "F985704E-48A3-10EC-8822-39A05B3F82E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 5.3925849000000001 17 5.3925849000000001
		 26 5.3925849000000001 156 5.3925849000000001 164 5.3925849000000001 173 0 180 4.6934161084548061
		 187 4.9686472999999998 193 4.9686472999999998 207 4.9686472999999998 240 4.9686472999999998
		 262 4.9686472999999998 272 4.9901467650638622 279 5.3027606114056258 287 5.3783673955814688
		 300 5.3925849000000001;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 0.9980981831984439 1 1 1 1 
		1 0.99999429755175973 0.99990819165870093 0.99999852439935533 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0.0616442754517047 0 0 0 0 
		0 0.0033771088171390116 0.01355021231666205 0.001717905443270734 0;
createNode animCurveTA -n "FKMiddleFinger2_R_rotateZ";
	rename -uid "EA809A56-4AB8-6F5A-8AA8-05A9EA820AC9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_R_visibility";
	rename -uid "D66A9915-4BC8-2053-7893-FC92D25E9188";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKMiddleFinger3_R_translateX";
	rename -uid "40D902E2-4AA9-5F6F-2EB3-809E54698C87";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger3_R_translateY";
	rename -uid "8D0F941A-4DAA-C68B-AB0E-B2A706E2B664";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger3_R_translateZ";
	rename -uid "6D723174-43A7-637C-4F3C-89B4F3681C65";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_R_scaleX";
	rename -uid "4BBF95FA-4696-6C4D-4706-C78F03247072";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_R_scaleY";
	rename -uid "D65F34AA-443E-05EA-DAAF-479A0264CCF2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_R_scaleZ";
	rename -uid "4488E7C9-4EE8-FF35-8F6A-8E85EC041FA9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger3_R_rotateX";
	rename -uid "D5E5DA19-4558-730F-F67A-1CAF5F399E86";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger3_R_rotateY";
	rename -uid "87067D9C-446A-1638-04AE-85BE5F6D35CD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 5.3925849000000001 17 5.3925849000000001
		 26 5.3925849000000001 156 5.3925849000000001 164 5.3925849000000001 173 0 180 4.6934161084548061
		 187 4.9686472999999998 193 4.9686472999999998 207 4.9686472999999998 240 4.9686472999999998
		 262 4.9686472999999998 272 4.9901467650638622 279 5.3027606114056258 287 5.3783673955814688
		 300 5.3925849000000001;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 0.9980981831984439 1 1 1 1 
		1 0.99999429755175973 0.99990819165870093 0.99999852439935533 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0.0616442754517047 0 0 0 0 
		0 0.0033771088171390116 0.01355021231666205 0.001717905443270734 0;
createNode animCurveTA -n "FKMiddleFinger3_R_rotateZ";
	rename -uid "119647EB-4ACB-3F81-61F0-B39DA288EEC9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger1_R_visibility";
	rename -uid "8AC370F2-4304-D969-B0CA-EAA9F19BF947";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKThumbFinger1_R_translateX";
	rename -uid "69C7519E-463A-DA44-B6D3-9BB617AEF66A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKThumbFinger1_R_translateY";
	rename -uid "70EF9EEF-4144-03C3-EC58-3E9D588854ED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKThumbFinger1_R_translateZ";
	rename -uid "58B706C3-4003-3738-AB98-71A6F1ABA29F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger1_R_scaleX";
	rename -uid "9134D4E5-42E0-CA64-F7CE-149B4186C945";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger1_R_scaleY";
	rename -uid "118B8205-459E-AAEE-7F07-EDAE175C294A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger1_R_scaleZ";
	rename -uid "AF6A43EA-440C-F41C-4B57-3799A08C273B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger1_R_rotateX";
	rename -uid "795356E7-4E2B-7F1F-BE58-9E9B2DA71132";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger1_R_rotateY";
	rename -uid "74393209-4CE2-7BC1-69D6-C28B4A12EB5E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger1_R_rotateZ";
	rename -uid "D248577E-4046-E4F4-B646-4BBF5AAF8AC4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger2_R_visibility";
	rename -uid "1D9844BD-4F81-CB98-DAA0-7DB87C5B0612";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKThumbFinger2_R_translateX";
	rename -uid "F7DFF747-4778-F60C-B37B-07BC8C3DBE5B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKThumbFinger2_R_translateY";
	rename -uid "A50C265C-40EA-C999-DE5E-968ED4B8C66C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKThumbFinger2_R_translateZ";
	rename -uid "D706DC53-48A7-3D24-F2C1-D8A82FF7C83B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger2_R_scaleX";
	rename -uid "93698B8A-4F09-4A60-1612-5E9D5E9B8E99";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger2_R_scaleY";
	rename -uid "060B0CF8-495C-25EB-C1AF-B39C0420A3F4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger2_R_scaleZ";
	rename -uid "5FC28E88-46BF-0AD8-3014-B99E8D015769";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger2_R_rotateX";
	rename -uid "331A8C7E-4E51-35B4-9938-4AB6FBA20FA1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger2_R_rotateY";
	rename -uid "77DD28FF-4267-7B2A-0F84-49814544E306";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger2_R_rotateZ";
	rename -uid "B2BD88BB-451C-0D35-6A0C-1C99761CCEF2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger3_R_visibility";
	rename -uid "822D72AE-42E9-2C9D-36AE-7FA5354B9ED9";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKThumbFinger3_R_translateX";
	rename -uid "AF8E7965-4942-C016-7EFF-9C95CA49B9A5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKThumbFinger3_R_translateY";
	rename -uid "9763F29A-4A5E-F1FB-17FE-0F9FFFEA94E2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKThumbFinger3_R_translateZ";
	rename -uid "F576A962-478E-7DA2-7E0F-9EB1A248333D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger3_R_scaleX";
	rename -uid "2158788F-4F91-448D-3D1C-C2B0089E64DB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger3_R_scaleY";
	rename -uid "C5A85178-415C-3F28-F3CB-89A21B0F9732";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger3_R_scaleZ";
	rename -uid "0DBA8FBB-4CBA-023F-6B13-50A0AFCBBCF3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger3_R_rotateX";
	rename -uid "E92668E8-4C5B-8D2C-418B-D89000735D4E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger3_R_rotateY";
	rename -uid "98DAA402-40A1-AB56-B5BB-D2B8DBCC6F30";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKThumbFinger3_R_rotateZ";
	rename -uid "6D68767E-4BF3-7E16-DA4E-E19A958F214D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger1_R_visibility";
	rename -uid "E73C1800-46E0-BD1C-CA76-9390EA387118";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKIndexFinger1_R_translateX";
	rename -uid "245E0DFF-494D-04F2-7B40-20A403EE10DF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger1_R_translateY";
	rename -uid "D55F1334-42F4-7600-218A-248909B3981A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger1_R_translateZ";
	rename -uid "B04198BF-4DF2-D708-76D8-EE889101F435";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger1_R_scaleX";
	rename -uid "4CB9B368-43EC-C457-E041-299C8D0A360D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger1_R_scaleY";
	rename -uid "F956584A-486D-FA3F-A0D1-C49CAEEA239D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger1_R_scaleZ";
	rename -uid "5BFCA2BC-40B0-F955-112E-52A01BE1FC6F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger1_R_rotateX";
	rename -uid "E8CF827C-44AF-5F27-A9AD-6798648C27CA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger1_R_rotateY";
	rename -uid "6F7FF5CA-4177-6DF4-581E-81BC783D8C8B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger1_R_rotateZ";
	rename -uid "F51D86F5-48C4-1D9D-5F74-43892DCADCDE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_R_visibility";
	rename -uid "C61A56AD-43DB-E0D1-2A0C-B5B191AB7CF6";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKIndexFinger2_R_translateX";
	rename -uid "F48DBCD3-4C69-1E0C-E9F5-F099F96CC92F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger2_R_translateY";
	rename -uid "6C3C8F0E-488F-31DB-0F99-11AED265EA10";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger2_R_translateZ";
	rename -uid "BC8F0A89-47B1-2C2D-1AB1-EDB890B12B61";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_R_scaleX";
	rename -uid "51199D71-4705-8D91-2AF2-66A290A9D5B0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_R_scaleY";
	rename -uid "2EF46D27-4181-3D98-2244-2380E1E04205";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_R_scaleZ";
	rename -uid "EEB02D9F-43CA-99D1-0360-92B5C24E402D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger2_R_rotateX";
	rename -uid "3E598060-4EE6-5A62-0BFF-5AA668424791";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger2_R_rotateY";
	rename -uid "229810C2-4861-2A01-C1BF-038F5701BE6F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 5.9625475999999997 17 5.9625475999999997
		 26 5.9625475999999997 156 5.9625475999999997 164 5.9625475999999997 173 0 180 4.9152113947521796
		 187 5.2034491000000003 193 5.2034491000000003 207 5.2034491000000003 240 5.2034491000000003
		 262 5.2034491000000003 272 5.2419458308414733 279 5.8017091116574768 287 5.937089876321207
		 300 5.9625475999999997;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 0.99791476408194446 1 1 1 1 
		1 0.99998171708040895 0.99970573228722692 0.99999526893289215 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0.064545515934705075 0 0 0 
		0 0 0.0060469417821680501 0.024257964301637524 0.0030760545886956291 0;
createNode animCurveTA -n "FKIndexFinger2_R_rotateZ";
	rename -uid "5FFC25BD-4EAE-20F0-5D7D-C78D4B7A7C64";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_R_visibility";
	rename -uid "57A0712D-4F81-7BCE-73B0-E9B0FE1DA038";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKIndexFinger3_R_translateX";
	rename -uid "579B51BC-422E-FA7F-4F33-F2859C46546B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger3_R_translateY";
	rename -uid "E2996C9D-4C3C-3198-9D89-898D9BAD6B7E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger3_R_translateZ";
	rename -uid "715A37B5-4358-2192-95B0-83881BAB84D4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_R_scaleX";
	rename -uid "EDF0385B-427F-E42D-CD6D-CDBE6646EE94";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_R_scaleY";
	rename -uid "026E23AE-4DE7-B57A-F5B5-79BEAFC14948";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_R_scaleZ";
	rename -uid "AED31518-415F-41E6-9440-5FB0E11C0F1B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger3_R_rotateX";
	rename -uid "9CF49D8C-425D-8E12-A30A-73ADEBDF9EA8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger3_R_rotateY";
	rename -uid "9D3AF681-4197-4E50-7E9E-768D5DB8A56A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 5.9625475999999997 17 5.9625475999999997
		 26 5.9625475999999997 156 5.9625475999999997 164 5.9625475999999997 173 0 180 4.9152113947521796
		 187 5.2034491000000003 193 5.2034491000000003 207 5.2034491000000003 240 5.2034491000000003
		 262 5.2034491000000003 272 5.2419458308414733 279 5.8017091116574768 287 5.937089876321207
		 300 5.9625475999999997;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 0.99791476408194446 1 1 1 1 
		1 0.99998171708040895 0.99970573228722692 0.99999526893289215 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0.064545515934705075 0 0 0 
		0 0 0.0060469417821680501 0.024257964301637524 0.0030760545886956291 0;
createNode animCurveTA -n "FKIndexFinger3_R_rotateZ";
	rename -uid "EE1D2596-4D76-432B-ADA0-AAABFC0C9BBE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_R_visibility";
	rename -uid "AC9CB145-4388-014F-3303-ACAB02F67460";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKRingFinger1_R_translateX";
	rename -uid "4A8A2A31-431E-0E50-844E-BA942A4406FE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger1_R_translateY";
	rename -uid "A7B49FE9-469C-6D8C-5BA9-7C91D169C680";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger1_R_translateZ";
	rename -uid "F7F6320A-4315-516B-8344-0898F6848610";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_R_scaleX";
	rename -uid "06233A3E-4EA8-4083-F672-78B542C09628";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_R_scaleY";
	rename -uid "51D1F151-443B-A49D-AED1-509B3ED37F99";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_R_scaleZ";
	rename -uid "BC6836AB-4F1E-0D7D-5320-4E89EFDAE1B6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger1_R_rotateX";
	rename -uid "56520AA1-422A-0B22-7970-57928E8A79C7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger1_R_rotateY";
	rename -uid "14F3AC24-40B1-2F37-3244-72A055A8A112";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger1_R_rotateZ";
	rename -uid "D2409398-4E73-569A-A3F8-499B2F29B294";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_R_visibility";
	rename -uid "05EE575F-4432-9114-11BE-019F377A852A";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKRingFinger2_R_translateX";
	rename -uid "8D489BE0-4DF8-512F-4E5F-C4B9F8E02DA2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger2_R_translateY";
	rename -uid "3D5F78A0-41FD-E9B5-7CDD-2F89BB093A6F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger2_R_translateZ";
	rename -uid "7C4523B1-4EA8-ADC7-2A8B-7DB0A0BB0E57";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_R_scaleX";
	rename -uid "C1F1B4E2-4C3B-1172-F837-51887951A1CF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_R_scaleY";
	rename -uid "804CC852-49B0-4386-B1B6-A9BC757F8767";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_R_scaleZ";
	rename -uid "AD19C0C5-448E-C873-B997-18978E3EA270";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger2_R_rotateX";
	rename -uid "7B2E3160-4C7D-48DB-1CD7-4EB65D349925";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger2_R_rotateY";
	rename -uid "8B88B66C-481D-6DFB-B284-D1B418D61390";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger2_R_rotateZ";
	rename -uid "6A6D6C5C-47C2-252F-4D11-89B6A11F3888";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_R_visibility";
	rename -uid "0887DFAC-4367-EEEA-4FB7-40B3FF523117";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKRingFinger3_R_translateX";
	rename -uid "3B45ABEF-4FA1-C084-90D2-D1AADC6D8B33";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger3_R_translateY";
	rename -uid "37196ACC-4172-6890-1A2F-E88BCD6098BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger3_R_translateZ";
	rename -uid "125236AB-4AB8-61E3-DC00-7A8DA223D1F9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_R_scaleX";
	rename -uid "D819D21D-4A66-1F3C-87ED-968B5833CCDC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_R_scaleY";
	rename -uid "B5C364AF-4C4D-A395-9293-C3AF15889A92";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_R_scaleZ";
	rename -uid "0AC07E47-4254-B99B-AD61-548850A472BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger3_R_rotateX";
	rename -uid "5B07B3C5-4D30-B2F1-21DE-CD8025B4891A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger3_R_rotateY";
	rename -uid "A403A17C-4A0B-F4DF-B6F8-52815786E216";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger3_R_rotateZ";
	rename -uid "D688C7DC-45E4-D79D-8C1B-5696DC61B6BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRoot_M_visibility";
	rename -uid "ABCC7C16-46CA-5809-610C-DD88C80B1C51";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 14 ".kit[0:13]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
createNode animCurveTL -n "FKRoot_M_translateX";
	rename -uid "1B2BB154-428D-F7C0-DC0F-3AB2ED2AF4CC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 156 0 164 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRoot_M_translateY";
	rename -uid "AE52E2AC-4DE0-AF49-0348-0794094402BC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 156 0 164 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRoot_M_translateZ";
	rename -uid "5DAB7297-4C93-0BB7-629F-7C89F59ED6E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 156 0 164 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRoot_M_scaleX";
	rename -uid "ED95EC7A-4194-3D98-8CDE-17BCA50EAD02";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRoot_M_scaleY";
	rename -uid "4DBEEDDA-4B8C-3D32-AEA3-14A8C79CE469";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRoot_M_scaleZ";
	rename -uid "2DA4C9CE-4D1B-E1CD-A4BD-09B8B641596E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 1 156 1 164 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRoot_M_rotateX";
	rename -uid "9D200E96-49AC-FD45-1B98-36A20647B0F0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 156 0 164 0 173 0 180 0 187 0 193 0
		 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRoot_M_rotateY";
	rename -uid "5A3C48ED-416F-38E0-8393-1FBE7E027B43";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 156 0 164 1.3964534820318522 173 0 180 0
		 187 0 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRoot_M_rotateZ";
	rename -uid "8921B902-42B5-6A59-3479-888A53980F86";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 5.0555149000000004 156 5.0555149000000004
		 164 5.0555149000000004 173 8.2259702851451166 180 9.1252837893751284 187 9.1474582000000009
		 193 9.1474582000000009 207 9.1474582000000009 240 19.842994846141494 262 14.872560948739487
		 272 8.9399404143125469 279 5.922519609870081 287 5.192745525328184 300 5.0555149000000004;
	setAttr -s 14 ".kit[13]"  1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1;
	setAttr -s 14 ".kix[13]"  1;
	setAttr -s 14 ".kiy[13]"  0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 0.99124742797019327 0.99998762030957111 
		1 1 1 1 0.98445662903388609 0.96404238441988077 0.99155367612231238 0.99986255289639581 
		1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0.13201718275465726 0.004975864507917099 
		0 0 0 0 -0.17562786097666189 -0.26574852970812612 -0.12969698288059128 -0.016579364146491974 
		0;
createNode animCurveTA -n "FKSpine1_M_rotateX";
	rename -uid "B8C14040-4493-B060-F5B6-F1BE34BAE3CA";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 -2.4214962752675895 156 0.26842286398364207
		 164 0 173 0 180 0 187 0 193 0 207 0 240 0.77120708855521913 262 0.66718503592906586
		 272 -2.7747985385765617 279 -2.4214962752675895 300 -2.4214962752675895;
	setAttr -s 13 ".kit[0:12]"  18 9 9 9 9 9 18 9 
		9 9 9 9 1;
	setAttr -s 13 ".kot[0:12]"  1 9 9 9 9 9 18 9 
		9 9 9 9 1;
	setAttr -s 13 ".kix[12]"  1;
	setAttr -s 13 ".kiy[12]"  0;
	setAttr -s 13 ".kox[0:12]"  1 0.99997011675908642 0.99996582676008772 
		1 1 1 1 0.99996309463403021 0.99997982928356743 0.99832099770984617 0.99550551422530908 
		0.99997817622837215 1;
	setAttr -s 13 ".koy[0:12]"  0 0.0077308207079839876 -0.0082671223538969361 
		0 0 0 0 0.0085912379744579812 0.0063514585732181057 -0.057923963362475343 -0.094703596272808485 
		0.0066065926905362997 0;
createNode animCurveTA -n "FKSpine1_M_rotateY";
	rename -uid "F197AFAF-4A47-BADE-9B02-B08D41A1966C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 -5.3173436163443544 156 -3.6892890980188833
		 164 -0.62386446250030303 173 0.056714951136391363 180 0 187 0 193 0.024105796065559761
		 207 0 240 -3.0521619581723023 262 -4.2489138218335274 272 -5.1421903346739937 279 -5.3173436163443544
		 300 -5.3173436163443544;
	setAttr -s 13 ".kit[0:12]"  18 9 9 1 9 9 18 9 
		9 9 9 9 1;
	setAttr -s 13 ".kot[0:12]"  1 9 9 1 9 9 18 9 
		9 9 9 9 1;
	setAttr -s 13 ".kix[3:12]"  0.9999879083670945 0.99999775040241767 
		0.999999528672051 1 0.99941327114253553 0.99918291887032651 0.99941576048142511 0.99945898558558655 
		0.99999463605582517 1;
	setAttr -s 13 ".kiy[3:12]"  0.0049176335369241946 -0.0021211294406681658 
		0.00097090456582758626 0 -0.034250743994501336 -0.040416514418915757 -0.034178029512173649 
		-0.032889757254049724 -0.003275341139181054 0;
	setAttr -s 13 ".kox[0:12]"  1 0.99988774745177178 0.99340983631468027 
		0.99998790837455387 0.99999775040241767 0.999999528672051 1 0.99941327114253553 0.99918291887032651 
		0.99941576048142511 0.99945898558558655 0.99999463605582517 1;
	setAttr -s 13 ".koy[0:12]"  0 0.014983073644015523 0.11461630387183239 
		0.0049176320200738487 -0.0021211294406681658 0.00097090456582758626 0 -0.034250743994501336 
		-0.040416514418915757 -0.034178029512173649 -0.032889757254049724 -0.003275341139181054 
		0;
createNode animCurveTA -n "FKSpine1_M_rotateZ";
	rename -uid "3428912D-4E36-6491-2537-1898BE5DCCAD";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  0 10.814369244937701 156 16.521720802672483
		 164 20.685974 173 21.228128112464315 180 19.405067256054526 187 17.121213652328002
		 193 16.996800778925845 207 17.580354748700493 240 5.9404666940675188 262 11.735751455314432
		 272 14.688954762202039 279 10.814369244937701 300 10.814369244937701;
	setAttr -s 13 ".kit[0:12]"  18 9 9 9 9 9 18 9 
		9 9 9 9 1;
	setAttr -s 13 ".kot[0:12]"  1 9 9 9 9 9 18 9 
		9 9 9 9 1;
	setAttr -s 13 ".kix[12]"  1;
	setAttr -s 13 ".kiy[12]"  0;
	setAttr -s 13 ".kox[0:12]"  1 0.99950371439884167 0.98965645871392249 
		0.9991226145060349 0.98840849526538166 0.9953286950226552 1 0.99249956844607923 0.99845565264984715 
		0.98990931080047528 0.99959757325793153 0.99738545655567812 1;
	setAttr -s 13 ".koy[0:12]"  0 0.031501188912782051 0.14345763739103651 
		-0.041880797301690954 -0.15181780688451593 -0.096544232683772505 0 -0.12224813550458116 
		-0.055554564993060204 0.14170235139378554 -0.028367085448711301 -0.072265144096041262 
		0;
createNode animCurveTA -n "FKSpine2_M_rotateX";
	rename -uid "343A76AC-4C96-2DB2-221A-8E814292B025";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 156 0 164 0 173 -0.0082161441291109163
		 180 -0.0075510603965015946 187 0 193 0 207 0 240 0 262 0 272 0 279 -0.060017175346535397
		 287 0 300 0;
	setAttr -s 14 ".kit[12:13]"  1 1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[12:13]"  1 1;
	setAttr -s 14 ".kiy[12:13]"  0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 0.99999998886304875 1 1 1 1 1 1 
		1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0.00014924443893698079 0 0 0 0 
		0 0 0 0 0;
createNode animCurveTA -n "FKSpine2_M_rotateY";
	rename -uid "F49D9C14-411D-D882-8B3B-629A2A47BC5C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 156 0 164 -1.6166615154713466 173 -0.17254290298090888
		 287 0 300 0;
	setAttr -s 6 ".kit[2:5]"  9 18 1 1;
	setAttr -s 6 ".kot[0:5]"  1 18 9 18 1 1;
	setAttr -s 6 ".kix[4:5]"  1 1;
	setAttr -s 6 ".kiy[4:5]"  0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 0.99998587935910221 0.99999717386817333 
		1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 -0.0053142339431970905 0.0023774473004483702 
		0 0;
createNode animCurveTA -n "FKSpine2_M_rotateZ";
	rename -uid "7D402B46-47A4-CE1D-978B-BBA3EB7A9369";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 5.443272890110407 156 1.0221777999999999
		 164 0.72237201868766687 173 -1.9530119151713825 180 0.97337114125878821 187 1.0221777999999999
		 193 1.0221777999999999 207 1.0221777999999999 240 1.0221777999999999 262 1.0221777999999999
		 272 1.0221777999999999 279 4.9426265286598179 287 5.443272890110407 300 5.443272890110407;
	setAttr -s 14 ".kit[12:13]"  1 1;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 14 ".kix[12:13]"  1 1;
	setAttr -s 14 ".kiy[12:13]"  0 0;
	setAttr -s 14 ".kox[0:13]"  1 0.99988643216995965 0.99827184432420046 
		1 0.99994003017732036 1 1 1 1 1 1 0.99520312661492716 1 1;
	setAttr -s 14 ".koy[0:13]"  0 -0.015070592636940248 -0.058764996635407941 
		0 0.010951531809737843 0 0 0 0 0 0 0.097830142470883438 0 0;
createNode animCurveTU -n "FKChest_M_visibility";
	rename -uid "EA844B9F-4C56-89E0-A29B-83A7DCFDC634";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kot[1:2]"  5 9;
createNode animCurveTL -n "FKChest_M_translateX";
	rename -uid "187812FF-409A-B0A0-0430-32A66222A58D";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTL -n "FKChest_M_translateY";
	rename -uid "1301DEE4-467C-E58D-9682-F2B3165C2E0E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTL -n "FKChest_M_translateZ";
	rename -uid "770DE29E-4271-D7DD-26A7-68878C9FA794";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTU -n "FKChest_M_scaleX";
	rename -uid "0AB6705F-4F93-C631-CFC5-8E965714C368";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTU -n "FKChest_M_scaleY";
	rename -uid "EA159219-4975-0BAC-915D-2BA9EDF34F68";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTU -n "FKChest_M_scaleZ";
	rename -uid "AFCCAF31-4B5A-8E12-B3B9-0089F1C1B569";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 193 1 300 1;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTA -n "FKChest_M_rotateX";
	rename -uid "BC06E1E0-42B0-42E6-D29B-A19DB022071D";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTA -n "FKChest_M_rotateY";
	rename -uid "E44B0EE5-444D-242D-ABB9-D69AA0A33292";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 193 0 300 0;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTA -n "FKChest_M_rotateZ";
	rename -uid "A823AAFC-435C-B1C7-201D-F9ACCAA0F143";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 5.1585759293172062 193 5.1585759293172062
		 300 5.1585759293172062;
	setAttr -s 3 ".kit[1:2]"  18 9;
	setAttr -s 3 ".kot[1:2]"  18 9;
createNode animCurveTU -n "HipSwinger_M_visibility";
	rename -uid "5914D964-4DFE-30AD-5BDC-5B8D4FCE6D98";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTA -n "HipSwinger_M_rotateX";
	rename -uid "6CC992FC-48FA-6AA6-9108-D8B977BBFF52";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "HipSwinger_M_rotateY";
	rename -uid "F46563BD-4773-F698-9172-C989B9E5B74E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "HipSwinger_M_rotateZ";
	rename -uid "1D1E7857-44FC-6940-C556-B39A40B6677F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_L_visibility";
	rename -uid "8A7C5C84-4874-43EF-78B0-3FA82C7B6921";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 9 1 17 1 26 1 156 1 164 1 173 1 180 1
		 187 1 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 1 9 9 9 9 9 
		9 9 9 9 9 9 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger1_L_translateX";
	rename -uid "B24C8F3C-4707-E300-63A0-69BF9DC98C99";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 9 0 17 0 26 0 156 0 164 0 173 0 180 0
		 187 0 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger1_L_translateY";
	rename -uid "43BBF14B-44BA-F9AB-9031-ACB6689D19EE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 9 0 17 0 26 0 156 0 164 0 173 0 180 0
		 187 0 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger1_L_translateZ";
	rename -uid "C7F51C6F-4878-CD39-2BE1-629AC1DEB53E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 9 0 17 0 26 0 156 0 164 0 173 0 180 0
		 187 0 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_L_scaleX";
	rename -uid "C6AA53CD-40D1-4663-2BB9-3F8ED005AB81";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 9 1 17 1 26 1 156 1 164 1 173 1 180 1
		 187 1 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_L_scaleY";
	rename -uid "F3648443-4C4B-39BA-44B9-4DBA699AD754";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 9 1 17 1 26 1 156 1 164 1 173 1 180 1
		 187 1 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger1_L_scaleZ";
	rename -uid "14E9FB50-428F-170D-FF3F-959DB0D44076";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 9 1 17 1 26 1 156 1 164 1 173 1 180 1
		 187 1 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateX";
	rename -uid "130DFB52-49C0-D8D0-F1E7-9DA167327E19";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0.46687362999999993 9 0.46687362999999993
		 17 -0.0093075533000000002 26 -0.0093075533000000002 156 -0.0093075533000000002 164 -0.0093075533000000002
		 173 -0.0093075533000000002 180 -0.0093075533000000002 187 -0.0093075533000000002
		 193 -0.0093052678943839843 207 -0.0086799237827012085 240 -0.0016013112604144797
		 262 -5.1045121793511403e-05 279 0.028362573022500257 287 0.028362573022500257 300 0.46687362999999993;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 0.99999999999982103 0.99999999753854552 
		0.99999999662595718 0.99999999387400107 1 0.99999655362326634 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 5.9831779114535213e-07 7.0163445085447514e-05 
		8.2146732479879969e-05 0.00011068874278102669 0 0.0026254031290175854 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 0.99999999999982103 0.99999999753854529 
		0.99999999662595718 0.99999999387400107 1 0.99999655362326634 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 5.9831779114535224e-07 
		7.0163445085447487e-05 8.2146732479879969e-05 0.00011068874278102669 0 0.0026254031290175858 
		0;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateY";
	rename -uid "9168F9A5-41C9-1F14-EBB4-7ABB30E560AF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 15.632088250472771 9 15.632088250472771
		 17 12.29596415047277 26 12.29596415047277 156 12.29596415047277 164 12.29596415047277
		 173 12.29596415047277 180 12.29596415047277 187 12.29596415047277 193 12.148490674084568
		 207 9.9816839531521513 240 16.762269698821353 262 14.373094626297199 279 6.6673864755477803
		 287 6.6673864755477803 300 15.632088250472771;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 0.99925552537264595 1 1 0.99094043258871201 
		1 1 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 -0.038579722811828282 0 0 
		-0.13430211860166719 0 0 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 0.99925552537264595 1 
		1 0.99094043258871212 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 -0.038579722811828282 
		0 0 -0.13430211860166721 0 0 0;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateZ";
	rename -uid "7CF12B04-49EC-B134-BB69-98B7C04BDE60";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0.49108159000000001 9 0.49108159000000001
		 17 1.018241 26 1.018241 156 1.018241 164 1.018241 173 1.018241 180 1.018241 187 1.018241
		 193 1.017990977934603 207 0.94957869029033237 240 0.17518253471787257 262 0.0055843070874647925
		 279 0.029833206592500269 287 0.029833206592500269 300 0.49108159000000001;
	setAttr -s 16 ".kit[2:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1 1;
	setAttr -s 16 ".kot[0:15]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1 1;
	setAttr -s 16 ".kix[2:15]"  1 1 1 1 1 1 1 0.99999999785778071 0.99997054203629665 
		0.99995962110914938 1 1 0.99999748988078763 1;
	setAttr -s 16 ".kiy[2:15]"  0 0 0 0 0 0 0 -6.5455623516946207e-05 -0.0076756146095951572 
		-0.0089864426357918765 0 0 0.0022405874506282947 0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 0.99999999785778071 0.99997054203629654 
		0.99995962110914949 1 1 0.99999748988078763 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 -6.5455623516946207e-05 
		-0.0076756146095951555 -0.0089864426357918782 0 0 0.0022405874506282951 0;
createNode animCurveTU -n "FKMiddleFinger2_L_visibility";
	rename -uid "EE3EEB07-4AC9-8F85-27A5-CBBE6D3DEB23";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKMiddleFinger2_L_translateX";
	rename -uid "8C633B1E-4801-4FAE-0185-DD9C46A4A6F9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger2_L_translateY";
	rename -uid "EA0F3F97-4E5A-E687-BEAB-C8AB381FD172";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger2_L_translateZ";
	rename -uid "CFD90D77-4793-D3A7-FDD1-829621E69E90";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger2_L_scaleX";
	rename -uid "0EBFD376-4A4F-DABA-818B-5DAA479BC9BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger2_L_scaleY";
	rename -uid "D3931937-49A2-922A-CE39-B99F5914F03B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger2_L_scaleZ";
	rename -uid "AB11797F-4E46-EA02-6DE6-67B2E685DB37";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateX";
	rename -uid "EB75E454-4962-1A15-0BEA-028F89645BAE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateY";
	rename -uid "C8A02BD0-4BD5-3C91-64A4-5BA2AC0D9F58";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateZ";
	rename -uid "67A08743-41E0-9C5F-3090-A4A526FA58D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_L_visibility";
	rename -uid "2B99E2B4-4F7B-632B-B85B-1BB7757D17B2";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKMiddleFinger3_L_translateX";
	rename -uid "3D8E00E4-4AB6-34F0-F8FF-3585E5344FA7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger3_L_translateY";
	rename -uid "D0F46BB5-4159-CED8-00DA-7DB07F98B232";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKMiddleFinger3_L_translateZ";
	rename -uid "24C5B38A-4D55-6854-2B76-B589F8AECCA1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_L_scaleX";
	rename -uid "0AC29196-47DE-FA3B-C827-F38FB410088C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_L_scaleY";
	rename -uid "50221723-40F8-78B1-04F8-AFB880E9271B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKMiddleFinger3_L_scaleZ";
	rename -uid "F5D71214-4F33-F0BD-A401-FCB2C8029F58";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateX";
	rename -uid "0468E289-4173-4486-88A4-0C84C5E71508";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateY";
	rename -uid "60B8CAE4-4EAD-EE3C-C429-E68508098725";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateZ";
	rename -uid "856DF15F-4B5F-D8A7-8281-F6B1D9E4655C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKThumbFinger1_L_visibility";
	rename -uid "A064CC96-4A03-5E30-1089-BBB4E3FC2750";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
createNode animCurveTL -n "FKThumbFinger1_L_translateX";
	rename -uid "A1B5E034-4AE8-E435-73A1-EA9E9098C7B9";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTL -n "FKThumbFinger1_L_translateY";
	rename -uid "20B7E8A7-4218-2693-81AD-1D88563F27AF";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTL -n "FKThumbFinger1_L_translateZ";
	rename -uid "B0DE2976-42A6-9E1D-3FE3-4DA5EA432410";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKThumbFinger1_L_scaleX";
	rename -uid "DD15142E-435D-744C-F4E8-2190E011B949";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKThumbFinger1_L_scaleY";
	rename -uid "73D75C45-4098-50B8-EB60-14812F517EA3";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKThumbFinger1_L_scaleZ";
	rename -uid "78E9F3C5-4CA7-32A6-139F-D6A6DFB83938";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTA -n "FKThumbFinger1_L_rotateX";
	rename -uid "F329CE6C-4C28-E90F-2E57-1BBD15715D48";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTA -n "FKThumbFinger1_L_rotateY";
	rename -uid "E80F7BEE-41B4-B797-837E-F6B30E70F4B7";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 23.658364982268861 300 23.658364982268861;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTA -n "FKThumbFinger1_L_rotateZ";
	rename -uid "E6D50BB3-41F7-BC2E-05F3-70845854A1EF";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 10 300 10;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKThumbFinger2_L_visibility";
	rename -uid "8A86AF0F-4215-6D57-12A2-27A37A6A9BA2";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
createNode animCurveTL -n "FKThumbFinger2_L_translateX";
	rename -uid "55BC10A4-456A-4029-7BE9-C3B0AE761EB9";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTL -n "FKThumbFinger2_L_translateY";
	rename -uid "FC1F054B-4B1B-9C23-2967-5D8570AC8AC5";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTL -n "FKThumbFinger2_L_translateZ";
	rename -uid "FDB8A3DD-4FFF-B40D-FFFE-FB80F3CDCD6A";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "FKThumbFinger2_L_scaleX";
	rename -uid "930A46A8-4CC7-8923-C940-F4A918F8AD90";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "FKThumbFinger2_L_scaleY";
	rename -uid "61288868-4F1A-65FA-4781-98AB7941001B";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "FKThumbFinger2_L_scaleZ";
	rename -uid "622AA9D3-4F2B-B55E-8B65-EFBDA8CFB79F";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTA -n "FKThumbFinger2_L_rotateX";
	rename -uid "D9A53638-425C-8BF5-36DC-9895012D170C";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTA -n "FKThumbFinger2_L_rotateY";
	rename -uid "00AEC8BE-4237-1172-6A5D-6893400E8B01";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 9.9307032797564698;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTA -n "FKThumbFinger2_L_rotateZ";
	rename -uid "C8EDBA2A-44D8-B933-7211-5DA6DFF6F3B6";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
	setAttr ".kix[0]"  1;
	setAttr ".kiy[0]"  0;
	setAttr ".kox[0]"  1;
	setAttr ".koy[0]"  0;
createNode animCurveTU -n "FKThumbFinger3_L_visibility";
	rename -uid "B83C1D65-4257-3F10-F342-A4923CCD0713";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
createNode animCurveTL -n "FKThumbFinger3_L_translateX";
	rename -uid "E504319E-43B2-5BAF-A571-68859AC40D5E";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTL -n "FKThumbFinger3_L_translateY";
	rename -uid "A5458803-4A8B-AB2B-64C3-338B94E2EE39";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTL -n "FKThumbFinger3_L_translateZ";
	rename -uid "B8C155FA-47A0-07F2-B69D-9397AA2410EF";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKThumbFinger3_L_scaleX";
	rename -uid "F7C1271A-42A0-0288-8F12-5493F03DB09B";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKThumbFinger3_L_scaleY";
	rename -uid "D623400F-4F33-38FE-2D3F-D99B3D484489";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKThumbFinger3_L_scaleZ";
	rename -uid "DF106B6C-44D7-AD18-026D-6B8C20C73875";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 300 1;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTA -n "FKThumbFinger3_L_rotateX";
	rename -uid "61DF7A1C-4A63-B538-6606-739D868019D3";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTA -n "FKThumbFinger3_L_rotateY";
	rename -uid "63F6761F-488D-F007-AB43-D6B6BFAD2228";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 29.999999999999996 300 29.999999999999996;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTA -n "FKThumbFinger3_L_rotateZ";
	rename -uid "A9A05DC1-4956-AF63-1BDE-05BCD2DE178A";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 300 0;
	setAttr -s 2 ".kix[0:1]"  1 1;
	setAttr -s 2 ".kiy[0:1]"  0 0;
	setAttr -s 2 ".kox[0:1]"  1 1;
	setAttr -s 2 ".koy[0:1]"  0 0;
createNode animCurveTU -n "FKIndexFinger1_L_visibility";
	rename -uid "E71B9B08-452F-DC7E-DDD0-6195A6AB8EB0";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[0:14]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
createNode animCurveTL -n "FKIndexFinger1_L_translateX";
	rename -uid "97CD9642-4A33-A3B1-362D-D78F8D3663AF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger1_L_translateY";
	rename -uid "6C5E57A1-419A-88E1-0275-27A631EA09BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger1_L_translateZ";
	rename -uid "C9C27127-4981-0FA7-DF19-FDB47F9F4FFD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger1_L_scaleX";
	rename -uid "14688A7B-424E-5B52-89B1-1CABE81925CE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger1_L_scaleY";
	rename -uid "3BB0F188-4534-45FC-6469-1A9F37EE3931";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger1_L_scaleZ";
	rename -uid "F9F168FA-4469-8FB6-3099-B1819616E2C0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger1_L_rotateX";
	rename -uid "3C470138-443F-585B-C776-888050400A94";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger1_L_rotateY";
	rename -uid "7C8C8C97-4FB1-8465-2FCE-44A771FBFE60";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 2.4038351410543459
		 193 2.7680487664431199 207 3.823458643547756 240 0.96982538493320569 262 0.030915198135521307
		 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 0.99548486731268493 0.99931007165177488 
		1 0.99934885358485992 0.99999592006422822 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0.094920382170774892 0.037140014745884922 
		0 -0.036081419576095793 -0.0028565459732761839 0 0 0;
createNode animCurveTA -n "FKIndexFinger1_L_rotateZ";
	rename -uid "A1A54C42-4676-4F3C-3BEA-8CAE131F35AA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_L_visibility";
	rename -uid "B670E5ED-418E-0948-619C-65959EB7DFCE";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKIndexFinger2_L_translateX";
	rename -uid "4ABA5B65-4DAD-0C48-6FD0-AEA8CD625071";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger2_L_translateY";
	rename -uid "26B82959-4AE1-DF07-37D6-8A9C81E9C869";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger2_L_translateZ";
	rename -uid "37D70DF7-40A8-33A3-02A4-50BF27957F11";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_L_scaleX";
	rename -uid "AC52099A-4AB6-69E3-11C9-1D84523F1267";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_L_scaleY";
	rename -uid "7E2A9792-4FA8-81EC-8B91-A58707AD67BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger2_L_scaleZ";
	rename -uid "FC7FE77C-470B-7CD5-4EB0-A2914B0FDC2B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger2_L_rotateX";
	rename -uid "50C6EE62-431F-262D-7C11-0AB53799A7D5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger2_L_rotateY";
	rename -uid "D674D83E-4A0B-889A-684D-58B789876421";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger2_L_rotateZ";
	rename -uid "7459FD63-4582-C30E-3850-7A8CB09EEB9A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_L_visibility";
	rename -uid "1518AF4D-452A-EE30-A3DA-A4961397927C";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKIndexFinger3_L_translateX";
	rename -uid "53130C51-4A7B-5D95-2F34-3FAC2654E6D9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger3_L_translateY";
	rename -uid "9312C563-4E4E-B540-1448-BDA1CD11A643";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKIndexFinger3_L_translateZ";
	rename -uid "95744402-45CE-93EA-C79C-C2A8A40A7DCF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_L_scaleX";
	rename -uid "C2DCDE88-40F2-9DD1-DEBC-458700897960";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_L_scaleY";
	rename -uid "C7EC471F-474E-A449-EB0E-60B3AC94A41C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIndexFinger3_L_scaleZ";
	rename -uid "3F296E5A-46D9-5DE6-D791-EC928F1B7305";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger3_L_rotateX";
	rename -uid "4C7F378A-4A6B-4AC9-B730-5B827A99F523";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger3_L_rotateY";
	rename -uid "9DCC5500-4D55-F45E-0D34-438B90EB09D5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKIndexFinger3_L_rotateZ";
	rename -uid "DC2CBA0F-4233-F17A-1481-76B3B96156DF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_L_visibility";
	rename -uid "E4C14E76-4C1A-7446-732C-F2A8775A6C0A";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[0:14]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
createNode animCurveTL -n "FKRingFinger1_L_translateX";
	rename -uid "01CD6C83-46EF-E06D-24A8-88A6570E46FA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger1_L_translateY";
	rename -uid "90DB88EF-4BCC-D41F-6CF6-309430E95D7D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger1_L_translateZ";
	rename -uid "6286F212-46AF-7094-678F-1DAAD75FACB7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_L_scaleX";
	rename -uid "1118A030-4CDA-E71E-14D4-1B892D2E54C1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_L_scaleY";
	rename -uid "7312AAA0-4527-8AC4-680B-949C97B9AAEA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger1_L_scaleZ";
	rename -uid "42A496F0-4FFA-172C-E508-EEB2CA5A4905";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger1_L_rotateX";
	rename -uid "B7DF83C7-494D-2C80-D9EA-52A5913280FC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger1_L_rotateY";
	rename -uid "1EA31FD6-47F8-BC69-13B0-86A34F449CEF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 24.740980083316082 17 24.854345745308809
		 26 24.875991305176932 156 24.875991305176932 164 24.875991305176932 173 24.875991305176932
		 180 24.875991305176932 187 24.875991305176932 193 24.429172935068475 207 17.864134454260533
		 240 27.493189462778631 262 27.401448137555946 279 14.744809089479592 287 14.744809089479592
		 300 24.740980083316082;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[13:14]"  1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[13:14]"  1 0.99997940671338281;
	setAttr -s 15 ".koy[13:14]"  0 0.006417643582414246;
createNode animCurveTA -n "FKRingFinger1_L_rotateZ";
	rename -uid "840CD174-4D4C-464D-8127-F88EFCDD7E14";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 279 0 287 0 300 0;
	setAttr -s 15 ".kit[13:14]"  1 1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 1 1;
	setAttr -s 15 ".kix[13:14]"  1 1;
	setAttr -s 15 ".kiy[13:14]"  0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_L_visibility";
	rename -uid "199C0D83-4B87-0ABA-867E-5C80EFD26F98";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKRingFinger2_L_translateX";
	rename -uid "86ED4466-44E5-965E-EDC0-3FB95FA1AC10";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger2_L_translateY";
	rename -uid "CF18E9B1-4882-9A0C-8B9C-FA9EE1310685";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger2_L_translateZ";
	rename -uid "662A2ADA-4492-2A9E-69F2-7CAF00A2B845";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_L_scaleX";
	rename -uid "14FC92B7-45C1-F0A6-8C6F-D9B1B4AE09AA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_L_scaleY";
	rename -uid "322F6ACD-419E-79EE-2241-52B6E16AAF7F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger2_L_scaleZ";
	rename -uid "974DD648-4AC8-7EA0-9036-A2980EFA917D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger2_L_rotateX";
	rename -uid "8114E9BA-412A-7995-96AE-4B965AECF493";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger2_L_rotateY";
	rename -uid "9277CC5C-4272-C371-E4E3-B28D887523D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger2_L_rotateZ";
	rename -uid "AF704D89-4142-EF45-25D4-348810FAC36F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_L_visibility";
	rename -uid "7693C3C6-493B-16FC-B487-4296EE4CFA65";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "FKRingFinger3_L_translateX";
	rename -uid "29B59E05-48F7-4235-862F-289559B1066F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger3_L_translateY";
	rename -uid "F3EE5FCD-4CEE-107C-DE52-95A24C8CA59C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "FKRingFinger3_L_translateZ";
	rename -uid "58847AB3-44F4-310C-0F08-8284DA4C1F70";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_L_scaleX";
	rename -uid "534E7562-4FDA-44F7-DC7A-2083E7DF766D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_L_scaleY";
	rename -uid "4D679CC6-49DB-7F5B-8D42-4A8B0F6223AA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKRingFinger3_L_scaleZ";
	rename -uid "5E6A57F9-4A34-C30A-24E5-D69848A5AF7B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger3_L_rotateX";
	rename -uid "C2D47E06-4561-C353-38C8-4FBF2BD34010";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger3_L_rotateY";
	rename -uid "2E36A45F-4A1A-9F2D-8C95-14A2C3D0D836";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "FKRingFinger3_L_rotateZ";
	rename -uid "8CA77365-4994-0C8D-1174-EE9A749E61CC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "IKArm_R_translateX";
	rename -uid "38C2673D-4750-651A-70C6-B9A8C78E99EF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 37.668885144658859 17 37.668885144658859
		 26 37.668885144658859 156 37.668885144658859 164 44.503591747155134 173 51.914427139408978
		 193 45.60411147803466 221 47.36533723510361 249 48.801099440615353 256 45.481544581487796
		 264 40.39816629683969 274 37.668885144658859 282 37.668885144658859 291 37.668885144658859
		 300 37.668885144658859;
	setAttr -s 15 ".kit[0:14]"  18 9 9 9 9 9 18 18 
		9 9 9 1 1 1 1;
	setAttr -s 15 ".kot[0:14]"  1 9 9 9 9 9 18 18 
		9 9 9 1 1 1 1;
	setAttr -s 15 ".kix[11:14]"  0.9848693225533024 1 1 1;
	setAttr -s 15 ".kiy[11:14]"  -0.1732986367326628 0 0 0;
	setAttr -s 15 ".kox[0:14]"  0.99624638258377962 1 1 0.55835270334085252 
		0.039747092182673908 0.659938651492047 1 0.5042250946769824 0.5265207771573972 0.059397972389765345 
		0.076572951083364468 0.9848693225533024 1 0.9978754758511803 0.9978754758511803;
	setAttr -s 15 ".koy[0:14]"  0.086562955060079549 0 0 0.82960367566203685 
		0.99920977210144513 0.7513194901417497 0 0.86357226327504766 -0.85016226170159448 
		-0.99823438173406176 -0.99706398147881392 -0.1732986367326628 0 0.065150093589962474 
		0.065150093589962474;
createNode animCurveTL -n "IKArm_R_translateY";
	rename -uid "599EFD07-40F7-84F6-CA24-F7B67ACC8997";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 -89.068113639931738 17 -89.068113639931738
		 26 -89.068113639931738 156 -89.068113639931738 164 -87.038502524149749 173 -72.066938483963625
		 193 -66.820806805603596 207 -64.914743370377508 221 -62.157348428086905 249 -63.240645694019314
		 256 -67.300786209174632 264 -80.910761655783119 274 -89.068113639931738 282 -89.068113639931738
		 291 -89.068113639931738 300 -89.068113639931738;
	setAttr -s 16 ".kit[0:15]"  18 9 9 9 18 1 18 9 
		18 1 9 9 1 1 1 1;
	setAttr -s 16 ".kot[0:15]"  18 9 9 9 18 1 18 9 
		18 1 9 9 1 1 1 1;
	setAttr -s 16 ".kix[5:15]"  0.039709196431745704 0.15650679478495969 
		0.19624586147166179 1 0.17093161512954713 0.028285040696922545 0.027553781941839498 
		0.22401555188168332 1 1 1;
	setAttr -s 16 ".kiy[5:15]"  0.99921127881882166 0.98767688197412951 
		0.98055472149964451 0 -0.98528289488309118 -0.99959989819565975 -0.9996203224728385 
		-0.97458556962184939 0 0 0;
	setAttr -s 16 ".kox[5:15]"  0.039709191477587925 0.15650679478495969 
		0.19624586147166179 1 0.17093168410629334 0.028285040696922545 0.027553781941839498 
		0.22401555188168332 1 0.56086587344566041 0.56086587344566041;
	setAttr -s 16 ".koy[5:15]"  0.99921127901570261 0.98767688197412951 
		0.98055472149964451 0 -0.98528288291667099 -0.99959989819565975 -0.9996203224728385 
		-0.97458556962184939 0 -0.82790668073402829 -0.82790668073402829;
createNode animCurveTL -n "IKArm_R_translateZ";
	rename -uid "C99DE800-4353-E175-A8DD-D1AC114BF91A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 19.30737934212743 17 19.30737934212743
		 26 19.30737934212743 156 19.30737934212743 164 19.63008764264924 173 24.209032265914804
		 193 18.132545145457289 221 15.31142652594839 249 13.231533859937903 256 15.205745179837304
		 264 20.635128280125294 274 19.30737934212743 282 19.30737934212743 291 19.30737934212743
		 300 19.30737934212743;
	setAttr -s 15 ".kit[3:14]"  9 9 9 9 18 9 18 18 
		1 1 1 1;
	setAttr -s 15 ".kot[3:14]"  9 9 9 9 18 9 18 18 
		1 1 1 1;
	setAttr -s 15 ".kix[11:14]"  0.90660214688608465 1 1 1;
	setAttr -s 15 ".kiy[11:14]"  0.42198643018649579 0 0 0;
	setAttr -s 15 ".kox[11:14]"  0.90660214688608465 1 0.7633428978740513 
		0.7633428978740513;
	setAttr -s 15 ".koy[11:14]"  0.42198643018649579 0 0.64599351410462746 
		0.64599351410462746;
createNode animCurveTA -n "IKArm_R_rotateX";
	rename -uid "C20B06B4-48F5-FB15-C901-38B5458CF8B2";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 -72.824399668628402 17 -72.824399668628402
		 26 -72.824399668628402 156 -72.824399668628402 164 -76.685290554433649 173 -42.865992645716311
		 180 -11.485897095250365 193 -1.3266949042709697 207 0.82813020960959272 249 -4.4056341508567733
		 256 -25.519377029562193 264 -62.944597393641935 274 -72.319435028375878 282 -72.824399668628402
		 291 -72.824399668628402 300 -72.824399668628402;
	setAttr -s 16 ".kit[0:15]"  18 1 1 9 9 9 9 18 
		9 9 9 9 1 1 1 1;
	setAttr -s 16 ".kot[0:15]"  1 1 1 9 9 9 9 18 
		9 9 9 9 1 1 1 1;
	setAttr -s 16 ".kix[1:15]"  1 1 0.99989272111725958 0.73493534937012273 
		0.42438301838732562 0.67687447175520055 0.97265146470607433 0.99958588248871938 0.96257782973008277 
		0.43956726179651506 0.59200655022483484 0.99859110126226269 1 1 1;
	setAttr -s 16 ".kiy[1:15]"  0 0 -0.014647397609206197 0.67813717804454277 
		0.90548277383087916 0.73609846453183037 0.23226951630622605 -0.028776093015700291 
		-0.27100539055916134 -0.89820967616515579 -0.80593315137850607 0.053064229758109378 
		0 0 0;
	setAttr -s 16 ".kox[0:15]"  0.99993228780228849 0.99990249879336512 
		0.99990249879336512 0.99989272111725958 0.73493534937012273 0.42438301838732562 0.67687447175520055 
		0.97265146470607433 0.99958588248871938 0.96257782973008277 0.43956726179651506 0.59200655022483484 
		0.99859110126226269 1 0.99996176748464549 0.99996176748464549;
	setAttr -s 16 ".koy[0:15]"  -0.011637001782303893 -0.013963986063595848 
		-0.013963986063595848 -0.014647397609206197 0.67813717804454277 0.90548277383087916 
		0.73609846453183037 0.23226951630622605 -0.028776093015700291 -0.27100539055916134 
		-0.89820967616515579 -0.80593315137850607 0.053064229758109378 0 -0.0087443449716801767 
		-0.0087443449716801767;
createNode animCurveTA -n "IKArm_R_rotateY";
	rename -uid "EEA60942-479B-E171-6363-97828093DAE8";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 66.239307310150139 17 66.239307310150139
		 26 66.239307310150139 156 66.239307310150139 164 59.957605617442795 173 68.904853482935309
		 193 74.127944307359968 207 68.007907351462578 249 54.641608 256 59.734157476312035
		 264 61.187249656307429 274 66.885270317940808 282 66.239307310150139 291 66.239307310150139
		 300 66.239307310150139;
	setAttr -s 15 ".kit[0:14]"  18 1 1 9 9 1 18 9 
		1 9 9 1 1 1 1;
	setAttr -s 15 ".kot[3:14]"  9 9 1 18 9 1 9 9 
		1 1 1 1;
	setAttr -s 15 ".kix[1:14]"  1 1 0.99971609129232686 0.99664684862133557 
		0.87459527262509196 1 0.98380428326521585 0.99951784621037809 0.97487659477473776 
		0.97904212643509492 0.99523499308980479 1 1 1;
	setAttr -s 15 ".kiy[1:14]"  0 0 -0.02382722835732376 0.081823341004634662 
		0.48485369865748285 0 -0.17924601035731585 0.031049558885225936 0.22274565082266298 
		0.20365783723060474 0.09750542820549131 0 0 0;
	setAttr -s 15 ".kox[0:14]"  0.99998640344406231 0.99998042113531593 
		0.99998042113531593 0.99971609129232686 0.99664684862133557 0.87459531153449244 1 
		0.98380428326521585 0.99951784587631543 0.97487659477473776 0.97904212643509492 0.99523499308980479 
		1 0.99999232321236886 0.99999232321236886;
	setAttr -s 15 ".koy[0:14]"  -0.0052146837880272783 -0.006257583082635818 
		-0.006257583082635818 -0.02382722835732376 0.081823341004634662 0.48485362847140184 
		0 -0.17924601035731585 0.031049569639049843 0.22274565082266298 0.20365783723060474 
		0.09750542820549131 0 -0.0039183563300657061 -0.0039183563300657061;
createNode animCurveTA -n "IKArm_R_rotateZ";
	rename -uid "08FB4B95-4B3E-97EC-9AE9-D58E4EF0CA83";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 111.36653904509555 17 111.36653904509555
		 26 111.36653904509555 156 111.36653904509555 164 107.50933003469372 173 133.16984311155193
		 180 163.41061485637672 193 171.88376682878635 249 163.12621969245998 256 143.20088630862381
		 264 111.43054438295199 274 114.12422302111955 282 111.73597462611414 291 111.36653904509555
		 300 111.36653904509555;
	setAttr -s 15 ".kit[0:14]"  18 1 1 9 9 9 18 18 
		1 9 1 1 18 1 1;
	setAttr -s 15 ".kot[3:14]"  9 9 9 18 18 1 9 1 
		1 18 1 1;
	setAttr -s 15 ".kix[1:14]"  1 1 0.99989292559635412 0.83017824256344841 
		0.47965204125583827 0.70234013994342448 1 0.97833042054802788 0.4847126624540346 
		0.94897251822321727 0.99714268383021987 0.99792770981265122 1 1;
	setAttr -s 15 ".kiy[1:14]"  0 0 -0.014633432350756414 0.55749805880761982 
		0.87745878496890539 0.71184150470750929 0 -0.20704972405274727 -0.87467344469620256 
		-0.31535877926115446 0.075541168139408255 -0.064345054107345728 0 0;
	setAttr -s 15 ".kox[0:14]"  0.99999778264919426 0.99999680701954052 
		0.99999680701954052 0.99989292559635412 0.83017824256344841 0.47965204125583827 0.70234013994342437 
		1 0.97833042054802799 0.4847126624540346 0.9489725196108455 0.99714268376073312 0.99792770981265111 
		0.9999987480649648 0.9999987480649648;
	setAttr -s 15 ".koy[0:14]"  -0.002105871955943377 -0.0025270438705719111 
		-0.0025270438705719111 -0.014633432350756414 0.55749805880761982 0.87745878496890539 
		0.71184150470750929 0 -0.20704972405274752 -0.87467344469620256 -0.31535877508552601 
		0.075541169056631594 -0.064345054107345714 -0.0015823616853429096 -0.0015823616853429096;
createNode animCurveTU -n "PoleArm_R_follow";
	rename -uid "6F247E79-4433-BBC1-730E-159364B03689";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 17 0 26 0 156 0 164 0 180 0 193 0 207 0
		 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 14 ".kit[0:13]"  18 1 1 1 18 1 18 18 
		1 18 18 1 1 1;
	setAttr -s 14 ".kot[4:13]"  18 1 18 18 1 18 18 1 
		1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "PoleArm_R_lock";
	rename -uid "AB856A02-4D16-B60B-1C07-7B8BB1E6177F";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 0 17 0 26 0 156 0 164 0 180 0 193 0 207 0
		 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 14 ".kit[0:13]"  18 1 1 1 18 1 18 18 
		1 18 18 1 1 1;
	setAttr -s 14 ".kot[4:13]"  18 1 18 18 1 18 18 1 
		1 1;
	setAttr -s 14 ".kix[1:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".kiy[1:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 14 ".kox[0:13]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 14 ".koy[0:13]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "PoleArm_R_translateX";
	rename -uid "04376772-4417-929E-DFC6-D7B8945D0EB5";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 -8.2476989567241201 17 -8.2476989567241201
		 26 -8.2476989567241201 156 -8.2476989567241201 164 -22.239737170876346 180 -18.931988418760032
		 193 -18.931988418760032 207 -18.931988418760032 240 -18.931988418760032 251 -6.7594297237728167
		 262 -6.7594297237728167 272 -9.2863561120861142 279 -8.2476989567241201 287 -8.2476989567241201
		 300 -8.2476989567241201;
	setAttr -s 15 ".kit[0:14]"  18 1 1 1 18 1 18 18 
		1 18 18 18 1 1 1;
	setAttr -s 15 ".kot[4:14]"  18 1 18 18 1 18 18 18 
		1 1 1;
	setAttr -s 15 ".kix[1:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".kiy[1:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 15 ".kox[0:14]"  0.55306714505392185 0.48406554031220483 
		0.48406554031220483 0.68818026302646207 1 1 1 1 1 1 1 1 0.73893693804554061 0.73893693804554061 
		0.73893693804554061;
	setAttr -s 15 ".koy[0:14]"  0.83313668330106805 0.8750317438140478 
		0.8750317438140478 0.72553974776081664 0 0 0 0 0 0 0 0 0.67377459256926631 0.67377459256926631 
		0.67377459256926631;
createNode animCurveTL -n "PoleArm_R_translateY";
	rename -uid "6D1D7808-4431-5CE1-DA76-C29CEFDF1E79";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 -200 17 -200 26 -200 156 -200 164 -199.11591141308543
		 180 -199.5356590446645 193 -199.5356590446645 207 -199.5356590446645 240 -199.5356590446645
		 251 -200.1481007979566 262 -200 272 -199.65479623134206 279 -200 287 -200 300 -200;
	setAttr -s 15 ".kit[0:14]"  18 1 1 1 18 1 18 18 
		1 18 18 18 1 1 1;
	setAttr -s 15 ".kot[4:14]"  18 1 18 18 1 18 18 18 
		1 1 1;
	setAttr -s 15 ".kix[1:14]"  1 1 1 1 1 1 1 1 1 0.81741493954938504 1 
		1 1 1;
	setAttr -s 15 ".kiy[1:14]"  0 0 0 0 0 0 0 0 0 0.57604931785522928 0 
		0 0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 0.81741493954938504 
		1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0.57604931785522928 
		0 0 0 0;
createNode animCurveTL -n "PoleArm_R_translateZ";
	rename -uid "F4E2C315-4360-54F7-9DF6-1B94104F9178";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 62.127072765294628 17 62.127072765294628
		 26 62.127072765294628 156 62.127072765294628 164 72.123684449589902 180 64.052225446027691
		 193 64.052225446027691 207 64.052225446027691 240 64.052225446027691 251 66.63200709217962
		 262 64.002166 272 71.839312296971002 279 62.127072765294628 287 62.127072765294628
		 300 62.127072765294628;
	setAttr -s 15 ".kit[0:14]"  18 1 1 1 18 1 18 18 
		1 18 18 18 1 1 1;
	setAttr -s 15 ".kot[4:14]"  18 1 18 18 1 18 18 18 
		1 1 1;
	setAttr -s 15 ".kix[1:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".kiy[1:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "IKLeg_R_translateX";
	rename -uid "B999CF4B-4DD3-C712-9A2F-06B509E89240";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 41.306432488148154 55 41.895923333174359
		 73 40.70494375211166 94 44.364580149354666 115 45.904296888964112 156 44.325228104796032
		 193 52.867904344670549 300 41.306432488148154;
	setAttr -s 8 ".kit[0:7]"  18 1 18 1 18 1 18 1;
	setAttr -s 8 ".kot[2:7]"  18 1 18 1 18 1;
	setAttr -s 8 ".kix[1:7]"  1 1 0.29291423672526545 1 0.27369998792462963 
		1 1;
	setAttr -s 8 ".kiy[1:7]"  0 0 0.95613871897526215 0 -0.96181511560697441 
		0 0;
	setAttr -s 8 ".kox[0:7]"  0.98599579505105994 0.98599579505105994 
		1 0.29291423732567434 1 0.27369965613092523 1 0.98599579505105994;
	setAttr -s 8 ".koy[0:7]"  -0.16677017761466925 -0.16677017761466925 
		0 0.95613871879132617 0 -0.96181521002415704 0 -0.16677017761466925;
createNode animCurveTL -n "IKLeg_R_translateY";
	rename -uid "DA819020-4E25-B0A2-694F-A7B12AFC9AFF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -29.273540455440198 55 -28.60173085080821
		 73 -26.56380423228433 94 -25.180820523851466 115 -25.173785763838122 156 -25.170923764659342
		 193 -26.132870286026087 300 -29.273540455440198;
	setAttr -s 8 ".kit[1:7]"  1 18 18 18 1 18 1;
	setAttr -s 8 ".kot[0:7]"  1 1 18 18 18 1 18 1;
	setAttr -s 8 ".kix[1:7]"  1 0.35523067254040763 0.99954582935311098 
		0.99998853411262212 1 0.76016898746060579 1;
	setAttr -s 8 ".kiy[1:7]"  0 0.93477867395789993 0.030135278707876408 
		0.0047886995404826304 0 -0.64972541161872177 0;
	setAttr -s 8 ".kox[0:7]"  0.99983323008197733 0.99983323008197733 
		0.35523067254040763 0.99954582935311098 0.99998853411262212 1 0.76016898746060568 
		0.99983323008197733;
	setAttr -s 8 ".koy[0:7]"  -0.018262311568911345 -0.018262311568911345 
		0.93477867395789982 0.030135278707876408 0.0047886995404826296 0 -0.64972541161872177 
		-0.018262311568911345;
createNode animCurveTL -n "IKLeg_R_translateZ";
	rename -uid "E48949B5-41E2-0AAB-75AE-DF86A724A552";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 49.961712313996486 55 42.354472077875826
		 73 44.404407848442212 94 69.588903874583863 115 76.460879684664377 156 69.890010794779528
		 193 60.778916279042875 300 49.961712313996486;
	setAttr -s 8 ".kit[1:7]"  1 18 9 18 1 18 1;
	setAttr -s 8 ".kot[0:7]"  1 1 18 9 18 1 18 1;
	setAttr -s 8 ".kix[1:7]"  1 0.097102977975497995 0.043631338680445442 
		1 0.27096607271195783 0.23416665805360173 1;
	setAttr -s 8 ".kiy[1:7]"  0 0.99527433990246628 0.99904769970454987 
		0 -0.96258889846032303 -0.97219646998742359 0;
	setAttr -s 8 ".kox[0:7]"  0.98643193134479656 0.98643193134479656 
		0.097102977975497995 0.043631338680445442 1 0.27096601180283375 0.23416665805360173 
		0.98643193134479656;
	setAttr -s 8 ".koy[0:7]"  -0.16417077944437758 -0.16417077944437758 
		0.99527433990246628 0.99904769970454987 0 -0.96258891560606841 -0.97219646998742371 
		-0.16417077944437758;
createNode animCurveTA -n "IKLeg_R_rotateX";
	rename -uid "B780B234-4962-9A35-F139-58879F81BA5E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 10 ".ktv[0:9]"  0 29.450227422344177 55 25.540851480118256
		 73 38.477908687510968 83 24.628795461661621 94 -18.999799629659393 115 -31.747096714418657
		 156 -32.175593954700652 173 -18.67441691283457 193 25.040935733745346 300 29.450227422344177;
	setAttr -s 10 ".kit[1:9]"  1 18 18 1 9 1 18 18 
		1;
	setAttr -s 10 ".kot[0:9]"  1 1 18 18 1 9 1 18 
		18 1;
	setAttr -s 10 ".kix[1:9]"  1 1 0.57224223522808626 0.85525912583418284 
		0.99386623219871473 0.98031484702818594 0.77718196010596907 0.99791158059894969 1;
	setAttr -s 10 ".kiy[1:9]"  0 0 -0.82008464454662466 -0.51820056703688533 
		-0.11058893477708492 0.19744062574886742 0.62927593382064428 0.064594715778504994 
		0;
	setAttr -s 10 ".kox[0:9]"  0.9999983443662821 0.9999983443662821 1 
		0.57224223522808626 0.85525913222592098 0.99386623219871473 0.98031484215644094 0.77718196010596896 
		0.99791158059894969 0.9999983443662821;
	setAttr -s 10 ".koy[0:9]"  -0.0018196880762253889 -0.0018196880762253889 
		0 -0.82008464454662455 -0.51820055648770269 -0.11058893477708492 0.19744064993762611 
		0.62927593382064428 0.064594715778504994 -0.0018196880762253889;
createNode animCurveTA -n "IKLeg_R_rotateY";
	rename -uid "A6D7E227-4A33-7922-6245-639BF02C0479";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 21.406663 55 26.036399400492339 73 31.943013416465948
		 94 35.657770380044624 115 36.436488133968169 156 35.657770380044624 173 33.697035742479933
		 193 31.73010525818697 300 21.406663;
	setAttr -s 9 ".kit[1:8]"  1 18 1 18 1 18 18 1;
	setAttr -s 9 ".kot[0:8]"  1 1 18 1 18 1 18 18 
		1;
	setAttr -s 9 ".kix[1:8]"  1 0.99176017034263331 0.99951608085347565 
		1 0.99966415993602253 0.99845891046398372 0.99871868889008175 1;
	setAttr -s 9 ".kiy[1:8]"  0 0.12810840925540803 0.031106335613642278 
		0 -0.025914616327593835 -0.055495982873308064 -0.050606130672834093 0;
	setAttr -s 9 ".kox[0:8]"  1 1 0.99176017034263309 0.99951608094241196 
		1 0.99966416010889392 0.99845891046398372 0.99871868889008175 1;
	setAttr -s 9 ".koy[0:8]"  0 0 0.12810840925540801 0.031106332755918016 
		0 -0.025914609659026748 -0.055495982873308071 -0.050606130672834086 0;
createNode animCurveTA -n "IKLeg_R_rotateZ";
	rename -uid "DBD4E8B8-44D5-5603-C908-9FB03F324292";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 14.418659 55 4.7282253676449066 73 1.4597435224250357
		 94 -16.079979365857866 115 -20.225444109272217 156 -16.079979365857866 173 21.165384857742833
		 193 20.763551066016138 300 14.418659;
	setAttr -s 9 ".kit[1:8]"  1 18 9 9 1 18 18 1;
	setAttr -s 9 ".kot[0:8]"  1 1 18 9 9 1 18 18 
		1;
	setAttr -s 9 ".kix[1:8]"  1 0.9631231871211946 0.9653461025761525 
		1 0.99453959501217248 1 0.99961337136913631 1;
	setAttr -s 9 ".kiy[1:8]"  0 -0.2690608229183738 -0.2609729914014714 
		0 0.10435992503362569 0 -0.027804815770461122 0;
	setAttr -s 9 ".kox[0:8]"  1 1 0.96312318712119449 0.9653461025761525 
		1 0.99453959507134837 1 0.99961337136913631 1;
	setAttr -s 9 ".koy[0:8]"  0 0 -0.26906082291837374 -0.2609729914014714 
		0 0.10435992446968576 0 -0.027804815770461122 0;
createNode animCurveTU -n "RollHeel_R_visibility";
	rename -uid "B33F7F6C-456A-BACD-6BDE-EDBA1561E2E5";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "RollHeel_R_translateX";
	rename -uid "610D0CB7-4D8C-3BC3-D77A-219CF93DE022";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollHeel_R_translateY";
	rename -uid "43D45370-4645-8130-5301-BC828AF631FD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollHeel_R_translateZ";
	rename -uid "F2D2DFC7-4AA5-9AD4-98D1-B59BB7AA783B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollHeel_R_scaleX";
	rename -uid "81498286-4FE8-436E-AB66-11B74FF65428";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollHeel_R_scaleY";
	rename -uid "88DD2EE1-49F6-B703-F110-978786BA679E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollHeel_R_scaleZ";
	rename -uid "43C126B8-412D-C935-36EF-E2963A7FE56B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollHeel_R_rotateX";
	rename -uid "08CAB0C8-4B9C-96C4-A7B0-68A613091797";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollHeel_R_rotateY";
	rename -uid "713E9585-4420-BD28-AB85-A2A49CE6B252";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollHeel_R_rotateZ";
	rename -uid "EF6DEE7C-4879-EF8B-9740-5BB5C67CF59F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_R_visibility";
	rename -uid "29857E25-434C-7CA6-D345-32BE5F834C5B";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "RollToesEnd_R_translateX";
	rename -uid "635A4A3F-4304-BA75-99CF-58B7FA2FB322";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToesEnd_R_translateY";
	rename -uid "DC4E8A6A-40A6-B4DE-17EE-4B93F77C9091";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToesEnd_R_translateZ";
	rename -uid "2B386241-4B08-4D29-4FF1-DA81507F59FF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_R_scaleX";
	rename -uid "070BCC78-45B5-0038-FC79-379E67A8E9B5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_R_scaleY";
	rename -uid "39D32BBD-4D78-8755-7879-4ABC88C0EF7C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_R_scaleZ";
	rename -uid "FEE4E8B6-4815-FAA4-1635-FE8F5A2F0E2A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToesEnd_R_rotateX";
	rename -uid "01F3AF91-4A14-662D-A89E-B6B1275C6E50";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToesEnd_R_rotateY";
	rename -uid "6C0C2642-441D-DD20-668C-2FB10CEC319B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToesEnd_R_rotateZ";
	rename -uid "7E0B8A16-4696-C4DF-1245-1D949B9BB394";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_R_visibility";
	rename -uid "E5ABC059-4B6E-A6AE-373C-08A00F066338";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "RollToes_R_translateX";
	rename -uid "FBFBD4C2-4C03-45D0-C1D7-AA8C3B5B93DB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToes_R_translateY";
	rename -uid "5ABF8E6E-4DFB-9C81-3A8B-10855E11F2D9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToes_R_translateZ";
	rename -uid "FD0946F4-46D5-10AC-1596-529FC94B9F78";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_R_scaleX";
	rename -uid "A7545CCD-49A7-649C-5FB2-E1B535F650F3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_R_scaleY";
	rename -uid "0FF16263-4930-2F06-2ED3-8A98E1773FA1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_R_scaleZ";
	rename -uid "D9F715EB-40DF-7935-CEA9-9894AE3BDAD6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToes_R_rotateX";
	rename -uid "FD29E136-4498-533C-26B9-89B6AB5D8766";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToes_R_rotateY";
	rename -uid "1F927672-421A-3C7D-79FF-C5AA70A03CB5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToes_R_rotateZ";
	rename -uid "97DB8898-4E85-A275-3B2C-7BB9E5F9C2CA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_R_visibility";
	rename -uid "17010BE0-4638-F042-EF81-729F1AB28BE7";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "IKToes_R_translateX";
	rename -uid "39C7765B-4494-83E6-1F14-72AD29790EBC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "IKToes_R_translateY";
	rename -uid "55A46D78-4799-9EA2-FB21-0B896E91D1B1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "IKToes_R_translateZ";
	rename -uid "44B086BF-4382-73C4-F07B-708AD1A4C5F6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_R_scaleX";
	rename -uid "14F081D5-46DD-59CF-15A9-52833F905B9B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_R_scaleY";
	rename -uid "197DFD9D-4D4A-2572-2DB8-E3A21E3E7157";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_R_scaleZ";
	rename -uid "307FBC6B-48F8-39A3-BDDE-DDA682EA25A2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "IKToes_R_rotateX";
	rename -uid "41C2A07E-45DC-EEB4-7E69-84955BEEA1E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "IKToes_R_rotateY";
	rename -uid "185B5038-44C4-0435-699B-E8A5EC4021A6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "IKToes_R_rotateZ";
	rename -uid "8C68A4BE-4FC9-F0B8-2772-6E9A72966689";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "PoleLeg_R_follow";
	rename -uid "29E1DFD1-4DFF-DA49-B014-B8A843A891B3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 10 55 10 73 10 156 10 193 10 300 10;
	setAttr -s 6 ".kit[5]"  1;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 1;
	setAttr -s 6 ".kix[5]"  1;
	setAttr -s 6 ".kiy[5]"  0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "PoleLeg_R_lock";
	rename -uid "02FC85E3-47E0-F18D-F75E-A8BCFD4A4C4A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 55 0 73 0 156 0 193 0 300 0;
	setAttr -s 6 ".kit[5]"  1;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 1;
	setAttr -s 6 ".kix[5]"  1;
	setAttr -s 6 ".kiy[5]"  0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTL -n "PoleLeg_R_translateX";
	rename -uid "1D85EC91-4FBE-869E-F3DF-C2892AD5DAAD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 17.297055252294104 55 8.7606185188756296
		 73 -0.25961050593445789 94 -11.800334851913208 156 -9.4276499713077904 173 15.600747544705541
		 193 16.249554797271909 300 17.297055252294104;
	setAttr -s 8 ".kit[7]"  1;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 1;
	setAttr -s 8 ".kix[7]"  1;
	setAttr -s 8 ".kiy[7]"  0;
	setAttr -s 8 ".kox[0:7]"  0.99662319473335692 0.13728649070601789 
		0.063100640140453759 1 0.27882695209516706 0.32402946132216509 0.92825162510065817 
		0.99662319473335692;
	setAttr -s 8 ".koy[0:7]"  -0.082110947622576744 -0.99053138237494853 
		-0.99800716891907393 0 0.96034136159249106 0.9460469904794726 0.37195284714327298 
		-0.082110947622576744;
createNode animCurveTL -n "PoleLeg_R_translateY";
	rename -uid "1E5C81A1-47A2-2BBC-AF60-97BEF5279C26";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 10.852866646005092 55 -10.400767561566555
		 73 -5.8300931239628353 94 5.182000905046662 156 5.7235655643955754 173 -2.1690160148018425
		 193 -1.3934350003447364 300 10.852866646005092;
	setAttr -s 8 ".kit[7]"  1;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 1;
	setAttr -s 8 ".kix[7]"  1;
	setAttr -s 8 ".kiy[7]"  0;
	setAttr -s 8 ".kox[0:7]"  1 1 0.08313667775140364 0.78615486523055267 
		1 1 0.309166754732357 1;
	setAttr -s 8 ".koy[0:7]"  0 0 0.99653815421812086 0.61802955258978653 
		0 0 0.95100784316863685 0;
createNode animCurveTL -n "PoleLeg_R_translateZ";
	rename -uid "244B0915-4C31-7EDB-FAC2-559F7F4201CC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 8 ".ktv[0:7]"  0 -14.25607360588581 55 0.16580547731708972
		 73 -2.4961587409972834 94 -16.162363762329715 156 -17.3294855325722 173 0.34050761070864288
		 193 -0.52886216956476817 300 -14.25607360588581;
	setAttr -s 8 ".kit[7]"  1;
	setAttr -s 8 ".kot[0:7]"  1 18 18 18 18 18 18 1;
	setAttr -s 8 ".kix[7]"  1;
	setAttr -s 8 ".kiy[7]"  0;
	setAttr -s 8 ".kox[0:7]"  1 1 0.079365861667659854 0.50830596324709454 
		1 1 0.27854416225678863 1;
	setAttr -s 8 ".koy[0:7]"  0 0 -0.99684555473842085 -0.86117654852384562 
		0 0 -0.96042342207625475 0;
createNode animCurveTL -n "IKArm_L_translateX";
	rename -uid "3A85ED66-4039-DD30-DCFE-3FB2ED6A9853";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 -34.723496885355118 9 -34.932465108657624
		 17 -35.200758304862383 26 -35.297040265253727 94 -35.310633784640835 156 -32.428482679757202
		 173 -32.826631418972276 180 -34.711594296953457 193 -34.915236633707778 207 -34.820044912366839
		 262 -34.724023415555642 272 -33.588565474264293 282 -33.662366035957007 300 -34.723496885355118;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 9 9 18 18 9;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 9 9 18 18 9;
	setAttr -s 14 ".kix[0:13]"  0.99999983185024588 0.76486568302383284 
		0.84098302595385299 0.99983819363471116 1 1 0.42862766582135803 0.57854474756499596 
		1 0.99656199903738296 0.86938436381434525 1 0.8329954731152982 0.49220048649577652;
	setAttr -s 14 ".kiy[0:13]"  0.00057991333830387205 -0.64418979108061447 
		-0.54106150302668998 -0.017988511591514409 0 0 -0.90348122509133211 -0.81565064523051467 
		0 0.082850359532201615 0.49413644669779849 0 -0.55327980423057233 -0.87048186718237885;
	setAttr -s 14 ".kox[0:13]"  0.99999983185024588 0.76486568302383284 
		0.8409830259538531 0.99983819363471105 1 1 0.42862766582135803 0.57854474756499596 
		1 0.99656199903738296 0.86938436381434525 1 0.8329954731152982 0.49220048649577652;
	setAttr -s 14 ".koy[0:13]"  0.00057991333830387205 -0.64418979108061436 
		-0.54106150302668998 -0.017988511591514406 0 0 -0.90348122509133211 -0.81565064523051467 
		0 0.082850359532201615 0.49413644669779849 0 -0.55327980423057244 -0.87048186718237885;
createNode animCurveTL -n "IKArm_L_translateY";
	rename -uid "8305AB02-4E6C-41B3-E5F2-08B2DB88852E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 -55.617 9 -53.887943267425314 17 -51.405124997446428
		 26 -50.975133836858213 94 -50.828518178364519 156 -49.643217042760128 173 -49.954748342972643
		 180 -51.310403971247041 193 -53.306845820278021 207 -54.052730919369537 262 -54.203092151763322
		 272 -54.60197629191024 282 -55.50826661179083 300 -55.616711807430768;
	setAttr -s 14 ".kit[0:13]"  1 18 18 18 18 18 18 18 
		18 1 1 1 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 18 18 18 18 18 18 
		18 1 1 1 18 18;
	setAttr -s 14 ".kix[0:13]"  0.99998929864553221 0.13333886208043513 
		0.22651791221871878 0.98168784376395801 0.9816878437639579 1 0.51846639923740767 
		0.19506021244491281 0.31182483432275537 0.93862270640392176 1.8333333333333268 0.34462142824325492 
		0.87908597151376477 1;
	setAttr -s 14 ".kiy[0:13]"  -0.0046262938100073989 0.9910705059979813 
		0.97400699968946469 0.19049665982917136 0.19049665982917136 0 -0.85509800190492613 
		-0.9807912690888646 -0.95013960695236055 -0.34494552471800111 -0.24377499514216083 
		-0.93874174893608464 -0.4766632508256749 0;
	setAttr -s 14 ".kox[0:13]"  0.99998929864553221 0.13333886208043513 
		0.22651791221871878 0.9816878437639579 0.9816878437639579 1 0.51846639923740767 0.19506021244491284 
		0.31182483432275537 0.93862270640392231 0.33333333333333748 0.34462137477126836 0.87908597151376477 
		1;
	setAttr -s 14 ".koy[0:13]"  -0.0046262938100073989 0.9910705059979813 
		0.97400699968946469 0.19049665982917136 0.19049665982917136 0 -0.85509800190492624 
		-0.9807912690888646 -0.95013960695236055 -0.34494552471799989 -0.044322726389474099 
		-0.93874176856618086 -0.47666325082567496 0;
createNode animCurveTL -n "IKArm_L_translateZ";
	rename -uid "3EFE5558-4024-623D-0B81-EE9D3EFF8EF6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 -0.49831627542675466 9 -0.45833096441758714
		 17 -0.24713619953678723 26 -0.22985590289796476 94 -0.21576868450885664 156 -3.3624925727709902
		 173 -2.2459164494207582 180 -0.5931840028116423 193 -0.37449276733396519 207 -0.42516746954564183
		 262 -0.49774858046199605 272 -0.40536626570878403 282 -0.40839939978913514 300 -0.49831627542675466;
	setAttr -s 14 ".kit[0:13]"  1 18 1 18 18 18 18 18 
		18 9 9 18 18 9;
	setAttr -s 14 ".kot[0:13]"  1 18 1 18 18 18 18 18 
		18 9 9 18 18 9;
	setAttr -s 14 ".kix[0:13]"  0.99999980453017212 0.92852371473816264 
		0.99389266291614242 0.99992533060233657 1 1 0.27753245622401224 0.55112982495649876 
		1 0.99856716900474773 0.99995824179848269 1 0.99962761206733652 0.98895644314832387;
	setAttr -s 14 ".kiy[0:13]"  -0.000625251643361719 0.37127309513192985 
		0.11035114227528089 0.012220197208237891 0 0 0.960716261828781 0.83441950842691781 
		0 -0.053512699295059155 0.0091386355265527814 0 -0.027288041200392861 -0.14820645584931738;
	setAttr -s 14 ".kox[0:13]"  0.99999980453017212 0.92852371473816264 
		0.99389266597832326 0.99992533060233646 1 1 0.27753245622401218 0.55112982495649876 
		1 0.99856716900474773 0.99995824179848269 1 0.99962761206733652 0.98895644314832387;
	setAttr -s 14 ".koy[0:13]"  -0.000625251643361719 0.3712730951319298 
		0.11035111469532652 0.012220197208237891 0 0 0.96071626182878089 0.83441950842691781 
		0 -0.053512699295059155 0.0091386355265527814 0 -0.027288041200392861 -0.14820645584931738;
createNode animCurveTA -n "IKArm_L_rotateX";
	rename -uid "FDE3BF36-434E-20AD-EDBA-9AA698392229";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 -166.60466341286167 9 -165.74660533056215
		 26 -177.85984120853641 37 -172.48439674493522 94 -176.18464722290648 156 -184.11098945404129
		 173 -177.80965295667067 180 -177.832098857533 193 -169.68278480315735 207 -167.43080251546877
		 262 -166.60669307837378 272 -164.98491784977696 282 -163.82861503011512 300 -166.60466341286167;
	setAttr -s 14 ".kit[0:13]"  1 18 1 18 18 18 9 9 
		18 1 9 18 18 9;
	setAttr -s 14 ".kot[0:13]"  1 18 1 18 18 18 9 9 
		18 1 9 18 18 9;
	setAttr -s 14 ".kix[0:13]"  0.9999999992388795 1 0.99335292071772174 
		1 0.99869404911356685 1 0.99074768298125349 0.97810693374902546 0.98025744747922483 
		0.99934103049359613 0.99980596232344054 0.99736562643246718 1 0.99675541888906882;
	setAttr -s 14 ".kiy[0:13]"  3.9015908501431784e-05 0 -0.11510853531155579 
		0 -0.051090079909395354 0 0.1357167221357681 0.20810292201715849 0.19772540722303478 
		0.03629744856043219 0.019698672607538392 0.072538315468256759 0 -0.080489967792743103;
	setAttr -s 14 ".kox[0:13]"  0.9999999992388795 1 0.99335292028892774 
		1 0.99869404911356696 1 0.99074768298125349 0.97810693374902546 0.98025744747922483 
		0.99934103017520504 0.99980596232344054 0.99736562643246718 1 0.99675541888906882;
	setAttr -s 14 ".koy[0:13]"  3.9015908501431784e-05 0 -0.11510853901192225 
		0 -0.051090079909395361 0 0.1357167221357681 0.20810292201715849 0.19772540722303478 
		0.036297457326375744 0.019698672607538392 0.072538315468256759 0 -0.080489967792743103;
createNode animCurveTA -n "IKArm_L_rotateY";
	rename -uid "A072C78C-43B7-FEBE-9EDD-96BE15BEE27D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 -54.41741790714925 9 -54.751322571522635
		 26 -56.95112454773583 37 -57.266064709645114 94 -57.684917844429393 156 -52.504992344094546
		 173 -52.600571921910422 180 -56.23139014190405 193 -55.094986605519274 207 -54.656536277624689
		 262 -54.418005375177763 272 -53.890360278097759 282 -53.468364548194778 300 -54.41741790714925;
	setAttr -s 14 ".kit[0:13]"  1 18 1 18 18 9 9 9 
		18 1 9 18 18 9;
	setAttr -s 14 ".kot[0:13]"  1 18 1 18 18 9 9 9 
		18 1 9 18 18 9;
	setAttr -s 14 ".kix[0:13]"  0.99999999993623645 0.99870076952962472 
		0.99922038887313236 0.99998403802944447 1 0.99943269898284148 0.99671165850352661 
		0.99787451415609862 0.99953396711235454 0.99998953501757315 0.99998095481411309 0.99969109513869847 
		1 0.99961914878761038;
	setAttr -s 14 ".kiy[0:13]"  1.1292796141710095e-05 -0.050958541393323793 
		-0.039479291536527808 -0.0056501049836773344 0 0.033679076648166488 -0.081030054937348175 
		-0.065164821780852533 0.030526195122199274 0.0045749158831613077 0.0061717103832375974 
		0.024853858863154391 0 -0.027596329051760887;
	setAttr -s 14 ".kox[0:13]"  0.99999999993623645 0.99870076952962494 
		0.99922038890335463 0.99998403802944436 1 0.99943269898284148 0.99671165850352661 
		0.99787451415609862 0.99953396711235454 0.99998953502970978 0.99998095481411309 0.99969109513869847 
		1 0.99961914878761038;
	setAttr -s 14 ".koy[0:13]"  1.1292796141710095e-05 -0.050958541393323807 
		-0.039479290771603025 -0.0056501049836773336 0 0.033679076648166488 -0.081030054937348175 
		-0.065164821780852533 0.030526195122199277 0.0045749132303078126 0.0061717103832375974 
		0.024853858863154391 0 -0.027596329051760887;
createNode animCurveTA -n "IKArm_L_rotateZ";
	rename -uid "8CE04E34-4F8C-E24D-3346-B8AEB2D95EC7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  0 -9 9 -10.667297418326532 26 20.960640337000367
		 37 17.78183081299786 94 22.931903589565106 156 25.481964218493928 173 18.156953399815208
		 180 13.707070221991813 193 1.7978456134736505 207 -2.0353641241281255 262 -2.0353641241281255
		 272 -3.237739953770753 282 -7.9093809202992409 300 -9;
	setAttr -s 14 ".kit[0:13]"  1 18 1 1 18 18 9 9 
		18 1 9 18 18 18;
	setAttr -s 14 ".kot[0:13]"  1 18 1 1 18 18 9 9 
		18 1 9 18 18 18;
	setAttr -s 14 ".kix[0:13]"  0.99999999801835016 1 0.9639731163404337 
		0.99906489696231027 0.99942654924315011 1 0.96855236339906703 0.91924185154432392 
		0.95642361653886776 0.9989668714703257 0.99995309809790323 0.98838131437720167 0.99550144876127944 
		1;
	setAttr -s 14 ".kiy[0:13]"  -6.2954743424552219e-05 0 0.26599968227972137 
		-0.043235768267586384 0.033861078954002047 0 -0.24880980558266086 -0.39369330495877514 
		-0.29198264627664589 -0.04544435833841029 -0.009685122838931649 -0.15199466237337064 
		-0.094746321903247568 0;
	setAttr -s 14 ".kox[0:13]"  0.99999999801835016 1 0.9639731105954541 
		0.99906489640435359 0.99942654924315011 1 0.96855236339906703 0.91924185154432392 
		0.95642361653886765 0.99896687205636925 0.99995309809790323 0.98838131437720167 0.99550144876127933 
		1;
	setAttr -s 14 ".koy[0:13]"  -6.2954743424552219e-05 0 0.26599970309931636 
		-0.043235781160493626 0.033861078954002047 0 -0.24880980558266086 -0.39369330495877514 
		-0.29198264627664589 -0.045444345455882731 -0.009685122838931649 -0.15199466237337064 
		-0.094746321903247582 0;
createNode animCurveTL -n "PoleArm_L_translateX";
	rename -uid "C1E40B14-45D3-9A6F-9FFC-728354FCFA83";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  0 -5.36712 17 6.082202686076787 26 2.6051702673234356
		 164 -5.36712 180 16.380107429486607 207 18.012833481691089 240 27.843638029303538
		 262 21.25790455139288 279 -4.5208226911451597 287 -5.36712 300 -5.36712;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 1;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[0:10]"  1 1 0.39345438999589605 1 0.18071651841290606 
		0.18071651841290604 1 0.04013515162423642 0.10445809355908985 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 -0.91934413741153398 0 0.98353522558814221 
		0.98353522558814221 0 -0.99919426019373203 -0.99452928900560811 0 0;
createNode animCurveTL -n "PoleArm_L_translateY";
	rename -uid "87155065-4276-AAC8-8932-C49560BFE18D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 -200 17 -200 26 -200 37 -200 94 -200 156 -200
		 164 -200 173 -200 180 -200 207 -200 240 -200 262 -200 279 -200 287 -200 300 -200;
	setAttr -s 15 ".kit[2:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 1;
	setAttr -s 15 ".kot[0:14]"  1 18 1 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[2:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".kiy[2:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "PoleArm_L_translateZ";
	rename -uid "80A68CE1-4210-2B5B-EEEF-DC8C8DAD2AE3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  0 0 17 -7.4446473022569348 26 -1.0886800774538861
		 164 0 180 -15.074458698380848 207 -14.02485940337414 240 -27.934697763721243 262 -15.441565763594499
		 279 -0.65762731819438613 287 0 300 0;
	setAttr -s 11 ".kit[10]"  1;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 18 18 18 
		18 18 1;
	setAttr -s 11 ".kix[10]"  1;
	setAttr -s 11 ".kiy[10]"  0;
	setAttr -s 11 ".kox[0:10]"  1 1 0.81537961825714234 1 1 1 1 0.047605042887617986 
		0.13394798561618479 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0.57892666040772123 0 0 0 0 0.99886623723683254 
		0.99098836378101152 0 0;
createNode animCurveTL -n "IKLeg_L_translateX";
	rename -uid "CA745B4D-4CD5-759C-1AC9-80AD529A3E3F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 55.948959638463592 86 63.014068760790558
		 115 69.320503413924399 164 59.549108502504779 193 57.43606295667373 240 63.621792090791324
		 300 55.948959638463592;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kox[0:6]"  0.52291028338623702 0.27557789262963728 
		1 0.21371873766172075 1 1 1;
	setAttr -s 7 ".koy[0:6]"  -0.85238772605483082 0.96127874474254771 
		0 -0.97689523551519097 0 0 0;
createNode animCurveTL -n "IKLeg_L_translateY";
	rename -uid "203495DB-4C85-5D87-CD16-FC9FE15F4ECB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 -22.439489595870636 86 -20.432668689345629
		 115 -19.952270255048965 164 -18.591310644848829 193 -17.671867841154125 240 -21.797795505839225
		 300 -22.439489595870636;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kox[0:6]"  0.65765185006190519 0.8388880579626834 
		0.81607016899122475 0.75180202025662224 1 0.72047204568689249 1;
	setAttr -s 7 ".koy[0:6]"  0.75332200559266382 0.54430398327368268 
		0.57795283482532889 0.65938890067854594 0 -0.69348398062517946 0;
createNode animCurveTL -n "IKLeg_L_translateZ";
	rename -uid "C974A8C6-40E9-47DA-3205-9198D354419E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 37.255356715080495 86 43.856933576042557
		 115 46.280354753122431 164 47.936846948213507 193 38.093233138762947 240 34.583655066390648
		 300 37.255356715080495;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kox[0:6]"  0.39195019062897496 0.39094274397021844 
		0.53741847800223885 1 0.18639269984517959 1 1;
	setAttr -s 7 ".koy[0:6]"  -0.91998643906631061 0.92041499930033521 
		0.8433157057127284 0 -0.98247532358040668 0 0;
createNode animCurveTA -n "IKLeg_L_rotateX";
	rename -uid "CD15FE02-440D-4E36-BD77-16B61A010774";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1.0984042062708703 86 -31.434113336487247
		 115 -39.473535874894672 164 -34.988190759746402 193 -9.5278797107364088 240 -12.623613358776856
		 300 1.0984042062708703;
	setAttr -s 7 ".kot[0:6]"  1 18 18 18 18 18 18;
	setAttr -s 7 ".kox[0:6]"  0.99757841646687739 0.98336286483923308 
		1 0.98982022615023768 1 1 1;
	setAttr -s 7 ".koy[0:6]"  0.069550722493999989 -0.18165207418352311 
		0 0.14232329360962803 0 0 0;
createNode animCurveTA -n "IKLeg_L_rotateY";
	rename -uid "DF1A7FA8-4323-40BD-FED2-329248390D70";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 55.220417555915475 86 51.26688445213972
		 164 49.401545574449976 193 56.96757102052878 240 55.220417555915475 300 55.220417555915475;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 18;
	setAttr -s 6 ".kox[0:5]"  1 0.99982747789098358 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 -0.018574564709698819 0 0 0 0;
createNode animCurveTA -n "IKLeg_L_rotateZ";
	rename -uid "D6CE71E1-4B79-7CB4-6B23-A087BA4650D4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -9.1624239803073806 86 -22.626033816170896
		 164 -26.082481393258444 193 2.8769904001348592 240 -9.1624239803073806 300 -9.1624239803073806;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 18;
	setAttr -s 6 ".kox[0:5]"  1 0.99854409186757431 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 -0.05394160357610308 0 0 0 0;
createNode animCurveTU -n "RollHeel_L_visibility";
	rename -uid "FCFDE93A-43FB-CEF4-2655-4086B4C87D0B";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "RollHeel_L_translateX";
	rename -uid "241E3332-4753-16B1-C3E7-A9A6856B514E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollHeel_L_translateY";
	rename -uid "2A891084-45BF-A1B7-802E-B393B10C2B1C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollHeel_L_translateZ";
	rename -uid "D82E074D-47BC-DBB6-428B-CFBA98340A60";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollHeel_L_scaleX";
	rename -uid "1765A958-471E-6538-0F2E-7BBC609C488B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollHeel_L_scaleY";
	rename -uid "CD9A01D0-4025-C449-A9BF-7B9BAD5E8043";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollHeel_L_scaleZ";
	rename -uid "F7BCAF6A-4C16-6841-414B-28B1319EDC68";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollHeel_L_rotateX";
	rename -uid "26C63DD6-48C6-EFE9-C179-BC92B7E6BBAE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollHeel_L_rotateY";
	rename -uid "24CE3BD3-4BA1-DB30-C790-5A8312A101DF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollHeel_L_rotateZ";
	rename -uid "4359C01D-491F-AD68-C75E-A1934818A8A9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_L_visibility";
	rename -uid "BE0CFB15-44E1-15C2-AFA3-ABA03B6B5C5B";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "RollToesEnd_L_translateX";
	rename -uid "6B21544F-4509-A430-E3D0-96A38473777B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToesEnd_L_translateY";
	rename -uid "FC1DA074-42D1-3FB0-9051-09AA63EFA9DE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToesEnd_L_translateZ";
	rename -uid "753A8812-45EA-9A35-D586-53A25EFB9AC0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_L_scaleX";
	rename -uid "66AF70F1-41EB-D636-7738-59B7FDFA3F37";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_L_scaleY";
	rename -uid "B5F6CB8D-4EEA-5D8A-0CC7-F7B1F03FBC2F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToesEnd_L_scaleZ";
	rename -uid "37682636-40F1-76FA-4BAC-34B3E4CA45FB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToesEnd_L_rotateX";
	rename -uid "1B2C0DEB-464C-05BE-3151-149954016E40";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToesEnd_L_rotateY";
	rename -uid "50C29B6A-462B-A700-BDFC-069B118D7438";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToesEnd_L_rotateZ";
	rename -uid "87F78476-4D99-13B9-ACBA-CA834C0899D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_L_visibility";
	rename -uid "DB75A0D6-485A-D359-C51D-54AF07D10FB1";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "RollToes_L_translateX";
	rename -uid "FA5EC968-44C8-8981-8382-0F9E44A5EECD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToes_L_translateY";
	rename -uid "09DFD2D2-4818-AA37-4D6F-019D1A85F98C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "RollToes_L_translateZ";
	rename -uid "73DBC66A-48BC-08A1-82A6-6DBA6BFBA5D1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_L_scaleX";
	rename -uid "4B34512E-4B40-BEA6-6306-A1A09F57C62E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_L_scaleY";
	rename -uid "BF0DC205-4F32-611C-CDFF-00BFD7C2BBAD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RollToes_L_scaleZ";
	rename -uid "824D1B92-4B33-0992-1FBE-B0AB9BA7C4A0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToes_L_rotateX";
	rename -uid "D47545E9-4FB5-FFF1-C057-58B2D27262AF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToes_L_rotateY";
	rename -uid "23CF7896-40F2-458B-42DC-1AA0B2D39103";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RollToes_L_rotateZ";
	rename -uid "F092FB1F-477B-740A-A506-BC8523C76431";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_L_visibility";
	rename -uid "DFD9017B-4435-991E-7F63-85BD4F221C21";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "IKToes_L_translateX";
	rename -uid "2997CB1B-4523-2D96-511B-E9A341FEBF92";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "IKToes_L_translateY";
	rename -uid "9D603587-457F-65EE-50A7-4893DA43CDB0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTL -n "IKToes_L_translateZ";
	rename -uid "87070EB6-431D-7A49-B2E9-B0806AC8DF67";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_L_scaleX";
	rename -uid "7F44CC33-4A13-214A-1161-3BB585BE7C0C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_L_scaleY";
	rename -uid "A080C84F-476A-FC10-6B3F-CCAA1A7E4AC0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "IKToes_L_scaleZ";
	rename -uid "A857B746-4B89-4C82-352E-E59ACB249F7C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "IKToes_L_rotateX";
	rename -uid "260E462B-4CA9-6E1B-DBA2-DAA215937879";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "IKToes_L_rotateY";
	rename -uid "0453EC2F-4A72-D687-5CB7-17B7FB48BCF2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "IKToes_L_rotateZ";
	rename -uid "8BC1C6C4-4ADA-0105-7B42-98A930750F71";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "PoleLeg_L_follow";
	rename -uid "376A55D5-4BD6-1255-CD63-8E9990939050";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 10 164 10 193 10 240 10 300 10;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "PoleLeg_L_lock";
	rename -uid "EC19DAD8-40C2-E74E-259E-AD9AEBD00838";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 164 0 193 0 240 0 300 0;
	setAttr -s 5 ".kit[4]"  1;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 1;
	setAttr -s 5 ".kix[4]"  1;
	setAttr -s 5 ".kiy[4]"  0;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTL -n "PoleLeg_L_translateX";
	rename -uid "7947F194-4168-8E2B-D1E5-75BCE177EF25";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -14.0076398962056 86 -20.602523223075227
		 164 -8.4523553572228369 193 -11.089938800936462 240 -22.316048771639743 300 -14.0076398962056;
	setAttr -s 6 ".kit[5]"  1;
	setAttr -s 6 ".kot[5]"  1;
	setAttr -s 6 ".kix[5]"  1;
	setAttr -s 6 ".kiy[5]"  0;
	setAttr -s 6 ".kox[5]"  0.24503038756092949;
	setAttr -s 6 ".koy[5]"  -0.9695153991411074;
createNode animCurveTL -n "PoleLeg_L_translateY";
	rename -uid "313FFBC5-4E3A-A76E-A639-62BD0A89C146";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 -6.470955861203664 86 -7.2149772047817482
		 164 0 193 -5.6957215898974267 240 -8.230050750054728 300 -6.470955861203664;
	setAttr -s 6 ".kit[5]"  1;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 1;
	setAttr -s 6 ".kix[5]"  1;
	setAttr -s 6 ".kiy[5]"  0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 0.2941929958012911 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 -0.95574603385076184 0 0;
createNode animCurveTL -n "PoleLeg_L_translateZ";
	rename -uid "B3B3793C-45A1-91F0-ABF4-F299AC547ECD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 4.1839808417593032 86 5.2860496408072892
		 164 0 193 2.4200047765040362 240 5.1301653122155262 300 4.1839808417593032;
	setAttr -s 6 ".kit[5]"  1;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 1;
	setAttr -s 6 ".kix[5]"  1;
	setAttr -s 6 ".kiy[5]"  0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 0.44276884168218089 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0.89663579720833131 0 0;
createNode animCurveTU -n "FKIKArm_R_FKIKBlend";
	rename -uid "3FEE25E0-4A23-45C0-D56E-0F9807335F08";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 10 17 10 26 10 156 10 164 10 173 10 180 10
		 187 10 193 10 207 10 240 10 262 10 272 10 279 10 287 10 300 10;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIKArm_R_FKVis";
	rename -uid "9BFC1114-45E2-95AF-3A2E-19B5265BC6F9";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "FKIKArm_R_IKVis";
	rename -uid "FA47DAC4-4198-BC46-A0E6-4B89F6AF4149";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "FKIKSpine_M_FKIKBlend";
	rename -uid "98BA3E83-4D65-B398-F219-BCA24AE9D5C9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIKSpine_M_FKVis";
	rename -uid "981B7F51-4D64-70A0-B66F-22998EDA617D";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "FKIKSpine_M_IKVis";
	rename -uid "DB3CBF8F-4FAB-9ED8-9640-9A83940D72ED";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "FKIKArm_L_FKIKBlend";
	rename -uid "E151D21B-4A52-BC8D-54C2-DEBC6C4CC859";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 10 17 10 26 10 156 10 164 10 173 10 180 10
		 187 10 193 10 207 10 240 10 262 10 272 10 279 10 287 10 300 10;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIKArm_L_FKVis";
	rename -uid "F8852BAB-402E-FD4A-5404-9184C1FAE988";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "FKIKArm_L_IKVis";
	rename -uid "DF851958-4F6B-3BEF-26DB-6D98E100EDCD";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "FKIKLeg_L_FKIKBlend";
	rename -uid "2AC4B2FE-4C40-4D1D-4917-80BBDA5FCB6D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 10 17 10 26 10 156 10 164 10 173 10 180 10
		 187 10 193 10 207 10 240 10 262 10 272 10 279 10 287 10 300 10;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIKLeg_L_FKVis";
	rename -uid "130A517A-4F1C-D4C4-D5CC-46BEFAFE3516";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "FKIKLeg_L_IKVis";
	rename -uid "80B7CA52-43E4-F536-8A13-61B98E69F89A";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTU -n "RootX_M_CenterBtwFeet";
	rename -uid "2D7B11CE-4FAD-4524-6F2F-6C90B8299F19";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "RootX_M_visibility";
	rename -uid "9704AAB7-4FA9-3DE7-871E-0C8D3AB29A32";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 1 17 1 26 1 156 1 164 1 173 1 180 1 187 1
		 193 1 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 16 ".kit[0:15]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 9 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
createNode animCurveTL -n "RootX_M_translateX";
	rename -uid "DB6A9B19-466D-A2FB-5957-DB9EB9261D4F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 10.042317 17 10.042317 26 10.042317 156 10.042317
		 164 10.042317 173 10.045225251829839 180 10.080912354162425 187 10.082448 193 10.082448
		 207 10.082448 240 10.082448 262 10.082448 272 10.080412806536438 279 10.050819993189519
		 287 10.043662864744766 300 10.042317;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 0.99957737163786597 0.9998051438465333 
		1 1 1 1 1 0.99983229069547042 0.99730977856487502 0.99995659468867815 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0.029070227201309324 0.019740170668283406 
		0 0 0 0 0 -0.018313669284125381 -0.07330215262105004 -0.0093171207259871644 0;
createNode animCurveTL -n "RootX_M_translateY";
	rename -uid "4B7F3FFA-486B-491B-5F77-1DA3456D093C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 -74.668261 17 -74.668261 26 -74.668261
		 156 -74.668261 164 -74.668261 173 -74.939267946826789 180 -74.679441547119893 187 -74.668261
		 193 -74.668261 207 -74.668261 240 -74.668261 262 -74.668261 272 -74.668261 279 -74.668261
		 287 -74.668261 300 -74.668261;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 0.98982540173757938 1 1 1 1 
		1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0.1422872941447679 0 0 0 0 
		0 0 0 0 0;
createNode animCurveTL -n "RootX_M_translateZ";
	rename -uid "FC68ADE3-4B36-A85D-8D44-229711EAD435";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 5.595074 17 5.595074 26 5.595074 156 5.595074
		 164 5.595074 173 5.604010575012417 180 5.7136711153063304 187 5.7183899 193 5.7183899
		 207 5.7183899 240 5.7183899 262 5.7183899 272 5.7121360883921861 279 5.6212022863088222
		 287 5.5992096189050589 300 5.595074;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 0.9960306407758921 0.99816463539367539 
		1 1 1 1 1 0.99841979202835374 0.97543125862449354 0.99959037879166712 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0.089011025359591628 0.060558737184745318 
		0 0 0 0 0 -0.056195363563722504 -0.22030401652769802 -0.028619479854314577 0;
createNode animCurveTA -n "RootX_M_rotateX";
	rename -uid "EF9C311C-4636-BA9F-6D68-84B4CDFC0ED9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 -72.495077 17 -72.495077 26 -72.495077
		 156 -72.495077 164 -72.495077 173 -72.495077 180 -72.495077 187 -72.495077 193 -72.495077
		 207 -72.495077 240 -72.495077 262 -72.495077 272 -72.495077 279 -72.495077 287 -72.495077
		 300 -72.495077;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RootX_M_rotateY";
	rename -uid "EE85B516-4C46-9471-11A0-34BFA68E1990";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 34.013109 17 34.013109 26 34.013109 156 34.013109
		 164 34.013109 173 34.013109 180 34.013109 187 34.013109 193 34.013109 207 34.013109
		 240 34.013109 262 34.013109 272 34.013109 279 34.013109 287 34.013109 300 34.013109;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTA -n "RootX_M_rotateZ";
	rename -uid "D4494D05-4EF8-6FDA-EE3D-31AABEFE584E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 24.678789 17 24.678789 26 24.678789 156 24.678789
		 164 24.678789 173 24.678789 180 24.678789 187 24.678789 193 24.678789 207 24.678789
		 240 24.678789 262 24.678789 272 24.678789 279 24.678789 287 24.678789 300 24.678789;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_R_indexCurl";
	rename -uid "06F415D9-4718-03DB-C7C4-958A2C3D1389";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_R_middleCurl";
	rename -uid "C0C2ACEE-433D-B62E-58F7-539AC7D8DDBA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_R_ringCurl";
	rename -uid "9926B028-4A2D-A422-7CB3-B693527AC2A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_R_spread";
	rename -uid "833B4D8E-4713-456D-58A4-18AB8FA3B164";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_R_thumbCurl";
	rename -uid "C2017C77-4D87-8EF0-FD4D-22AC8722B856";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_L_indexCurl";
	rename -uid "0231B634-456A-A5B7-9C30-49B89F8E9419";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_L_middleCurl";
	rename -uid "9FA19598-46D4-C288-3845-F8BAA784BCF6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_L_ringCurl";
	rename -uid "7B2D8D6E-4F25-BD01-FA1D-A18E8CB8B391";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_L_spread";
	rename -uid "B86E9D01-406B-5162-744A-CCAC7F45AEFC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "Fingers_L_thumbCurl";
	rename -uid "28171288-4F9F-7530-4262-AEB3AA741E75";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 16 ".ktv[0:15]"  0 0 17 0 26 0 156 0 164 0 173 0 180 0 187 0
		 193 0 207 0 240 0 262 0 272 0 279 0 287 0 300 0;
	setAttr -s 16 ".kit[15]"  1;
	setAttr -s 16 ".kot[0:15]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 1;
	setAttr -s 16 ".kix[15]"  1;
	setAttr -s 16 ".kiy[15]"  0;
	setAttr -s 16 ".kox[0:15]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 16 ".koy[0:15]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_03_visibility";
	rename -uid "C27F787B-4F01-3212-9B28-D3B816C40452";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 160 1 265 1 280 1 300 1;
	setAttr -s 5 ".kit[0:4]"  9 9 9 1 9;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_03_translateX";
	rename -uid "6C4FB44F-4A6C-C031-3816-AABD47D16D55";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 160 0 265 0 280 0 300 0;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_03_translateY";
	rename -uid "90F51EA3-4472-9B8D-EF7C-3CB9E29DE0DE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 160 0 265 0 280 0 300 0;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_03_translateZ";
	rename -uid "FE064024-46ED-8895-DAB6-2D876A1F5CC6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 160 0 265 0 280 0 300 0;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_03_scaleX";
	rename -uid "4448EC22-4383-7EAA-D04F-0E95AFC442B5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 160 1 265 1 280 1 300 1;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_03_scaleY";
	rename -uid "7DC6D01B-41CC-B9CB-202C-35999345B6EE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 160 1 265 1 280 1 300 1;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_03_scaleZ";
	rename -uid "4A3311D0-4DD0-FCCA-FA70-2CAA56A82082";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 160 1 265 1 280 1 300 1;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_03_rotateX";
	rename -uid "CA63F745-478C-8639-088E-B5913C0220ED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 22 60 23.691766386032608 160 23.691766386032608
		 185 16.317890592983236 195 18.403480469686173 220 20.747366177760199 265 20.732525501208272
		 280 24.060614454204895 300 22;
	setAttr -s 9 ".kit[7:8]"  1 18;
	setAttr -s 9 ".kot[7:8]"  1 18;
	setAttr -s 9 ".kix[7:8]"  1 1;
	setAttr -s 9 ".kiy[7:8]"  0 0;
	setAttr -s 9 ".kox[7:8]"  1 1;
	setAttr -s 9 ".koy[7:8]"  0 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_03_rotateY";
	rename -uid "25F19313-410F-7D4B-796C-13A0B5929C95";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 160 0 265 0 280 0 300 0;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_03_rotateZ";
	rename -uid "28B9A283-43A9-E502-7278-E0898A8D8847";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 160 0 265 0 280 0 300 0;
	setAttr -s 5 ".kit[3:4]"  1 18;
	setAttr -s 5 ".kot[3:4]"  1 18;
	setAttr -s 5 ".kix[3:4]"  1 1;
	setAttr -s 5 ".kiy[3:4]"  0 0;
	setAttr -s 5 ".kox[3:4]"  1 1;
	setAttr -s 5 ".koy[3:4]"  0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_02_visibility";
	rename -uid "0805F77D-4514-5F66-AD12-A7986DB60C5F";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 1 275 1;
	setAttr -s 2 ".kit[0:1]"  9 1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_02_translateX";
	rename -uid "C1B0695C-4635-4929-DB20-3DB3CF77BC55";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 0 275 0;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_02_translateY";
	rename -uid "7C54D3F5-4AAA-DE20-97B0-48803C7170D2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 -5.5208247000000004 275 -5.5208247000000004;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_02_translateZ";
	rename -uid "7E8561C4-483B-971F-97FD-2E867D67BA1D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 0 275 0;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_02_scaleX";
	rename -uid "4535D084-4289-6DE4-0950-EE8FC2AE2494";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 1 275 1;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_02_scaleY";
	rename -uid "D651B9A5-4B46-7026-4734-F492934E8475";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 1 275 1;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_02_scaleZ";
	rename -uid "5396055B-4F75-F435-33C3-1CA192B855E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 1 275 1;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_02_rotateX";
	rename -uid "2737B98C-47C9-C641-366E-5C833CAA0A1D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 -3.4829804000000002 275 -3.4829804000000002;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_02_rotateY";
	rename -uid "4D4FBAA0-42C8-13F5-6AB2-3688B1662336";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 -0.85164340999999999 275 -0.85164340999999999;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_02_rotateZ";
	rename -uid "C32BADD8-4F53-AB9A-8D71-268473CD110B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  110 -23.824384 275 -23.824384;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  1;
	setAttr -s 2 ".kiy[1]"  0;
	setAttr -s 2 ".kox[1]"  1;
	setAttr -s 2 ".koy[1]"  0;
createNode animCurveTA -n "ZL_zt_book01_R_rotateX";
	rename -uid "6DCB2DAC-4C99-E408-6643-0A9500111828";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "ZL_zt_book01_R_rotateY";
	rename -uid "3D382A0B-4E57-98BB-2B97-5484D6A7248E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "ZL_zt_book01_R_rotateZ";
	rename -uid "CFDE69CB-47ED-A6EE-CB0A-48BD3A70FA15";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 20;
createNode animCurveTU -n "ZL_zt_book01_R_visibility";
	rename -uid "A83FE2C8-4C7A-5371-06E6-B9BFA5B36A8B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "ZL_zt_book01_R_translateX";
	rename -uid "109A647A-41B5-0588-9732-438A0B25C9CD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "ZL_zt_book01_R_translateY";
	rename -uid "D9D622B1-4900-A2E7-95BA-40A042BA3FA4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "ZL_zt_book01_R_translateZ";
	rename -uid "A1D032DF-41A2-CF2D-E0D9-B598CE60AB84";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "ZL_zt_book01_R_scaleX";
	rename -uid "865590AF-4B16-C38B-0B0B-5F89D8F31B63";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "ZL_zt_book01_R_scaleY";
	rename -uid "FA85985D-49B4-3D12-FF61-569773527CC6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "ZL_zt_book01_R_scaleZ";
	rename -uid "321F7745-4E2D-AC1B-5C85-C9A2A1B1F71B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTL -n "bar01_translateY";
	rename -uid "9D3C1A06-4593-A8C5-81CA-AAB1B41CB998";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  48 0.65228032999999996 58 0 276 0 297 0.65;
	setAttr -s 4 ".kit[1:3]"  1 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[1:3]"  1 1 1;
	setAttr -s 4 ".kiy[1:3]"  0 0 0;
	setAttr -s 4 ".kox[0:3]"  0.92885243258432648 1 1 1;
	setAttr -s 4 ".koy[0:3]"  -0.37044994058871061 0 0 0;
createNode animCurveTL -n "barL09_translateY";
	rename -uid "3587B77F-446B-085B-B396-A4A8ECF345E4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  27 0 30 0.72086550999999999 34 0 186 0 189 0.72086550999999999
		 193 0;
	setAttr -s 6 ".kit[2:5]"  1 18 18 18;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 18;
	setAttr -s 6 ".kix[2:5]"  1 1 1 1;
	setAttr -s 6 ".kiy[2:5]"  0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTL -n "barR09_translateY";
	rename -uid "109887B1-4A62-46C8-0DD4-C7A857435588";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  28 0 31 0.72231153999999997 35 0 187 0 190 0.72231153999999997
		 194 0;
	setAttr -s 6 ".kit[2:5]"  1 18 18 18;
	setAttr -s 6 ".kot[0:5]"  1 18 18 18 18 18;
	setAttr -s 6 ".kix[2:5]"  1 1 1 1;
	setAttr -s 6 ".kiy[2:5]"  0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode displayLayer -n "face_ctrl";
	rename -uid "D9E2EB5F-4C7E-078E-1B9F-66A2E9C0DDB1";
	setAttr ".v" no;
	setAttr ".do" 1;
createNode displayLayer -n "swim_ctrl";
	rename -uid "C99F5548-461C-8451-D5BD-969B078AFFA1";
	setAttr ".do" 2;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_05_visibility";
	rename -uid "D5BD64F2-4A41-837A-5DAE-E08428236EDC";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_05_scaleZ";
	rename -uid "DCED8B83-4DF2-9CAF-D342-6E97E8C67C68";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 1;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_05_scaleY";
	rename -uid "4F8C1863-4137-0549-4BF9-40B73BF5BE82";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 1;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_05_scaleX";
	rename -uid "B8D2A98B-4EC8-EFEC-0097-84B36AB6440D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 1;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_05_rotateZ";
	rename -uid "3EA5C04F-45E7-6CCD-B87F-E4934AEE8867";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_05_rotateY";
	rename -uid "0E75A417-40B6-A60C-674D-29851C8CBA56";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_05_rotateX";
	rename -uid "3264AAE9-42DF-1705-BB58-148535E11FDE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_05_translateZ";
	rename -uid "04BA81DF-4990-CAF1-ACF4-DCBA95AE88E3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_05_translateY";
	rename -uid "D063B884-4B7C-2511-5A49-99BA85E74B78";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_05_translateX";
	rename -uid "38D0357D-48AC-67A7-D2B0-9686279240AB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  110 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_root_rotateX";
	rename -uid "AA5190BF-4933-7798-BFAD-91BAC2305BBC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  0 0.5986110229905437 48 -4.668998278401193
		 77 5.9682120833230199 112 -3.3777431768130399 148 -2.5829857035708548 175 -5.5785761720338378
		 191 0.98565427668102212 208 -2.6874754489842441 235 1.8756488798558535 275 -2.149396916197134
		 300 0.5986110229905437;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 9 9 1 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 9 9 1 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 0.99983275568411412 0.99905719627130929 
		0.99375979927111724 1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 -0.018288265667104824 0.043413345626781487 
		-0.1115412988656163 0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 0.99983275568411412 0.99905719627130929 
		0.99375980110777806 1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 -0.018288265667104824 0.043413345626781487 
		-0.11154128250217103 0 0 0 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_root_rotateY";
	rename -uid "AF8A2EDE-467B-EB3B-2350-8C9A62E1C70F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  0 257 63 258.10427131410933 92 254.98845632688742
		 118 246.66645386871755 145 244.77315832496689 175 250.28911374417717 204 253.85674500758307
		 260 255.24483202210899 300 257;
	setAttr -s 9 ".kit[0:8]"  9 18 1 18 18 18 18 18 
		9;
	setAttr -s 9 ".kot[0:8]"  9 18 1 18 18 18 18 18 
		9;
	setAttr -s 9 ".kix[2:8]"  0.99073344635692873 0.99494622838116209 
		1 0.99676653948381233 0.9995343718749089 0.99985307750620211 0.99973617694310768;
	setAttr -s 9 ".kiy[2:8]"  -0.13582061062196188 -0.10040917602540284 
		0 0.080352136035488089 0.030512938905184916 0.017141277705483109 0.02296903374500369;
	setAttr -s 9 ".kox[2:8]"  0.99073344556858944 0.9949462283811622 
		1 0.99676653948381233 0.99953437187490879 0.99985307750620211 0.99973617694310768;
	setAttr -s 9 ".koy[2:8]"  -0.13582061637244408 -0.10040917602540284 
		0 0.080352136035488089 0.030512938905184913 0.017141277705483109 0.02296903374500369;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_root_rotateZ";
	rename -uid "16A48B4D-4C24-863E-23F3-D8843C6F0279";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  0 -1.6008258004603912 48 3.9500321668494522
		 78 -7.148821878544557 112 3.9146098134452729 148 0.82913604157882459 175 7.4057524821220344
		 191 -1.1467363756385731 208 2.5538730494257185 235 -2.6426859514701788 275 1.0945544782350245
		 300 -1.6008258004603912;
	setAttr -s 11 ".kit[0:10]"  1 18 18 18 18 1 1 18 
		18 18 18;
	setAttr -s 11 ".kot[0:10]"  1 18 18 18 18 1 1 18 
		18 18 18;
	setAttr -s 11 ".kix[0:10]"  1 1 1 1 1 0.99998742418473252 0.99945869748737282 
		1 1 1 1;
	setAttr -s 11 ".kiy[0:10]"  0 0 0 0 0 0.0050151243637249626 0.032898510860588162 
		0 0 0 0;
	setAttr -s 11 ".kox[0:10]"  1 1 1 1 1 0.99998742418703968 0.99945869744548743 
		1 1 1 1;
	setAttr -s 11 ".koy[0:10]"  0 0 0 0 0 0.0050151239037367814 0.03289851213306702 
		0 0 0 0;
createNode animCurveTL -n "barR03_translateY";
	rename -uid "7F837EDD-4FD2-A889-720B-EAA51022264C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 25 1 35 0 241 0 252 1 300 1;
	setAttr -s 6 ".kit[2:5]"  1 18 18 18;
	setAttr -s 6 ".kot[2:5]"  1 18 18 18;
	setAttr -s 6 ".kix[2:5]"  1 1 1 1;
	setAttr -s 6 ".kiy[2:5]"  0 0 0 0;
	setAttr -s 6 ".kox[2:5]"  1 1 1 1;
	setAttr -s 6 ".koy[2:5]"  0 0 0 0;
createNode animCurveTL -n "barL03_translateY";
	rename -uid "A8F342ED-4B38-1B95-FC07-4DBD7AE503B0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 25 1 35 0 241 0 252 1;
	setAttr -s 5 ".kit[2:4]"  1 18 18;
	setAttr -s 5 ".kot[2:4]"  1 18 18;
	setAttr -s 5 ".kix[2:4]"  1 1 1;
	setAttr -s 5 ".kiy[2:4]"  0 0 0;
	setAttr -s 5 ".kox[2:4]"  1 1 1;
	setAttr -s 5 ".koy[2:4]"  0 0 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_01_translateX";
	rename -uid "BC63003B-4ED5-FD46-60F9-6AA7FC29CD02";
	setAttr ".tan" 1;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 0 45 0.35577861293399771 68 -1.3136387134870384
		 103 -8.3434924879132932 151 -9.3617554145864581 280 -0.25709450360396069 300 0;
	setAttr -s 7 ".kit[3:6]"  18 1 1 1;
	setAttr -s 7 ".kot[3:6]"  18 1 1 1;
	setAttr -s 7 ".kix[0:6]"  0.92763667458280197 1 0.36070351799363376 
		0.46397799157426556 1 0.76088280994127433 0.99362682336867092;
	setAttr -s 7 ".kiy[0:6]"  0.37348386841865155 0 -0.93268053057143652 
		-0.8858467267731539 0 0.64888931994283172 0.11271972268544714;
	setAttr -s 7 ".kox[0:6]"  0.92763664536912616 1 0.36070346993887403 
		0.46397799157426561 1 0.76088274581827153 0.99362681858623347;
	setAttr -s 7 ".koy[0:6]"  0.37348394097780713 0 -0.93268054915606335 
		-0.88584672677315379 0 0.64888939513298238 0.11271976484273008;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_01_translateY";
	rename -uid "F608F4A7-49F9-A393-41CE-71AC99B6CDCD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 11 ".ktv[0:10]"  0 -3 20 -3.9548073938945265 41 -3.2287320976848011
		 81 -3.4093713343675485 151 -1.132355348316088 181 -6.4628511372893946 201 -1.6293891662834126
		 226 -5.8749118480766933 253 -2.3278417405334126 281 -4.8240953472562182 300 -3;
	setAttr -s 11 ".kit[4:10]"  9 18 18 18 1 18 18;
	setAttr -s 11 ".kot[4:10]"  9 18 18 18 1 18 18;
	setAttr -s 11 ".kix[8:10]"  1 1 1;
	setAttr -s 11 ".kiy[8:10]"  0 0 0;
	setAttr -s 11 ".kox[8:10]"  1 1 1;
	setAttr -s 11 ".koy[8:10]"  0 0 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_01_translateZ";
	rename -uid "18B9ED70-451F-4248-83D1-2AAF8EDFB6B0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 44 0.13122490935228703 103 1.4954949361089325
		 151 1.7776641808496878 280 0.085862524511216565 300 0;
	setAttr -s 6 ".kit[3:5]"  1 1 18;
	setAttr -s 6 ".kot[3:5]"  1 1 18;
	setAttr -s 6 ".kix[3:5]"  1 0.96093719005089018 1;
	setAttr -s 6 ".kiy[3:5]"  0 -0.27676653839851956 0;
	setAttr -s 6 ".kox[3:5]"  1 0.96093719718665083 1;
	setAttr -s 6 ".koy[3:5]"  0 -0.27676651362306082 0;
createNode displayLayer -n "box";
	rename -uid "0B3A9715-44AE-0BDE-821F-13B78AFD1360";
	setAttr ".do" 3;
createNode reference -n "cam_grRN";
	rename -uid "626EBA67-4AAB-93CE-A0FA-3BAA72705229";
	setAttr ".ed" -type "dataReferenceEdits" 
		"cam_grRN"
		"cam_grRN" 0
		"cam_grRN" 22
		2 "|cam_gr:cam_gr_L" "translate" " -type \"double3\" 595.65927452833886946 632.12783031464709893 580.55629459398255676"
		
		2 "|cam_gr:cam_gr_L" "rotate" " -type \"double3\" -35.00000000000001421 45 0"
		
		2 "|cam_gr:cam_gr_L" "rotateOrder" " 0"
		2 "|cam_gr:cam_gr_L" "scale" " -type \"double3\" 1 1 1"
		2 "|cam_gr:cam_gr_L" "shear" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_L" "rotatePivot" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_L" "rotatePivotTranslate" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_L" "scalePivot" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_L" "scalePivotTranslate" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_L" "rotateAxis" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_L|cam_gr:cam_gr_LShape" "orthographicWidth" " 257.76563678799595891"
		
		2 "|cam_gr:cam_gr_R" "translate" " -type \"double3\" -631.67342920840656006 568.09195517286411814 607.95248857736987702"
		
		2 "|cam_gr:cam_gr_R" "rotate" " -type \"double3\" -35.00000000000001421 -45 0"
		
		2 "|cam_gr:cam_gr_R" "rotateOrder" " 0"
		2 "|cam_gr:cam_gr_R" "scale" " -type \"double3\" 1 1 1"
		2 "|cam_gr:cam_gr_R" "shear" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_R" "rotatePivot" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_R" "rotatePivotTranslate" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_R" "scalePivot" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_R" "scalePivotTranslate" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_R" "rotateAxis" " -type \"double3\" 0 0 0"
		2 "|cam_gr:cam_gr_R|cam_gr:cam_gr_RShape" "orthographicWidth" " 686.7171886734254258";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode animCurveTA -n "ZL_zt_book01_L_rotateX";
	rename -uid "A73F937A-46CD-1F8D-7292-F089C78B3A57";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "ZL_zt_book01_L_rotateY";
	rename -uid "FD25FB55-44BD-A7DD-6C5F-3DB52ED41BEC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTA -n "ZL_zt_book01_L_rotateZ";
	rename -uid "FBB2C942-4595-E38A-233A-FBBBE49A228B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 -20;
createNode animCurveTU -n "ZL_zt_book01_L_visibility";
	rename -uid "16E3C878-410C-C6DD-05E7-6383DA27DD3B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "ZL_zt_book01_L_translateX";
	rename -uid "8D700BC8-483E-25EA-812F-6B9A99079A22";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "ZL_zt_book01_L_translateY";
	rename -uid "519BDB49-42DA-4479-A3A3-D6B6A4E0E807";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTL -n "ZL_zt_book01_L_translateZ";
	rename -uid "EF0D22FF-4B28-89EC-9AF9-C18B0FF2A942";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 0;
createNode animCurveTU -n "ZL_zt_book01_L_scaleX";
	rename -uid "31F64715-4949-0F73-ED92-DB9AD41ABD21";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "ZL_zt_book01_L_scaleY";
	rename -uid "BB0622B0-45E3-FE59-01D7-5886E086C9F7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "ZL_zt_book01_L_scaleZ";
	rename -uid "B965364F-422C-E559-05A6-289832D6D8EB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  0 1;
createNode animCurveTU -n "IKLeg_R_visibility";
	rename -uid "DF662018-4C4F-11A9-BF31-D9ABDE97BB39";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 55 1 73 1 115 1 193 1 300 1;
	setAttr -s 6 ".kit[0:5]"  9 1 9 9 9 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_scaleX";
	rename -uid "9FA66075-4AA4-78F9-0B98-31ADDF39DCEF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 55 1 73 1 115 1 193 1 300 1;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_scaleY";
	rename -uid "A2E7C5EE-4CC3-4F21-4473-2CB4884F0AC7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 55 1 73 1 115 1 193 1 300 1;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_scaleZ";
	rename -uid "B012BF18-48CE-F7CB-1AE2-CFA66924773D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 55 1 73 1 115 1 193 1 300 1;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_swivel";
	rename -uid "DC292CA2-4997-DFA4-D312-CF8EC5F64B1F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 55 0 73 0 115 0 193 0 300 0;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_roll";
	rename -uid "FA74DACB-4431-5AA7-DA09-86B87F80797D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 55 0 73 0 115 0 193 0 300 0;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_rollAngle";
	rename -uid "9C385F79-4DF4-32D2-B04B-39BB19F99B76";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 25 55 25 73 25 115 25 193 25 300 25;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_stretchy";
	rename -uid "18EE915C-4EE0-1BE7-3D75-3F91BBFD7BCD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 55 0 73 0 115 0 193 0 300 0;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_antiPop";
	rename -uid "AAFC89C0-47C3-E486-F232-E1B8CD84A57E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 55 0 73 0 115 0 193 0 300 0;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_Lenght1";
	rename -uid "E16C73E6-4029-6DC7-988F-CE949D5D9A29";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 55 1 73 1 115 1 193 1 300 1;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_Lenght2";
	rename -uid "C3653A06-4647-7340-65C3-17B882F30F6A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 1 55 1 73 1 115 1 193 1 300 1;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_Fatness1";
	rename -uid "19F5B006-41D5-7D57-A28F-8C9D14B6A09F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 55 0 73 0 115 0 193 0 300 0;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_Fatness2";
	rename -uid "54818595-4C25-FEFF-505B-E0B0275EC3C9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 0 55 0 73 0 115 0 193 0 300 0;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_R_volume";
	rename -uid "C545FF3D-4D35-34F8-5E57-CCA82FC8AEAF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  0 10 55 10 73 10 115 10 193 10 300 10;
	setAttr -s 6 ".kit[1:5]"  1 18 18 18 1;
	setAttr -s 6 ".kot[0:5]"  1 1 18 18 18 1;
	setAttr -s 6 ".kix[1:5]"  1 1 1 1 1;
	setAttr -s 6 ".kiy[1:5]"  0 0 0 0 0;
	setAttr -s 6 ".kox[0:5]"  1 1 1 1 1 1;
	setAttr -s 6 ".koy[0:5]"  0 0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_visibility";
	rename -uid "1CF5E7F6-494B-C707-C120-DEB0B833E841";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 164 1 193 1 240 1 300 1;
	setAttr -s 5 ".kot[0:4]"  5 5 5 5 5;
createNode animCurveTU -n "IKLeg_L_scaleX";
	rename -uid "8989BFA9-4D02-9C83-54BB-96A8D9F6D17C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 164 1 193 1 240 1 300 1;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_scaleY";
	rename -uid "7A5F113B-42D5-65E0-4F6E-2688D46EAA1F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 164 1 193 1 240 1 300 1;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_scaleZ";
	rename -uid "672F88B6-4F07-1640-3523-3EB002778A46";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 164 1 193 1 240 1 300 1;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_swivel";
	rename -uid "36ED6B3A-4BD7-E256-9B67-F1A2EA8C7E04";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 164 0 193 0 240 0 300 0;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_roll";
	rename -uid "19453651-4D20-032B-478F-AE9EFEBB0949";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 164 0 193 0 240 0 300 0;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_rollAngle";
	rename -uid "68A62848-45D9-4E7B-3BB8-1E8BD9580F98";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 25 164 25 193 25 240 25 300 25;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_stretchy";
	rename -uid "D276D13B-45AA-8077-C92F-65B7FE21FAA2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 164 0 193 0 240 0 300 0;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_antiPop";
	rename -uid "348FA806-4E27-2534-9754-588B0269F725";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 164 0 193 0 240 0 300 0;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_Lenght1";
	rename -uid "39D31A65-4B63-B0D9-0763-8FA991690916";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 164 1 193 1 240 1 300 1;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_Lenght2";
	rename -uid "8C183BFC-4CF2-2166-221B-FE93AE2CEAFE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 1 164 1 193 1 240 1 300 1;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_Fatness1";
	rename -uid "B8CAE9AE-4D24-A794-3A1B-6CADD84075CE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 164 0 193 0 240 0 300 0;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_Fatness2";
	rename -uid "12876100-4A66-B1C0-7B7D-95A1A83501D4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 0 164 0 193 0 240 0 300 0;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "IKLeg_L_volume";
	rename -uid "CA34647C-4090-4C88-3F54-2B87BE8351F3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 5 ".ktv[0:4]"  0 10 164 10 193 10 240 10 300 10;
	setAttr -s 5 ".kot[0:4]"  1 18 18 18 18;
	setAttr -s 5 ".kox[0:4]"  1 1 1 1 1;
	setAttr -s 5 ".koy[0:4]"  0 0 0 0 0;
createNode animCurveTU -n "FKIKLeg_R_FKIKBlend";
	rename -uid "68604F10-43C3-6F4E-EA2C-248F4BD6490B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 10 17 10 26 10 156 10 173 10 180 10 187 10
		 193 10 207 10 240 10 262 10 272 10 279 10 287 10 300 10;
	setAttr -s 15 ".kit[14]"  1;
	setAttr -s 15 ".kot[0:14]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
	setAttr -s 15 ".kox[0:14]"  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	setAttr -s 15 ".koy[0:14]"  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
createNode animCurveTU -n "FKIKLeg_R_FKVis";
	rename -uid "4927826E-4F51-E8E5-1DCE-49B0840E95FA";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[0:14]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
createNode animCurveTU -n "FKIKLeg_R_IKVis";
	rename -uid "F88E268E-40D4-483C-0729-D4B6001DDDFB";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  0 1 17 1 26 1 156 1 173 1 180 1 187 1 193 1
		 207 1 240 1 262 1 272 1 279 1 287 1 300 1;
	setAttr -s 15 ".kit[0:14]"  9 9 9 9 9 9 9 9 
		9 9 9 9 9 9 1;
	setAttr -s 15 ".kix[14]"  1;
	setAttr -s 15 ".kiy[14]"  0;
createNode animCurveTL -n "barL07_translateY";
	rename -uid "E9432B4D-4902-41DF-43DD-FABFDB403728";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 53 0.5 166 0.5 186 0 226 0 241 0.4610576735398238
		 256 1;
createNode animCurveTL -n "barR07_translateY";
	rename -uid "41D628C3-4491-5223-46D3-1486C185425F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  0 1 53 0.5 166 0.5 186 0 226 0 241 0.4610576735398238
		 256 1;
createNode animCurveTL -n "bar13_translateY";
	rename -uid "D3CF9A67-49B5-351D-E2CA-9ABBB1037B1D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 9 ".ktv[0:8]"  170 0 181 0.95204482000000001 196 0 235 0
		 240 0.062646019303745817 243 0.1 249 0.56997264452455954 282 0.56997264452455954
		 293 0;
createNode animCurveTL -n "bar10_translateY";
	rename -uid "1F5589DC-4E4F-670C-92DD-D194A03E5D65";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  198 0 210 0.23436886000000001 226 0.56914743999999995
		 235 0.56914743999999995 240 0 261 0;
createNode animCurveTL -n "bar14_translateY";
	rename -uid "FF7FA1F4-4AD9-DF78-DBA6-169962AACD54";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 7 ".ktv[0:6]"  160 0 170 0.45296175 176 0.38340457999999999
		 191 0.53368917000000005 234 0.65209495079758806 240 0.022032642013527004 263 0;
createNode animCurveTL -n "ZL_gr_hd_bj_coconut01_Circle04_2_translateX";
	rename -uid "4B974FBD-4BA4-5DDF-9DDF-1DBA0126B536";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  158 0 169 0 180 0 187 0 193 -0.1857894619299662
		 213 -5.1160108447991917 227 -1.6785804255358201 233 -1.6117506386521796 240 -1.5257953103473336
		 249 -3.8403889633953034 256 1.0126997558177793 264 1.7993469734914942 270 1.8194471915431125
		 276 0 282 0;
	setAttr -s 15 ".kit[6:14]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 15 ".kot[6:14]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 15 ".kix[6:14]"  1 1 1 1 0.11228258571123551 0.95742924421566689 
		1 1 1;
	setAttr -s 15 ".kiy[6:14]"  0 0 0 0 0.99367631598322759 0.28866804866596651 
		0 0 0;
	setAttr -s 15 ".kox[6:14]"  1 1 1 1 0.11228258571123551 0.95742924421566689 
		1 1 1;
	setAttr -s 15 ".koy[6:14]"  0 0 0 0 0.99367631598322759 0.28866804866596657 
		0 0 0;
createNode animCurveTL -n "ZL_gr_hd_bj_coconut01_Circle04_2_translateY";
	rename -uid "29F6263F-4CCE-00D2-F516-4BB48BC99BDC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 15 ".ktv[0:14]"  158 0 169 0 180 0 187 0 193 0 213 0 227 0
		 233 -0.18607264805724544 240 1.1471877510381889 249 4.8132606910751896 256 4.8801788756127396
		 264 3.147414913171982 270 0.61840750274930745 276 0 282 0;
	setAttr -s 15 ".kit[5:14]"  1 1 1 1 18 18 18 18 
		18 18;
	setAttr -s 15 ".kot[5:14]"  1 1 1 1 18 18 18 18 
		18 18;
	setAttr -s 15 ".kix[5:14]"  0.93176631565740042 0.93176631565740042 
		0.93176631565740042 1 0.75804402523522729 1 0.10885000145574843 0.12607435899065469 
		1 1;
	setAttr -s 15 ".kiy[5:14]"  0.36305858068118074 0.36305858068118074 
		0.36305858068118074 0 0.65220338530643507 0 -0.99405818601482454 -0.99202079413946542 
		0 0;
	setAttr -s 15 ".kox[5:14]"  0.93176631565740031 0.93176631565740031 
		0.93176631565740031 1 0.75804402523522718 1 0.10885000145574843 0.12607435899065469 
		1 1;
	setAttr -s 15 ".koy[5:14]"  0.36305858068118119 0.36305858068118119 
		0.36305858068118119 0 0.65220338530643496 0 -0.99405818601482454 -0.99202079413946542 
		0 0;
createNode animCurveTL -n "ZL_gr_hd_bj_coconut01_Circle04_2_translateZ";
	rename -uid "4D54688F-4DBF-B3DD-F123-498B702285E9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  158 0 169 0 180 0 193 0 213 1.6814903629020597
		 227 -0.19140270300808959 233 0.12865828326959536 240 -0.047090559334650339 249 0.20565435815078398
		 256 0.81292468789518013 264 1.9745717302114545 270 0 276 0 282 0;
	setAttr -s 14 ".kit[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kot[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kix[5:13]"  1 1 1 0.52702809095920722 0.2720016230817936 
		1 1 1 1;
	setAttr -s 14 ".kiy[5:13]"  0 0 0 0.84984786364377796 0.96229679259616674 
		0 0 0 0;
	setAttr -s 14 ".kox[5:13]"  1 1 1 0.52702809095920722 0.2720016230817936 
		1 1 1 1;
	setAttr -s 14 ".koy[5:13]"  0 0 0 0.84984786364377807 0.96229679259616674 
		0 0 0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_coconut01_Circle04_2_visibility";
	rename -uid "862DB696-40D4-E12A-A5DE-0D9BB9782214";
	setAttr ".tan" 5;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  158 1 169 1 180 1 193 1 213 1 227 1 233 1
		 240 1 249 1 256 1 264 1 276 1 282 1;
	setAttr -s 13 ".kit[0:12]"  9 9 9 9 9 1 1 9 
		9 9 9 9 9;
	setAttr -s 13 ".kix[5:12]"  1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[5:12]"  0 0 0 0 0 0 0 0;
createNode animCurveTA -n "ZL_gr_hd_bj_coconut01_Circle04_2_rotateX";
	rename -uid "23FF748D-497F-F3E5-46BC-8DB2216165E8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  158 0 169 0 180 0 193 0 213 0 227 0 233 0.95288801907744025
		 240 0 249 0 256 0 264 0 270 -0.49395902320708507 276 -10.632724577283154 282 0;
	setAttr -s 14 ".kit[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kot[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kix[5:13]"  1 1 1 1 1 1 0.99174183940551763 1 1;
	setAttr -s 14 ".kiy[5:13]"  0 0 0 0 0 0 -0.12825023965888141 0 0;
	setAttr -s 14 ".kox[5:13]"  1 1 1 1 1 1 0.99174183940551763 1 1;
	setAttr -s 14 ".koy[5:13]"  0 0 0 0 0 0 -0.12825023965888141 0 0;
createNode animCurveTA -n "ZL_gr_hd_bj_coconut01_Circle04_2_rotateY";
	rename -uid "FB43CBF2-454E-324F-01D7-37A1978333A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  158 0 169 0 180 0 193 0 213 0 227 5.3233271695671149
		 233 8.01137347269872 240 4.6937007353608902 249 -4.5956326306925774 256 7.7894433086112631
		 264 0 270 4.9398846189219201 276 0.86472064347233213 282 0;
	setAttr -s 14 ".kit[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kot[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kix[5:13]"  1 1 0.92441796872696003 1 1 1 1 0.97754987484764289 
		1;
	setAttr -s 14 ".kiy[5:13]"  0 0 -0.38138093698390463 0 0 0 0 -0.21070415796883937 
		0;
	setAttr -s 14 ".kox[5:13]"  1 1 0.92441796872696014 1 1 1 1 0.97754987484764289 
		1;
	setAttr -s 14 ".koy[5:13]"  0 0 -0.38138093698390463 0 0 0 0 -0.21070415796883937 
		0;
createNode animCurveTA -n "ZL_gr_hd_bj_coconut01_Circle04_2_rotateZ";
	rename -uid "2AC4B6AC-42CA-E466-A485-8397729EF69E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 14 ".ktv[0:13]"  158 0 169 0 180 0 193 0 213 0 227 0 233 6.8055692405107466
		 240 16.551960175561415 249 -15.267317713869401 256 -24.248428358851108 264 -5.5976464652938329
		 270 -12.287540686308807 276 -0.16233271146970144 282 0;
	setAttr -s 14 ".kit[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kot[5:13]"  1 1 18 18 18 18 18 18 
		18;
	setAttr -s 14 ".kix[5:13]"  1 1 1 0.59946573964808691 1 1 1 0.99909815576170025 
		1;
	setAttr -s 14 ".kiy[5:13]"  0 0 0 -0.8004004166591695 0 0 0 0.042460277360955215 
		0;
	setAttr -s 14 ".kox[5:13]"  1 1 1 0.59946573964808691 1 1 1 0.99909815576170025 
		1;
	setAttr -s 14 ".koy[5:13]"  0 0 0 -0.8004004166591695 0 0 0 0.042460277360955215 
		0;
createNode animCurveTU -n "ZL_gr_hd_bj_coconut01_Circle04_2_scaleX";
	rename -uid "D937F90D-4643-C921-CF78-8E9FBA478F4F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  158 1 169 1 180 1 193 1 213 1 227 1 233 1
		 240 1 249 1 256 1 264 1 276 1 282 1;
	setAttr -s 13 ".kit[5:12]"  1 1 18 18 18 18 18 18;
	setAttr -s 13 ".kot[5:12]"  1 1 18 18 18 18 18 18;
	setAttr -s 13 ".kix[5:12]"  1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[5:12]"  0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[5:12]"  1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[5:12]"  0 0 0 0 0 0 0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_coconut01_Circle04_2_scaleY";
	rename -uid "2BDA4C11-47FD-BDE5-B70C-6FAE76F03E18";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  158 1 169 1 180 1 193 1 213 1 227 1 233 1
		 240 1 249 1 256 1 264 1 276 1 282 1;
	setAttr -s 13 ".kit[5:12]"  1 1 18 18 18 18 18 18;
	setAttr -s 13 ".kot[5:12]"  1 1 18 18 18 18 18 18;
	setAttr -s 13 ".kix[5:12]"  1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[5:12]"  0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[5:12]"  1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[5:12]"  0 0 0 0 0 0 0 0;
createNode animCurveTU -n "ZL_gr_hd_bj_coconut01_Circle04_2_scaleZ";
	rename -uid "6C807FD4-42BD-505D-8260-439CA247A946";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 13 ".ktv[0:12]"  158 1 169 1 180 1 193 1 213 1 227 1 233 1
		 240 1 249 1 256 1 264 1 276 1 282 1;
	setAttr -s 13 ".kit[5:12]"  1 1 18 18 18 18 18 18;
	setAttr -s 13 ".kot[5:12]"  1 1 18 18 18 18 18 18;
	setAttr -s 13 ".kix[5:12]"  1 1 1 1 1 1 1 1;
	setAttr -s 13 ".kiy[5:12]"  0 0 0 0 0 0 0 0;
	setAttr -s 13 ".kox[5:12]"  1 1 1 1 1 1 1 1;
	setAttr -s 13 ".koy[5:12]"  0 0 0 0 0 0 0 0;
createNode animCurveTL -n "barR06_translateY";
	rename -uid "C1069DFA-427E-70BE-A2FB-30AED56A29DE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  86 0 96 0.5 160 0.5 190 0;
	setAttr -s 4 ".kit[1:3]"  1 18 18;
	setAttr -s 4 ".kot[0:3]"  1 18 18 18;
	setAttr -s 4 ".kix[1:3]"  1 1 1;
	setAttr -s 4 ".kiy[1:3]"  0 0 0;
	setAttr -s 4 ".kox[0:3]"  1 1 1 1;
	setAttr -s 4 ".koy[0:3]"  0 0 0 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_04_rotateX";
	rename -uid "1AAD96ED-45AE-0421-682D-DE89614555BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 6 ".ktv[0:5]"  160 32 180 36.593528229146486 210 36.593528229146486
		 230 39.712278384008727 255 39.712278384008727 275 32;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_04_rotateY";
	rename -uid "54DEEBFD-4359-2CB1-2048-A789C61483D6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 0 210 0 255 0;
createNode animCurveTA -n "ZL_gr_hd_bj_swimring01_Circle_04_rotateZ";
	rename -uid "23EDBA60-415E-3C25-7750-9591787E9286";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 0 210 0 255 0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_04_visibility";
	rename -uid "F51A38E7-4F44-FE72-9D30-1AA7DE1AFED9";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 1 210 1 255 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_04_translateX";
	rename -uid "37A34DD0-4110-BA59-A5F8-C7B836F62055";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 0 210 0 255 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_04_translateY";
	rename -uid "4E3B4B61-451F-1F92-1FB7-24A2BBD391FC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 0 210 0 255 0;
createNode animCurveTL -n "ZL_gr_hd_bj_swimring01_Circle_04_translateZ";
	rename -uid "358D6E57-4EC2-25D9-BD77-AFAFC75FFA88";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 0 210 0 255 0;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_04_scaleX";
	rename -uid "2DB40484-4A8E-070B-F711-CD92BECD72B4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 1 210 1 255 1;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_04_scaleY";
	rename -uid "7B9047C6-4156-5D75-7EEE-B7A885CF93A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 1 210 1 255 1;
createNode animCurveTU -n "ZL_gr_hd_bj_swimring01_Circle_04_scaleZ";
	rename -uid "E3066040-461B-1921-8C2F-CB9982A2795D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  160 1 210 1 255 1;
createNode animCurveTU -n "IKArm_L_visibility";
	rename -uid "B735F15C-4C0A-F0A6-2D96-B19278612566";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "IKArm_L_scaleX";
	rename -uid "6E6AF59C-4CFB-03FE-3055-79838EA70AD6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 1;
createNode animCurveTU -n "IKArm_L_scaleY";
	rename -uid "1C1F5C05-40B0-D32F-6409-D098BE89967B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 1;
createNode animCurveTU -n "IKArm_L_scaleZ";
	rename -uid "5EA2DB31-4459-C150-7ACA-3CB0716679BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 1;
createNode animCurveTU -n "IKArm_L_follow";
	rename -uid "DF0E3BFC-458C-5D46-1208-1EBF8B7F8C6C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 0;
createNode animCurveTU -n "IKArm_L_stretchy";
	rename -uid "F958408D-47EE-E1E3-3111-A48F64218D3E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 0;
createNode animCurveTU -n "IKArm_L_antiPop";
	rename -uid "7BA2BD83-4E41-DEC2-810D-C3B7669F5C02";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 0;
createNode animCurveTU -n "IKArm_L_Lenght1";
	rename -uid "545C7B5E-45B6-41DC-88B3-23A8DC35ECDF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 1;
createNode animCurveTU -n "IKArm_L_Lenght2";
	rename -uid "D2ECCD2C-48BE-C8EB-0693-9DB19FA7570D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 1;
createNode animCurveTU -n "IKArm_L_Fatness1";
	rename -uid "1BD9F973-466E-AC76-207E-C99B7DBF0F89";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 0;
createNode animCurveTU -n "IKArm_L_Fatness2";
	rename -uid "92588A2E-4EA4-EC51-625E-F88F5E8C7369";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 0;
createNode animCurveTU -n "IKArm_L_volume";
	rename -uid "DFC25B2E-4752-BA1E-1B24-D3AD0032844C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  94 10;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 300;
	setAttr -av -k on ".unw" 300;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rm";
	setAttr -k on ".lm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -k on ".hom";
	setAttr -k on ".hodm";
	setAttr -k on ".xry";
	setAttr -k on ".jxr";
	setAttr -k on ".sslt";
	setAttr -k on ".cbr";
	setAttr -k on ".bbr";
	setAttr -av -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac";
	setAttr -av -k on ".hwi";
	setAttr -k on ".csvd";
	setAttr -av -k on ".ta";
	setAttr -av -k on ".tq";
	setAttr -k on ".ts";
	setAttr -av -k on ".etmr";
	setAttr -av -k on ".tmr";
	setAttr -av -k on ".aoon";
	setAttr -av -k on ".aoam";
	setAttr -av -k on ".aora";
	setAttr -k on ".aofr";
	setAttr -av -k on ".aosm";
	setAttr -av -k on ".hff";
	setAttr -av -k on ".hfd";
	setAttr -av -k on ".hfs";
	setAttr -av -k on ".hfe";
	setAttr -av ".hfc";
	setAttr -av -k on ".hfcr";
	setAttr -av -k on ".hfcg";
	setAttr -av -k on ".hfcb";
	setAttr -av -k on ".hfa";
	setAttr -av -k on ".mbe";
	setAttr -k on ".mbt";
	setAttr -av -k on ".mbsof";
	setAttr -k on ".mbsc";
	setAttr -k on ".mbc";
	setAttr -k on ".mbfa";
	setAttr -k on ".mbftb";
	setAttr -k on ".mbftg";
	setAttr -k on ".mbftr";
	setAttr -k on ".mbfta";
	setAttr -k on ".mbfe";
	setAttr -k on ".mbme";
	setAttr -k on ".mbcsx";
	setAttr -k on ".mbcsy";
	setAttr -k on ".mbasx";
	setAttr -k on ".mbasy";
	setAttr -av -k on ".blen";
	setAttr -k on ".blth";
	setAttr -k on ".blfr";
	setAttr -k on ".blfa";
	setAttr -av -k on ".blat";
	setAttr -av -k on ".msaa" yes;
	setAttr -av -k on ".aasc";
	setAttr -k on ".aasq";
	setAttr -k on ".laa";
	setAttr -k on ".fprt" yes;
	setAttr -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 16 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 19 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 13 ".u";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 9 ".r";
select -ne :defaultTextureList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 10 ".tx";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".ai_override";
	setAttr -k on ".ai_surface_shader";
	setAttr -cb on ".ai_surface_shaderr";
	setAttr -cb on ".ai_surface_shaderg";
	setAttr -cb on ".ai_surface_shaderb";
	setAttr -k on ".ai_volume_shader";
	setAttr -cb on ".ai_volume_shaderr";
	setAttr -cb on ".ai_volume_shaderg";
	setAttr -cb on ".ai_volume_shaderb";
lockNode -l 0 -lu 1;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".ai_override";
	setAttr -k on ".ai_surface_shader";
	setAttr -cb on ".ai_surface_shaderr";
	setAttr -cb on ".ai_surface_shaderg";
	setAttr -cb on ".ai_surface_shaderb";
	setAttr -k on ".ai_volume_shader";
	setAttr -cb on ".ai_volume_shaderr";
	setAttr -cb on ".ai_volume_shaderg";
	setAttr -cb on ".ai_volume_shaderb";
lockNode -l 0 -lu 1;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -cb on ".macc";
	setAttr -av -cb on ".macd";
	setAttr -av -cb on ".macq";
	setAttr -av -k on ".mcfr" 30;
	setAttr -cb on ".ifg";
	setAttr -av -k on ".clip";
	setAttr -av -k on ".edm";
	setAttr -av -k on ".edl";
	setAttr -av -cb on ".ren" -type "string" "arnold";
	setAttr -av -k on ".esr";
	setAttr -av -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".exrc";
	setAttr -av -k on ".expt";
	setAttr -av -cb on ".an";
	setAttr -cb on ".ar";
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -av -cb on ".me";
	setAttr -cb on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep";
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -av -cb on ".pff";
	setAttr -av -cb on ".peie";
	setAttr -av -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -av -k on ".comp";
	setAttr -av -k on ".cth";
	setAttr -av -k on ".soll";
	setAttr -av -cb on ".sosl";
	setAttr -av -k on ".rd";
	setAttr -av -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -av -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -av -k on ".mm";
	setAttr -av -k on ".npu";
	setAttr -av -k on ".itf";
	setAttr -av -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -av -k on ".uf";
	setAttr -av -k on ".oi";
	setAttr -av -k on ".rut";
	setAttr -av -k on ".mot";
	setAttr -av -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -av -k on ".mbso";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -av -k on ".pfb";
	setAttr -av -k on ".pram";
	setAttr -av -k on ".poam";
	setAttr -av -k on ".prlm";
	setAttr -av -k on ".polm";
	setAttr -av -cb on ".prm";
	setAttr -av -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -av -k on ".ubc";
	setAttr -av -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -av -k on ".udbx";
	setAttr -av -k on ".smc";
	setAttr -av -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -av -k on ".tlwd";
	setAttr -av -k on ".tlht";
	setAttr -av -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -av -cb on ".ope";
	setAttr -av -cb on ".oppf";
	setAttr -av -k on ".rcp";
	setAttr -av -k on ".icp";
	setAttr -av -k on ".ocp";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".wsn" -type "string" "ACEScg";
select -ne :hardwareRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k off -cb on ".ctrs" 256;
	setAttr -av -k off -cb on ".btrs" 512;
	setAttr -av -k off -cb on ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off -cb on ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -av -k on ".hwcc";
	setAttr -av -k on ".hwdp";
	setAttr -av -k on ".hwql";
	setAttr -av -k on ".hwfr" 30;
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
select -ne :ikSystem;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".gsn";
	setAttr -k on ".gsv";
	setAttr -s 3 ".sol";
connectAttr "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.ctx" "ZL_gr_hd_bj_coconut01_rigRN.phl[1]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.cty" "ZL_gr_hd_bj_coconut01_rigRN.phl[2]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.ctz" "ZL_gr_hd_bj_coconut01_rigRN.phl[3]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.cry" "ZL_gr_hd_bj_coconut01_rigRN.phl[4]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.crx" "ZL_gr_hd_bj_coconut01_rigRN.phl[5]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.crz" "ZL_gr_hd_bj_coconut01_rigRN.phl[6]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_rigRN.phl[7]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.cro"
		;
connectAttr "ZL_gr_hd_bj_coconut01_rigRN.phl[8]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.cpim"
		;
connectAttr "ZL_gr_hd_bj_coconut01_rigRN.phl[9]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.crp"
		;
connectAttr "ZL_gr_hd_bj_coconut01_rigRN.phl[10]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.crt"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_translateX.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[11]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_translateY.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[12]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_translateZ.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[13]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_rotateX.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[14]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_rotateY.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[15]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_rotateZ.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[16]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_scaleX.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[17]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_scaleY.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[18]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_scaleZ.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[19]"
		;
connectAttr "ZL_gr_hd_bj_coconut01_Circle04_2_visibility.o" "ZL_gr_hd_bj_coconut01_rigRN.phl[20]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_root_rotateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[1]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_root_rotateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[2]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_root_rotateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[3]"
		;
connectAttr "swim_ctrl.di" "ZL_gr_hd_bj_swimring01_rigRN.phl[4]";
connectAttr "ZL_gr_hd_bj_swimring01_rigRN.phl[5]" "world_ctrl_parentConstraint1.tg[0].tt"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_01_translateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[6]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_01_translateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[7]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_01_translateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[8]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_rigRN.phl[9]" "world_ctrl_parentConstraint1.tg[0].trp"
		;
connectAttr "ZL_gr_hd_bj_swimring01_rigRN.phl[10]" "world_ctrl_parentConstraint1.tg[0].trt"
		;
connectAttr "ZL_gr_hd_bj_swimring01_rigRN.phl[11]" "world_ctrl_parentConstraint1.tg[0].tr"
		;
connectAttr "ZL_gr_hd_bj_swimring01_rigRN.phl[12]" "world_ctrl_parentConstraint1.tg[0].tro"
		;
connectAttr "ZL_gr_hd_bj_swimring01_rigRN.phl[13]" "world_ctrl_parentConstraint1.tg[0].ts"
		;
connectAttr "ZL_gr_hd_bj_swimring01_rigRN.phl[14]" "world_ctrl_parentConstraint1.tg[0].tpm"
		;
connectAttr "swim_ctrl.di" "ZL_gr_hd_bj_swimring01_rigRN.phl[15]";
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_translateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[16]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_translateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[17]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_translateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[18]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_rotateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[19]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_rotateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[20]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_rotateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[21]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_scaleX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[22]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_scaleY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[23]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_scaleZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[24]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_03_visibility.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[25]"
		;
connectAttr "swim_ctrl.di" "ZL_gr_hd_bj_swimring01_rigRN.phl[26]";
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_translateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[27]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_translateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[28]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_translateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[29]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_rotateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[30]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_rotateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[31]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_rotateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[32]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_scaleX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[33]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_scaleY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[34]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_scaleZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[35]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_04_visibility.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[36]"
		;
connectAttr "swim_ctrl.di" "ZL_gr_hd_bj_swimring01_rigRN.phl[37]";
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_translateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[38]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_translateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[39]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_translateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[40]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_rotateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[41]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_rotateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[42]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_rotateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[43]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_scaleX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[44]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_scaleY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[45]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_scaleZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[46]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_05_visibility.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[47]"
		;
connectAttr "swim_ctrl.di" "ZL_gr_hd_bj_swimring01_rigRN.phl[48]";
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_translateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[49]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_translateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[50]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_translateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[51]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_rotateX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[52]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_rotateY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[53]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_rotateZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[54]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_scaleX.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[55]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_scaleY.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[56]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_scaleZ.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[57]"
		;
connectAttr "ZL_gr_hd_bj_swimring01_Circle_02_visibility.o" "ZL_gr_hd_bj_swimring01_rigRN.phl[58]"
		;
connectAttr "swim_ctrl.di" "ZL_gr_hd_bj_swimring01_rigRN.phl[59]";
connectAttr "world_ctrl_parentConstraint1.ctx" "ZL_avatar_2022_rigRN.phl[1]";
connectAttr "world_ctrl_parentConstraint1.cty" "ZL_avatar_2022_rigRN.phl[2]";
connectAttr "world_ctrl_parentConstraint1.ctz" "ZL_avatar_2022_rigRN.phl[3]";
connectAttr "world_ctrl_parentConstraint1.crx" "ZL_avatar_2022_rigRN.phl[4]";
connectAttr "world_ctrl_parentConstraint1.cry" "ZL_avatar_2022_rigRN.phl[5]";
connectAttr "world_ctrl_parentConstraint1.crz" "ZL_avatar_2022_rigRN.phl[6]";
connectAttr "ZL_avatar_2022_rigRN.phl[7]" "world_ctrl_parentConstraint1.cro";
connectAttr "ZL_avatar_2022_rigRN.phl[8]" "world_ctrl_parentConstraint1.cpim";
connectAttr "ZL_avatar_2022_rigRN.phl[9]" "world_ctrl_parentConstraint1.crp";
connectAttr "ZL_avatar_2022_rigRN.phl[10]" "world_ctrl_parentConstraint1.crt";
connectAttr "FKNeck_M_scaleX.o" "ZL_avatar_2022_rigRN.phl[11]";
connectAttr "FKNeck_M_scaleY.o" "ZL_avatar_2022_rigRN.phl[12]";
connectAttr "FKNeck_M_scaleZ.o" "ZL_avatar_2022_rigRN.phl[13]";
connectAttr "FKNeck_M_visibility.o" "ZL_avatar_2022_rigRN.phl[14]";
connectAttr "FKNeck_M_translateX.o" "ZL_avatar_2022_rigRN.phl[15]";
connectAttr "FKNeck_M_translateY.o" "ZL_avatar_2022_rigRN.phl[16]";
connectAttr "FKNeck_M_translateZ.o" "ZL_avatar_2022_rigRN.phl[17]";
connectAttr "FKNeck_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[18]";
connectAttr "FKNeck_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[19]";
connectAttr "FKNeck_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[20]";
connectAttr "FKHead_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[21]";
connectAttr "FKHead_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[22]";
connectAttr "FKHead_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[23]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[24]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[25]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[26]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[27]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[28]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[29]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[30]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[31]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[32]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[33]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[34]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[35]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[36]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[37]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[38]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[39]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[40]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[41]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[42]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[43]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[44]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[45]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[46]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[47]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[48]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[49]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[50]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[51]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[52]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[53]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[54]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[55]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[56]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[57]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[58]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[59]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[60]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[61]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[62]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[63]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[64]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[65]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[66]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[67]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[68]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[69]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[70]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[71]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[72]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[73]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[74]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[75]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[76]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[77]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[78]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[79]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[80]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[81]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[82]";
connectAttr "FKEars_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[83]";
connectAttr "FKEars_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[84]";
connectAttr "FKEars_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[85]";
connectAttr "FKEars_L_visibility.o" "ZL_avatar_2022_rigRN.phl[86]";
connectAttr "FKEars_L_translateX.o" "ZL_avatar_2022_rigRN.phl[87]";
connectAttr "FKEars_L_translateY.o" "ZL_avatar_2022_rigRN.phl[88]";
connectAttr "FKEars_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[89]";
connectAttr "FKEars_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[90]";
connectAttr "FKEars_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[91]";
connectAttr "FKEars_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[92]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[93]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[94]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[95]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[96]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[97]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[98]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[99]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[100]";
connectAttr "face_ctrl.di" "ZL_avatar_2022_rigRN.phl[101]";
connectAttr "FKScapula_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[102]";
connectAttr "FKScapula_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[103]";
connectAttr "FKScapula_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[104]";
connectAttr "FKScapula_R_visibility.o" "ZL_avatar_2022_rigRN.phl[105]";
connectAttr "FKScapula_R_translateX.o" "ZL_avatar_2022_rigRN.phl[106]";
connectAttr "FKScapula_R_translateY.o" "ZL_avatar_2022_rigRN.phl[107]";
connectAttr "FKScapula_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[108]";
connectAttr "FKScapula_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[109]";
connectAttr "FKScapula_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[110]";
connectAttr "FKScapula_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[111]";
connectAttr "FKScapula_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[112]";
connectAttr "FKScapula_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[113]";
connectAttr "FKScapula_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[114]";
connectAttr "FKScapula_L_visibility.o" "ZL_avatar_2022_rigRN.phl[115]";
connectAttr "FKScapula_L_translateX.o" "ZL_avatar_2022_rigRN.phl[116]";
connectAttr "FKScapula_L_translateY.o" "ZL_avatar_2022_rigRN.phl[117]";
connectAttr "FKScapula_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[118]";
connectAttr "FKScapula_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[119]";
connectAttr "FKScapula_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[120]";
connectAttr "FKScapula_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[121]";
connectAttr "FKMiddleFinger1_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[122]";
connectAttr "FKMiddleFinger1_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[123]";
connectAttr "FKMiddleFinger1_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[124]";
connectAttr "FKMiddleFinger1_R_visibility.o" "ZL_avatar_2022_rigRN.phl[125]";
connectAttr "FKMiddleFinger1_R_translateX.o" "ZL_avatar_2022_rigRN.phl[126]";
connectAttr "FKMiddleFinger1_R_translateY.o" "ZL_avatar_2022_rigRN.phl[127]";
connectAttr "FKMiddleFinger1_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[128]";
connectAttr "FKMiddleFinger1_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[129]";
connectAttr "FKMiddleFinger1_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[130]";
connectAttr "FKMiddleFinger1_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[131]";
connectAttr "FKMiddleFinger2_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[132]";
connectAttr "FKMiddleFinger2_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[133]";
connectAttr "FKMiddleFinger2_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[134]";
connectAttr "FKMiddleFinger2_R_visibility.o" "ZL_avatar_2022_rigRN.phl[135]";
connectAttr "FKMiddleFinger2_R_translateX.o" "ZL_avatar_2022_rigRN.phl[136]";
connectAttr "FKMiddleFinger2_R_translateY.o" "ZL_avatar_2022_rigRN.phl[137]";
connectAttr "FKMiddleFinger2_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[138]";
connectAttr "FKMiddleFinger2_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[139]";
connectAttr "FKMiddleFinger2_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[140]";
connectAttr "FKMiddleFinger2_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[141]";
connectAttr "FKMiddleFinger3_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[142]";
connectAttr "FKMiddleFinger3_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[143]";
connectAttr "FKMiddleFinger3_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[144]";
connectAttr "FKMiddleFinger3_R_visibility.o" "ZL_avatar_2022_rigRN.phl[145]";
connectAttr "FKMiddleFinger3_R_translateX.o" "ZL_avatar_2022_rigRN.phl[146]";
connectAttr "FKMiddleFinger3_R_translateY.o" "ZL_avatar_2022_rigRN.phl[147]";
connectAttr "FKMiddleFinger3_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[148]";
connectAttr "FKMiddleFinger3_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[149]";
connectAttr "FKMiddleFinger3_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[150]";
connectAttr "FKMiddleFinger3_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[151]";
connectAttr "FKThumbFinger1_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[152]";
connectAttr "FKThumbFinger1_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[153]";
connectAttr "FKThumbFinger1_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[154]";
connectAttr "FKThumbFinger1_R_visibility.o" "ZL_avatar_2022_rigRN.phl[155]";
connectAttr "FKThumbFinger1_R_translateX.o" "ZL_avatar_2022_rigRN.phl[156]";
connectAttr "FKThumbFinger1_R_translateY.o" "ZL_avatar_2022_rigRN.phl[157]";
connectAttr "FKThumbFinger1_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[158]";
connectAttr "FKThumbFinger1_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[159]";
connectAttr "FKThumbFinger1_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[160]";
connectAttr "FKThumbFinger1_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[161]";
connectAttr "FKThumbFinger2_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[162]";
connectAttr "FKThumbFinger2_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[163]";
connectAttr "FKThumbFinger2_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[164]";
connectAttr "FKThumbFinger2_R_visibility.o" "ZL_avatar_2022_rigRN.phl[165]";
connectAttr "FKThumbFinger2_R_translateX.o" "ZL_avatar_2022_rigRN.phl[166]";
connectAttr "FKThumbFinger2_R_translateY.o" "ZL_avatar_2022_rigRN.phl[167]";
connectAttr "FKThumbFinger2_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[168]";
connectAttr "FKThumbFinger2_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[169]";
connectAttr "FKThumbFinger2_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[170]";
connectAttr "FKThumbFinger2_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[171]";
connectAttr "FKThumbFinger3_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[172]";
connectAttr "FKThumbFinger3_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[173]";
connectAttr "FKThumbFinger3_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[174]";
connectAttr "FKThumbFinger3_R_visibility.o" "ZL_avatar_2022_rigRN.phl[175]";
connectAttr "FKThumbFinger3_R_translateX.o" "ZL_avatar_2022_rigRN.phl[176]";
connectAttr "FKThumbFinger3_R_translateY.o" "ZL_avatar_2022_rigRN.phl[177]";
connectAttr "FKThumbFinger3_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[178]";
connectAttr "FKThumbFinger3_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[179]";
connectAttr "FKThumbFinger3_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[180]";
connectAttr "FKThumbFinger3_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[181]";
connectAttr "FKIndexFinger1_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[182]";
connectAttr "FKIndexFinger1_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[183]";
connectAttr "FKIndexFinger1_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[184]";
connectAttr "FKIndexFinger1_R_visibility.o" "ZL_avatar_2022_rigRN.phl[185]";
connectAttr "FKIndexFinger1_R_translateX.o" "ZL_avatar_2022_rigRN.phl[186]";
connectAttr "FKIndexFinger1_R_translateY.o" "ZL_avatar_2022_rigRN.phl[187]";
connectAttr "FKIndexFinger1_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[188]";
connectAttr "FKIndexFinger1_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[189]";
connectAttr "FKIndexFinger1_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[190]";
connectAttr "FKIndexFinger1_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[191]";
connectAttr "FKIndexFinger2_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[192]";
connectAttr "FKIndexFinger2_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[193]";
connectAttr "FKIndexFinger2_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[194]";
connectAttr "FKIndexFinger2_R_visibility.o" "ZL_avatar_2022_rigRN.phl[195]";
connectAttr "FKIndexFinger2_R_translateX.o" "ZL_avatar_2022_rigRN.phl[196]";
connectAttr "FKIndexFinger2_R_translateY.o" "ZL_avatar_2022_rigRN.phl[197]";
connectAttr "FKIndexFinger2_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[198]";
connectAttr "FKIndexFinger2_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[199]";
connectAttr "FKIndexFinger2_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[200]";
connectAttr "FKIndexFinger2_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[201]";
connectAttr "FKIndexFinger3_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[202]";
connectAttr "FKIndexFinger3_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[203]";
connectAttr "FKIndexFinger3_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[204]";
connectAttr "FKIndexFinger3_R_visibility.o" "ZL_avatar_2022_rigRN.phl[205]";
connectAttr "FKIndexFinger3_R_translateX.o" "ZL_avatar_2022_rigRN.phl[206]";
connectAttr "FKIndexFinger3_R_translateY.o" "ZL_avatar_2022_rigRN.phl[207]";
connectAttr "FKIndexFinger3_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[208]";
connectAttr "FKIndexFinger3_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[209]";
connectAttr "FKIndexFinger3_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[210]";
connectAttr "FKIndexFinger3_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[211]";
connectAttr "FKRingFinger1_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[212]";
connectAttr "FKRingFinger1_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[213]";
connectAttr "FKRingFinger1_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[214]";
connectAttr "FKRingFinger1_R_visibility.o" "ZL_avatar_2022_rigRN.phl[215]";
connectAttr "FKRingFinger1_R_translateX.o" "ZL_avatar_2022_rigRN.phl[216]";
connectAttr "FKRingFinger1_R_translateY.o" "ZL_avatar_2022_rigRN.phl[217]";
connectAttr "FKRingFinger1_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[218]";
connectAttr "FKRingFinger1_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[219]";
connectAttr "FKRingFinger1_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[220]";
connectAttr "FKRingFinger1_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[221]";
connectAttr "FKRingFinger2_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[222]";
connectAttr "FKRingFinger2_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[223]";
connectAttr "FKRingFinger2_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[224]";
connectAttr "FKRingFinger2_R_visibility.o" "ZL_avatar_2022_rigRN.phl[225]";
connectAttr "FKRingFinger2_R_translateX.o" "ZL_avatar_2022_rigRN.phl[226]";
connectAttr "FKRingFinger2_R_translateY.o" "ZL_avatar_2022_rigRN.phl[227]";
connectAttr "FKRingFinger2_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[228]";
connectAttr "FKRingFinger2_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[229]";
connectAttr "FKRingFinger2_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[230]";
connectAttr "FKRingFinger2_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[231]";
connectAttr "FKRingFinger3_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[232]";
connectAttr "FKRingFinger3_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[233]";
connectAttr "FKRingFinger3_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[234]";
connectAttr "FKRingFinger3_R_visibility.o" "ZL_avatar_2022_rigRN.phl[235]";
connectAttr "FKRingFinger3_R_translateX.o" "ZL_avatar_2022_rigRN.phl[236]";
connectAttr "FKRingFinger3_R_translateY.o" "ZL_avatar_2022_rigRN.phl[237]";
connectAttr "FKRingFinger3_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[238]";
connectAttr "FKRingFinger3_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[239]";
connectAttr "FKRingFinger3_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[240]";
connectAttr "FKRingFinger3_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[241]";
connectAttr "FKRoot_M_scaleX.o" "ZL_avatar_2022_rigRN.phl[242]";
connectAttr "FKRoot_M_scaleY.o" "ZL_avatar_2022_rigRN.phl[243]";
connectAttr "FKRoot_M_scaleZ.o" "ZL_avatar_2022_rigRN.phl[244]";
connectAttr "FKRoot_M_visibility.o" "ZL_avatar_2022_rigRN.phl[245]";
connectAttr "FKRoot_M_translateX.o" "ZL_avatar_2022_rigRN.phl[246]";
connectAttr "FKRoot_M_translateY.o" "ZL_avatar_2022_rigRN.phl[247]";
connectAttr "FKRoot_M_translateZ.o" "ZL_avatar_2022_rigRN.phl[248]";
connectAttr "FKRoot_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[249]";
connectAttr "FKRoot_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[250]";
connectAttr "FKRoot_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[251]";
connectAttr "FKSpine1_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[252]";
connectAttr "FKSpine1_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[253]";
connectAttr "FKSpine1_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[254]";
connectAttr "FKSpine2_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[255]";
connectAttr "FKSpine2_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[256]";
connectAttr "FKSpine2_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[257]";
connectAttr "FKChest_M_scaleX.o" "ZL_avatar_2022_rigRN.phl[258]";
connectAttr "FKChest_M_scaleY.o" "ZL_avatar_2022_rigRN.phl[259]";
connectAttr "FKChest_M_scaleZ.o" "ZL_avatar_2022_rigRN.phl[260]";
connectAttr "FKChest_M_visibility.o" "ZL_avatar_2022_rigRN.phl[261]";
connectAttr "FKChest_M_translateX.o" "ZL_avatar_2022_rigRN.phl[262]";
connectAttr "FKChest_M_translateY.o" "ZL_avatar_2022_rigRN.phl[263]";
connectAttr "FKChest_M_translateZ.o" "ZL_avatar_2022_rigRN.phl[264]";
connectAttr "FKChest_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[265]";
connectAttr "FKChest_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[266]";
connectAttr "FKChest_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[267]";
connectAttr "HipSwinger_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[268]";
connectAttr "HipSwinger_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[269]";
connectAttr "HipSwinger_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[270]";
connectAttr "HipSwinger_M_visibility.o" "ZL_avatar_2022_rigRN.phl[271]";
connectAttr "FKMiddleFinger1_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[272]";
connectAttr "FKMiddleFinger1_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[273]";
connectAttr "FKMiddleFinger1_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[274]";
connectAttr "FKMiddleFinger1_L_visibility.o" "ZL_avatar_2022_rigRN.phl[275]";
connectAttr "FKMiddleFinger1_L_translateX.o" "ZL_avatar_2022_rigRN.phl[276]";
connectAttr "FKMiddleFinger1_L_translateY.o" "ZL_avatar_2022_rigRN.phl[277]";
connectAttr "FKMiddleFinger1_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[278]";
connectAttr "FKMiddleFinger1_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[279]";
connectAttr "FKMiddleFinger1_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[280]";
connectAttr "FKMiddleFinger1_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[281]";
connectAttr "FKMiddleFinger2_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[282]";
connectAttr "FKMiddleFinger2_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[283]";
connectAttr "FKMiddleFinger2_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[284]";
connectAttr "FKMiddleFinger2_L_visibility.o" "ZL_avatar_2022_rigRN.phl[285]";
connectAttr "FKMiddleFinger2_L_translateX.o" "ZL_avatar_2022_rigRN.phl[286]";
connectAttr "FKMiddleFinger2_L_translateY.o" "ZL_avatar_2022_rigRN.phl[287]";
connectAttr "FKMiddleFinger2_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[288]";
connectAttr "FKMiddleFinger2_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[289]";
connectAttr "FKMiddleFinger2_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[290]";
connectAttr "FKMiddleFinger2_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[291]";
connectAttr "FKMiddleFinger3_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[292]";
connectAttr "FKMiddleFinger3_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[293]";
connectAttr "FKMiddleFinger3_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[294]";
connectAttr "FKMiddleFinger3_L_visibility.o" "ZL_avatar_2022_rigRN.phl[295]";
connectAttr "FKMiddleFinger3_L_translateX.o" "ZL_avatar_2022_rigRN.phl[296]";
connectAttr "FKMiddleFinger3_L_translateY.o" "ZL_avatar_2022_rigRN.phl[297]";
connectAttr "FKMiddleFinger3_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[298]";
connectAttr "FKMiddleFinger3_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[299]";
connectAttr "FKMiddleFinger3_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[300]";
connectAttr "FKMiddleFinger3_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[301]";
connectAttr "FKThumbFinger1_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[302]";
connectAttr "FKThumbFinger1_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[303]";
connectAttr "FKThumbFinger1_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[304]";
connectAttr "FKThumbFinger1_L_visibility.o" "ZL_avatar_2022_rigRN.phl[305]";
connectAttr "FKThumbFinger1_L_translateX.o" "ZL_avatar_2022_rigRN.phl[306]";
connectAttr "FKThumbFinger1_L_translateY.o" "ZL_avatar_2022_rigRN.phl[307]";
connectAttr "FKThumbFinger1_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[308]";
connectAttr "FKThumbFinger1_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[309]";
connectAttr "FKThumbFinger1_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[310]";
connectAttr "FKThumbFinger1_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[311]";
connectAttr "FKThumbFinger2_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[312]";
connectAttr "FKThumbFinger2_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[313]";
connectAttr "FKThumbFinger2_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[314]";
connectAttr "FKThumbFinger2_L_visibility.o" "ZL_avatar_2022_rigRN.phl[315]";
connectAttr "FKThumbFinger2_L_translateX.o" "ZL_avatar_2022_rigRN.phl[316]";
connectAttr "FKThumbFinger2_L_translateY.o" "ZL_avatar_2022_rigRN.phl[317]";
connectAttr "FKThumbFinger2_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[318]";
connectAttr "FKThumbFinger2_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[319]";
connectAttr "FKThumbFinger2_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[320]";
connectAttr "FKThumbFinger2_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[321]";
connectAttr "FKThumbFinger3_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[322]";
connectAttr "FKThumbFinger3_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[323]";
connectAttr "FKThumbFinger3_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[324]";
connectAttr "FKThumbFinger3_L_visibility.o" "ZL_avatar_2022_rigRN.phl[325]";
connectAttr "FKThumbFinger3_L_translateX.o" "ZL_avatar_2022_rigRN.phl[326]";
connectAttr "FKThumbFinger3_L_translateY.o" "ZL_avatar_2022_rigRN.phl[327]";
connectAttr "FKThumbFinger3_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[328]";
connectAttr "FKThumbFinger3_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[329]";
connectAttr "FKThumbFinger3_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[330]";
connectAttr "FKThumbFinger3_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[331]";
connectAttr "FKIndexFinger1_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[332]";
connectAttr "FKIndexFinger1_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[333]";
connectAttr "FKIndexFinger1_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[334]";
connectAttr "FKIndexFinger1_L_visibility.o" "ZL_avatar_2022_rigRN.phl[335]";
connectAttr "FKIndexFinger1_L_translateX.o" "ZL_avatar_2022_rigRN.phl[336]";
connectAttr "FKIndexFinger1_L_translateY.o" "ZL_avatar_2022_rigRN.phl[337]";
connectAttr "FKIndexFinger1_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[338]";
connectAttr "FKIndexFinger1_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[339]";
connectAttr "FKIndexFinger1_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[340]";
connectAttr "FKIndexFinger1_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[341]";
connectAttr "FKIndexFinger2_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[342]";
connectAttr "FKIndexFinger2_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[343]";
connectAttr "FKIndexFinger2_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[344]";
connectAttr "FKIndexFinger2_L_visibility.o" "ZL_avatar_2022_rigRN.phl[345]";
connectAttr "FKIndexFinger2_L_translateX.o" "ZL_avatar_2022_rigRN.phl[346]";
connectAttr "FKIndexFinger2_L_translateY.o" "ZL_avatar_2022_rigRN.phl[347]";
connectAttr "FKIndexFinger2_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[348]";
connectAttr "FKIndexFinger2_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[349]";
connectAttr "FKIndexFinger2_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[350]";
connectAttr "FKIndexFinger2_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[351]";
connectAttr "FKIndexFinger3_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[352]";
connectAttr "FKIndexFinger3_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[353]";
connectAttr "FKIndexFinger3_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[354]";
connectAttr "FKIndexFinger3_L_visibility.o" "ZL_avatar_2022_rigRN.phl[355]";
connectAttr "FKIndexFinger3_L_translateX.o" "ZL_avatar_2022_rigRN.phl[356]";
connectAttr "FKIndexFinger3_L_translateY.o" "ZL_avatar_2022_rigRN.phl[357]";
connectAttr "FKIndexFinger3_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[358]";
connectAttr "FKIndexFinger3_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[359]";
connectAttr "FKIndexFinger3_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[360]";
connectAttr "FKIndexFinger3_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[361]";
connectAttr "FKRingFinger1_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[362]";
connectAttr "FKRingFinger1_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[363]";
connectAttr "FKRingFinger1_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[364]";
connectAttr "FKRingFinger1_L_visibility.o" "ZL_avatar_2022_rigRN.phl[365]";
connectAttr "FKRingFinger1_L_translateX.o" "ZL_avatar_2022_rigRN.phl[366]";
connectAttr "FKRingFinger1_L_translateY.o" "ZL_avatar_2022_rigRN.phl[367]";
connectAttr "FKRingFinger1_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[368]";
connectAttr "FKRingFinger1_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[369]";
connectAttr "FKRingFinger1_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[370]";
connectAttr "FKRingFinger1_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[371]";
connectAttr "FKRingFinger2_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[372]";
connectAttr "FKRingFinger2_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[373]";
connectAttr "FKRingFinger2_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[374]";
connectAttr "FKRingFinger2_L_visibility.o" "ZL_avatar_2022_rigRN.phl[375]";
connectAttr "FKRingFinger2_L_translateX.o" "ZL_avatar_2022_rigRN.phl[376]";
connectAttr "FKRingFinger2_L_translateY.o" "ZL_avatar_2022_rigRN.phl[377]";
connectAttr "FKRingFinger2_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[378]";
connectAttr "FKRingFinger2_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[379]";
connectAttr "FKRingFinger2_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[380]";
connectAttr "FKRingFinger2_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[381]";
connectAttr "FKRingFinger3_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[382]";
connectAttr "FKRingFinger3_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[383]";
connectAttr "FKRingFinger3_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[384]";
connectAttr "FKRingFinger3_L_visibility.o" "ZL_avatar_2022_rigRN.phl[385]";
connectAttr "FKRingFinger3_L_translateX.o" "ZL_avatar_2022_rigRN.phl[386]";
connectAttr "FKRingFinger3_L_translateY.o" "ZL_avatar_2022_rigRN.phl[387]";
connectAttr "FKRingFinger3_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[388]";
connectAttr "FKRingFinger3_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[389]";
connectAttr "FKRingFinger3_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[390]";
connectAttr "FKRingFinger3_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[391]";
connectAttr "ZL_avatar_2022_rigRN.phl[392]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].ts"
		;
connectAttr "ZL_avatar_2022_rigRN.phl[393]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].tt"
		;
connectAttr "IKArm_R_translateX.o" "ZL_avatar_2022_rigRN.phl[394]";
connectAttr "IKArm_R_translateY.o" "ZL_avatar_2022_rigRN.phl[395]";
connectAttr "IKArm_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[396]";
connectAttr "ZL_avatar_2022_rigRN.phl[397]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].trp"
		;
connectAttr "ZL_avatar_2022_rigRN.phl[398]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].trt"
		;
connectAttr "ZL_avatar_2022_rigRN.phl[399]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].tpm"
		;
connectAttr "ZL_avatar_2022_rigRN.phl[400]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].tr"
		;
connectAttr "IKArm_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[401]";
connectAttr "IKArm_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[402]";
connectAttr "IKArm_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[403]";
connectAttr "ZL_avatar_2022_rigRN.phl[404]" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].tro"
		;
connectAttr "PoleArm_R_translateX.o" "ZL_avatar_2022_rigRN.phl[405]";
connectAttr "PoleArm_R_translateY.o" "ZL_avatar_2022_rigRN.phl[406]";
connectAttr "PoleArm_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[407]";
connectAttr "PoleArm_R_follow.o" "ZL_avatar_2022_rigRN.phl[408]";
connectAttr "PoleArm_R_lock.o" "ZL_avatar_2022_rigRN.phl[409]";
connectAttr "IKLeg_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[410]";
connectAttr "IKLeg_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[411]";
connectAttr "IKLeg_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[412]";
connectAttr "IKLeg_R_translateX.o" "ZL_avatar_2022_rigRN.phl[413]";
connectAttr "IKLeg_R_translateY.o" "ZL_avatar_2022_rigRN.phl[414]";
connectAttr "IKLeg_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[415]";
connectAttr "IKLeg_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[416]";
connectAttr "IKLeg_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[417]";
connectAttr "IKLeg_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[418]";
connectAttr "IKLeg_R_swivel.o" "ZL_avatar_2022_rigRN.phl[419]";
connectAttr "IKLeg_R_rollAngle.o" "ZL_avatar_2022_rigRN.phl[420]";
connectAttr "IKLeg_R_roll.o" "ZL_avatar_2022_rigRN.phl[421]";
connectAttr "IKLeg_R_stretchy.o" "ZL_avatar_2022_rigRN.phl[422]";
connectAttr "IKLeg_R_antiPop.o" "ZL_avatar_2022_rigRN.phl[423]";
connectAttr "IKLeg_R_Lenght1.o" "ZL_avatar_2022_rigRN.phl[424]";
connectAttr "IKLeg_R_Lenght2.o" "ZL_avatar_2022_rigRN.phl[425]";
connectAttr "IKLeg_R_Fatness1.o" "ZL_avatar_2022_rigRN.phl[426]";
connectAttr "IKLeg_R_Fatness2.o" "ZL_avatar_2022_rigRN.phl[427]";
connectAttr "IKLeg_R_volume.o" "ZL_avatar_2022_rigRN.phl[428]";
connectAttr "IKLeg_R_visibility.o" "ZL_avatar_2022_rigRN.phl[429]";
connectAttr "RollHeel_R_visibility.o" "ZL_avatar_2022_rigRN.phl[430]";
connectAttr "RollHeel_R_translateX.o" "ZL_avatar_2022_rigRN.phl[431]";
connectAttr "RollHeel_R_translateY.o" "ZL_avatar_2022_rigRN.phl[432]";
connectAttr "RollHeel_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[433]";
connectAttr "RollHeel_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[434]";
connectAttr "RollHeel_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[435]";
connectAttr "RollHeel_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[436]";
connectAttr "RollHeel_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[437]";
connectAttr "RollHeel_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[438]";
connectAttr "RollHeel_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[439]";
connectAttr "RollToesEnd_R_visibility.o" "ZL_avatar_2022_rigRN.phl[440]";
connectAttr "RollToesEnd_R_translateX.o" "ZL_avatar_2022_rigRN.phl[441]";
connectAttr "RollToesEnd_R_translateY.o" "ZL_avatar_2022_rigRN.phl[442]";
connectAttr "RollToesEnd_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[443]";
connectAttr "RollToesEnd_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[444]";
connectAttr "RollToesEnd_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[445]";
connectAttr "RollToesEnd_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[446]";
connectAttr "RollToesEnd_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[447]";
connectAttr "RollToesEnd_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[448]";
connectAttr "RollToesEnd_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[449]";
connectAttr "RollToes_R_visibility.o" "ZL_avatar_2022_rigRN.phl[450]";
connectAttr "RollToes_R_translateX.o" "ZL_avatar_2022_rigRN.phl[451]";
connectAttr "RollToes_R_translateY.o" "ZL_avatar_2022_rigRN.phl[452]";
connectAttr "RollToes_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[453]";
connectAttr "RollToes_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[454]";
connectAttr "RollToes_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[455]";
connectAttr "RollToes_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[456]";
connectAttr "RollToes_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[457]";
connectAttr "RollToes_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[458]";
connectAttr "RollToes_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[459]";
connectAttr "IKToes_R_visibility.o" "ZL_avatar_2022_rigRN.phl[460]";
connectAttr "IKToes_R_translateX.o" "ZL_avatar_2022_rigRN.phl[461]";
connectAttr "IKToes_R_translateY.o" "ZL_avatar_2022_rigRN.phl[462]";
connectAttr "IKToes_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[463]";
connectAttr "IKToes_R_scaleX.o" "ZL_avatar_2022_rigRN.phl[464]";
connectAttr "IKToes_R_scaleY.o" "ZL_avatar_2022_rigRN.phl[465]";
connectAttr "IKToes_R_scaleZ.o" "ZL_avatar_2022_rigRN.phl[466]";
connectAttr "IKToes_R_rotateX.o" "ZL_avatar_2022_rigRN.phl[467]";
connectAttr "IKToes_R_rotateY.o" "ZL_avatar_2022_rigRN.phl[468]";
connectAttr "IKToes_R_rotateZ.o" "ZL_avatar_2022_rigRN.phl[469]";
connectAttr "PoleLeg_R_translateX.o" "ZL_avatar_2022_rigRN.phl[470]";
connectAttr "PoleLeg_R_translateY.o" "ZL_avatar_2022_rigRN.phl[471]";
connectAttr "PoleLeg_R_translateZ.o" "ZL_avatar_2022_rigRN.phl[472]";
connectAttr "PoleLeg_R_follow.o" "ZL_avatar_2022_rigRN.phl[473]";
connectAttr "PoleLeg_R_lock.o" "ZL_avatar_2022_rigRN.phl[474]";
connectAttr "ZL_avatar_2022_rigRN.phl[475]" "ZL_zt_book01_root_parentConstraint1.tg[0].ts"
		;
connectAttr "IKArm_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[476]";
connectAttr "IKArm_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[477]";
connectAttr "IKArm_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[478]";
connectAttr "ZL_avatar_2022_rigRN.phl[479]" "ZL_zt_book01_root_parentConstraint1.tg[0].tt"
		;
connectAttr "IKArm_L_translateX.o" "ZL_avatar_2022_rigRN.phl[480]";
connectAttr "IKArm_L_translateY.o" "ZL_avatar_2022_rigRN.phl[481]";
connectAttr "IKArm_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[482]";
connectAttr "ZL_avatar_2022_rigRN.phl[483]" "ZL_zt_book01_root_parentConstraint1.tg[0].trp"
		;
connectAttr "ZL_avatar_2022_rigRN.phl[484]" "ZL_zt_book01_root_parentConstraint1.tg[0].trt"
		;
connectAttr "ZL_avatar_2022_rigRN.phl[485]" "ZL_zt_book01_root_parentConstraint1.tg[0].tpm"
		;
connectAttr "ZL_avatar_2022_rigRN.phl[486]" "ZL_zt_book01_root_parentConstraint1.tg[0].tr"
		;
connectAttr "IKArm_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[487]";
connectAttr "IKArm_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[488]";
connectAttr "IKArm_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[489]";
connectAttr "ZL_avatar_2022_rigRN.phl[490]" "ZL_zt_book01_root_parentConstraint1.tg[0].tro"
		;
connectAttr "IKArm_L_follow.o" "ZL_avatar_2022_rigRN.phl[491]";
connectAttr "IKArm_L_stretchy.o" "ZL_avatar_2022_rigRN.phl[492]";
connectAttr "IKArm_L_antiPop.o" "ZL_avatar_2022_rigRN.phl[493]";
connectAttr "IKArm_L_Lenght1.o" "ZL_avatar_2022_rigRN.phl[494]";
connectAttr "IKArm_L_Lenght2.o" "ZL_avatar_2022_rigRN.phl[495]";
connectAttr "IKArm_L_Fatness1.o" "ZL_avatar_2022_rigRN.phl[496]";
connectAttr "IKArm_L_Fatness2.o" "ZL_avatar_2022_rigRN.phl[497]";
connectAttr "IKArm_L_volume.o" "ZL_avatar_2022_rigRN.phl[498]";
connectAttr "IKArm_L_visibility.o" "ZL_avatar_2022_rigRN.phl[499]";
connectAttr "PoleArm_L_translateX.o" "ZL_avatar_2022_rigRN.phl[500]";
connectAttr "PoleArm_L_translateY.o" "ZL_avatar_2022_rigRN.phl[501]";
connectAttr "PoleArm_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[502]";
connectAttr "IKLeg_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[503]";
connectAttr "IKLeg_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[504]";
connectAttr "IKLeg_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[505]";
connectAttr "IKLeg_L_translateX.o" "ZL_avatar_2022_rigRN.phl[506]";
connectAttr "IKLeg_L_translateY.o" "ZL_avatar_2022_rigRN.phl[507]";
connectAttr "IKLeg_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[508]";
connectAttr "IKLeg_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[509]";
connectAttr "IKLeg_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[510]";
connectAttr "IKLeg_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[511]";
connectAttr "IKLeg_L_swivel.o" "ZL_avatar_2022_rigRN.phl[512]";
connectAttr "IKLeg_L_rollAngle.o" "ZL_avatar_2022_rigRN.phl[513]";
connectAttr "IKLeg_L_roll.o" "ZL_avatar_2022_rigRN.phl[514]";
connectAttr "IKLeg_L_stretchy.o" "ZL_avatar_2022_rigRN.phl[515]";
connectAttr "IKLeg_L_antiPop.o" "ZL_avatar_2022_rigRN.phl[516]";
connectAttr "IKLeg_L_Lenght1.o" "ZL_avatar_2022_rigRN.phl[517]";
connectAttr "IKLeg_L_Lenght2.o" "ZL_avatar_2022_rigRN.phl[518]";
connectAttr "IKLeg_L_Fatness1.o" "ZL_avatar_2022_rigRN.phl[519]";
connectAttr "IKLeg_L_Fatness2.o" "ZL_avatar_2022_rigRN.phl[520]";
connectAttr "IKLeg_L_volume.o" "ZL_avatar_2022_rigRN.phl[521]";
connectAttr "IKLeg_L_visibility.o" "ZL_avatar_2022_rigRN.phl[522]";
connectAttr "RollHeel_L_visibility.o" "ZL_avatar_2022_rigRN.phl[523]";
connectAttr "RollHeel_L_translateX.o" "ZL_avatar_2022_rigRN.phl[524]";
connectAttr "RollHeel_L_translateY.o" "ZL_avatar_2022_rigRN.phl[525]";
connectAttr "RollHeel_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[526]";
connectAttr "RollHeel_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[527]";
connectAttr "RollHeel_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[528]";
connectAttr "RollHeel_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[529]";
connectAttr "RollHeel_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[530]";
connectAttr "RollHeel_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[531]";
connectAttr "RollHeel_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[532]";
connectAttr "RollToesEnd_L_visibility.o" "ZL_avatar_2022_rigRN.phl[533]";
connectAttr "RollToesEnd_L_translateX.o" "ZL_avatar_2022_rigRN.phl[534]";
connectAttr "RollToesEnd_L_translateY.o" "ZL_avatar_2022_rigRN.phl[535]";
connectAttr "RollToesEnd_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[536]";
connectAttr "RollToesEnd_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[537]";
connectAttr "RollToesEnd_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[538]";
connectAttr "RollToesEnd_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[539]";
connectAttr "RollToesEnd_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[540]";
connectAttr "RollToesEnd_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[541]";
connectAttr "RollToesEnd_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[542]";
connectAttr "RollToes_L_visibility.o" "ZL_avatar_2022_rigRN.phl[543]";
connectAttr "RollToes_L_translateX.o" "ZL_avatar_2022_rigRN.phl[544]";
connectAttr "RollToes_L_translateY.o" "ZL_avatar_2022_rigRN.phl[545]";
connectAttr "RollToes_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[546]";
connectAttr "RollToes_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[547]";
connectAttr "RollToes_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[548]";
connectAttr "RollToes_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[549]";
connectAttr "RollToes_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[550]";
connectAttr "RollToes_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[551]";
connectAttr "RollToes_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[552]";
connectAttr "IKToes_L_visibility.o" "ZL_avatar_2022_rigRN.phl[553]";
connectAttr "IKToes_L_translateX.o" "ZL_avatar_2022_rigRN.phl[554]";
connectAttr "IKToes_L_translateY.o" "ZL_avatar_2022_rigRN.phl[555]";
connectAttr "IKToes_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[556]";
connectAttr "IKToes_L_scaleX.o" "ZL_avatar_2022_rigRN.phl[557]";
connectAttr "IKToes_L_scaleY.o" "ZL_avatar_2022_rigRN.phl[558]";
connectAttr "IKToes_L_scaleZ.o" "ZL_avatar_2022_rigRN.phl[559]";
connectAttr "IKToes_L_rotateX.o" "ZL_avatar_2022_rigRN.phl[560]";
connectAttr "IKToes_L_rotateY.o" "ZL_avatar_2022_rigRN.phl[561]";
connectAttr "IKToes_L_rotateZ.o" "ZL_avatar_2022_rigRN.phl[562]";
connectAttr "PoleLeg_L_translateX.o" "ZL_avatar_2022_rigRN.phl[563]";
connectAttr "PoleLeg_L_translateY.o" "ZL_avatar_2022_rigRN.phl[564]";
connectAttr "PoleLeg_L_translateZ.o" "ZL_avatar_2022_rigRN.phl[565]";
connectAttr "PoleLeg_L_follow.o" "ZL_avatar_2022_rigRN.phl[566]";
connectAttr "PoleLeg_L_lock.o" "ZL_avatar_2022_rigRN.phl[567]";
connectAttr "FKIKArm_R_FKIKBlend.o" "ZL_avatar_2022_rigRN.phl[568]";
connectAttr "FKIKArm_R_IKVis.o" "ZL_avatar_2022_rigRN.phl[569]";
connectAttr "FKIKArm_R_FKVis.o" "ZL_avatar_2022_rigRN.phl[570]";
connectAttr "FKIKLeg_R_FKIKBlend.o" "ZL_avatar_2022_rigRN.phl[571]";
connectAttr "FKIKLeg_R_IKVis.o" "ZL_avatar_2022_rigRN.phl[572]";
connectAttr "FKIKLeg_R_FKVis.o" "ZL_avatar_2022_rigRN.phl[573]";
connectAttr "FKIKSpine_M_FKIKBlend.o" "ZL_avatar_2022_rigRN.phl[574]";
connectAttr "FKIKSpine_M_IKVis.o" "ZL_avatar_2022_rigRN.phl[575]";
connectAttr "FKIKSpine_M_FKVis.o" "ZL_avatar_2022_rigRN.phl[576]";
connectAttr "FKIKArm_L_FKIKBlend.o" "ZL_avatar_2022_rigRN.phl[577]";
connectAttr "FKIKArm_L_IKVis.o" "ZL_avatar_2022_rigRN.phl[578]";
connectAttr "FKIKArm_L_FKVis.o" "ZL_avatar_2022_rigRN.phl[579]";
connectAttr "FKIKLeg_L_FKIKBlend.o" "ZL_avatar_2022_rigRN.phl[580]";
connectAttr "FKIKLeg_L_IKVis.o" "ZL_avatar_2022_rigRN.phl[581]";
connectAttr "FKIKLeg_L_FKVis.o" "ZL_avatar_2022_rigRN.phl[582]";
connectAttr "RootX_M_translateX.o" "ZL_avatar_2022_rigRN.phl[583]";
connectAttr "RootX_M_translateY.o" "ZL_avatar_2022_rigRN.phl[584]";
connectAttr "RootX_M_translateZ.o" "ZL_avatar_2022_rigRN.phl[585]";
connectAttr "RootX_M_rotateX.o" "ZL_avatar_2022_rigRN.phl[586]";
connectAttr "RootX_M_rotateY.o" "ZL_avatar_2022_rigRN.phl[587]";
connectAttr "RootX_M_rotateZ.o" "ZL_avatar_2022_rigRN.phl[588]";
connectAttr "RootX_M_CenterBtwFeet.o" "ZL_avatar_2022_rigRN.phl[589]";
connectAttr "RootX_M_visibility.o" "ZL_avatar_2022_rigRN.phl[590]";
connectAttr "Fingers_R_spread.o" "ZL_avatar_2022_rigRN.phl[591]";
connectAttr "Fingers_R_indexCurl.o" "ZL_avatar_2022_rigRN.phl[592]";
connectAttr "Fingers_R_middleCurl.o" "ZL_avatar_2022_rigRN.phl[593]";
connectAttr "Fingers_R_ringCurl.o" "ZL_avatar_2022_rigRN.phl[594]";
connectAttr "Fingers_R_thumbCurl.o" "ZL_avatar_2022_rigRN.phl[595]";
connectAttr "Fingers_L_spread.o" "ZL_avatar_2022_rigRN.phl[596]";
connectAttr "Fingers_L_indexCurl.o" "ZL_avatar_2022_rigRN.phl[597]";
connectAttr "Fingers_L_middleCurl.o" "ZL_avatar_2022_rigRN.phl[598]";
connectAttr "Fingers_L_ringCurl.o" "ZL_avatar_2022_rigRN.phl[599]";
connectAttr "Fingers_L_thumbCurl.o" "ZL_avatar_2022_rigRN.phl[600]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[601]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[602]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[603]";
connectAttr "bar01_translateY.o" "ZL_avatar_2022_rigRN.phl[604]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[605]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[606]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[607]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[608]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[609]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[610]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[611]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[612]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[613]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[614]";
connectAttr "barR06_translateY.o" "ZL_avatar_2022_rigRN.phl[615]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[616]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[617]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[618]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[619]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[620]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[621]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[622]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[623]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[624]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[625]";
connectAttr "bar10_translateY.o" "ZL_avatar_2022_rigRN.phl[626]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[627]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[628]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[629]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[630]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[631]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[632]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[633]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[634]";
connectAttr "bar13_translateY.o" "ZL_avatar_2022_rigRN.phl[635]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[636]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[637]";
connectAttr "bar14_translateY.o" "ZL_avatar_2022_rigRN.phl[638]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[639]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[640]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[641]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[642]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[643]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[644]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[645]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[646]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[647]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[648]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[649]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[650]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[651]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[652]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[653]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[654]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[655]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[656]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[657]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[658]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[659]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[660]";
connectAttr "barL09_translateY.o" "ZL_avatar_2022_rigRN.phl[661]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[662]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[663]";
connectAttr "barR09_translateY.o" "ZL_avatar_2022_rigRN.phl[664]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[665]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[666]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[667]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[668]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[669]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[670]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[671]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[672]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[673]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[674]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[675]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[676]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[677]";
connectAttr "barL07_translateY.o" "ZL_avatar_2022_rigRN.phl[678]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[679]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[680]";
connectAttr "barR07_translateY.o" "ZL_avatar_2022_rigRN.phl[681]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[682]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[683]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[684]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[685]";
connectAttr "barL03_translateY.o" "ZL_avatar_2022_rigRN.phl[686]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[687]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[688]";
connectAttr "barR03_translateY.o" "ZL_avatar_2022_rigRN.phl[689]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[690]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[691]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[692]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[693]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[694]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[695]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[696]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[697]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[698]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[699]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[700]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[701]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[702]";
connectAttr "box.di" "ZL_avatar_2022_rigRN.phl[703]";
connectAttr "ZL_zt_book01_root_parentConstraint1.ctx" "ZL_zt_book01_rigRN.phl[1]"
		;
connectAttr "ZL_zt_book01_root_parentConstraint1.cty" "ZL_zt_book01_rigRN.phl[2]"
		;
connectAttr "ZL_zt_book01_root_parentConstraint1.ctz" "ZL_zt_book01_rigRN.phl[3]"
		;
connectAttr "ZL_zt_book01_root_parentConstraint1.crx" "ZL_zt_book01_rigRN.phl[4]"
		;
connectAttr "ZL_zt_book01_root_parentConstraint1.cry" "ZL_zt_book01_rigRN.phl[5]"
		;
connectAttr "ZL_zt_book01_root_parentConstraint1.crz" "ZL_zt_book01_rigRN.phl[6]"
		;
connectAttr "ZL_zt_book01_rigRN.phl[7]" "ZL_zt_book01_root_parentConstraint1.cro"
		;
connectAttr "ZL_zt_book01_rigRN.phl[8]" "ZL_zt_book01_root_parentConstraint1.cpim"
		;
connectAttr "ZL_zt_book01_rigRN.phl[9]" "ZL_zt_book01_root_parentConstraint1.crp"
		;
connectAttr "ZL_zt_book01_rigRN.phl[10]" "ZL_zt_book01_root_parentConstraint1.crt"
		;
connectAttr "ZL_zt_book01_rigRN.phl[11]" "ZL_zt_book01_root_parentConstraint1.cjo"
		;
connectAttr "ZL_zt_book01_L_scaleX.o" "ZL_zt_book01_rigRN.phl[12]";
connectAttr "ZL_zt_book01_L_scaleY.o" "ZL_zt_book01_rigRN.phl[13]";
connectAttr "ZL_zt_book01_L_scaleZ.o" "ZL_zt_book01_rigRN.phl[14]";
connectAttr "ZL_zt_book01_L_rotateZ.o" "ZL_zt_book01_rigRN.phl[15]";
connectAttr "ZL_zt_book01_L_rotateX.o" "ZL_zt_book01_rigRN.phl[16]";
connectAttr "ZL_zt_book01_L_rotateY.o" "ZL_zt_book01_rigRN.phl[17]";
connectAttr "ZL_zt_book01_L_visibility.o" "ZL_zt_book01_rigRN.phl[18]";
connectAttr "ZL_zt_book01_L_translateX.o" "ZL_zt_book01_rigRN.phl[19]";
connectAttr "ZL_zt_book01_L_translateY.o" "ZL_zt_book01_rigRN.phl[20]";
connectAttr "ZL_zt_book01_L_translateZ.o" "ZL_zt_book01_rigRN.phl[21]";
connectAttr "ZL_zt_book01_R_rotateZ.o" "ZL_zt_book01_rigRN.phl[22]";
connectAttr "ZL_zt_book01_R_rotateX.o" "ZL_zt_book01_rigRN.phl[23]";
connectAttr "ZL_zt_book01_R_rotateY.o" "ZL_zt_book01_rigRN.phl[24]";
connectAttr "ZL_zt_book01_R_visibility.o" "ZL_zt_book01_rigRN.phl[25]";
connectAttr "ZL_zt_book01_R_translateX.o" "ZL_zt_book01_rigRN.phl[26]";
connectAttr "ZL_zt_book01_R_translateY.o" "ZL_zt_book01_rigRN.phl[27]";
connectAttr "ZL_zt_book01_R_translateZ.o" "ZL_zt_book01_rigRN.phl[28]";
connectAttr "ZL_zt_book01_R_scaleX.o" "ZL_zt_book01_rigRN.phl[29]";
connectAttr "ZL_zt_book01_R_scaleY.o" "ZL_zt_book01_rigRN.phl[30]";
connectAttr "ZL_zt_book01_R_scaleZ.o" "ZL_zt_book01_rigRN.phl[31]";
connectAttr "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.w0" "ZL_gr_hd_bj_coconut01_Circle_M_parentConstraint1.tg[0].tw"
		;
connectAttr "world_ctrl_parentConstraint1.w0" "world_ctrl_parentConstraint1.tg[0].tw"
		;
connectAttr "ZL_zt_book01_root_parentConstraint1.w0" "ZL_zt_book01_root_parentConstraint1.tg[0].tw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "ZL_gr_hd_bj_coconut01_rigRNfosterParent1.msg" "ZL_gr_hd_bj_coconut01_rigRN.fp"
		;
connectAttr "ZL_avatar_2022_rigRNfosterParent1.msg" "ZL_avatar_2022_rigRN.fp";
connectAttr "ZL_zt_book01_rigRNfosterParent1.msg" "ZL_zt_book01_rigRN.fp";
connectAttr "layerManager.dli[1]" "face_ctrl.id";
connectAttr "layerManager.dli[2]" "swim_ctrl.id";
connectAttr "layerManager.dli[3]" "box.id";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of ZL_gr_ts_swimring01_002.0006.ma
