mydummy = Dummy()
mydummy.name = "mydummy"
mydummy.pos = point3 11 42 90

select #($Bip001, $'Bip001 Pelvis', $'Bip001 Spine', $'Bip001 Spine1', $'Bip001 Spine2', $'Bip001 Spine3',
	$'Bip001 Neck', $'Bip001 L Clavicle', $'Bip001 L UpperArm', $'Bip001 L Forearm', $'Bip001 L Hand',
	$'Bip001 L Finger0', $'Bip001 R Clavicle', $'Bip001 R UpperArm', $'Bip001 R Forearm', $'Bip001 R Hand',
	$'Bip001 R Finger0', $'Bip001 Head', $'Bip001 L Thigh', $'Bip001 R Thigh', $'Bip001 L Foot', 
	$'Bip001 L Toe0', $'Bip001 L Toe01', $'Bip001 L Toe02', $'Bip001 L Calf', $'Bip001 R Calf',
	$'Bip001 R Foot', $'Bip001 R Toe0', $'Bip001 R Toe01', $'Bip001 R Toe02')
selectmore $Sphere001