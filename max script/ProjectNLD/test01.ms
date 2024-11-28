select #($'Bip001 L Finger0Nub', $'Bip001 L Finger1Nub', $'Bip001 L Finger2Nub',  $'Bip001 L Toe0Nub',
	$'Bip001 R Finger0Nub', $'Bip001 R Finger1Nub', $'Bip001 R Finger2Nub', $'Bip001 R Toe0Nub', $'Bip001 Footsteps')

freeze $
select (for obj in objects where not obj.isHidden and not obj.isFrozen collect obj)