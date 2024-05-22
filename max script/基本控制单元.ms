fn baseCtrl x=(
	sel = for obj in selection collect(obj) 
	for i in sel do(
		offset = Point size:2 Box:off cross:on
		offset.name = i.name + "_offset"
		offset.transform = i.transform
		offset.wirecolor = color 224 86 86
		
		expHelp = Point size:2 Box:on cross:off 
		expHelp.name = i.name + "_exp"
		expHelp.transform  = i.transform 
		expHelp.wirecolor = color 27 177 27
		
		con = copy $baseCircle
		con.name = i.name + "_ctrl"
		con.transform  = i.transform 
		con.wirecolor = color 28 28 177
		
		i.pos.controller = Position_Constraint()
		i.pos.controller.constraints.appendTarget con 50.0
		i.rotation.controller = Orientation_Constraint()
		i.rotation.controller.constraints.appendTarget con 50.0
		
		con.parent = expHelp
		expHelp.parent = offset
		
	)
)

baseCtrl 1