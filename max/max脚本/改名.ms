fn rename1 sel=(	
	for i in sel do(
		i.name = substituteString i.name "skin" "Skin"	
		--substituteString����һ�����ַ�
		--i.name = i.name + "_skin"
	)
)
rename1 selection