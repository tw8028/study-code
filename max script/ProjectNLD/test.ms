obj = $
list_t = #()

for i = animationRange.start to animationRange.end do
(
	sliderTime = i
	append list_t obj.transform
)

obj.pos.controller = Position_XYZ()
obj.rotation.controller = Euler_XYZ()

n =1

animate on 
(
	for i = animationRange.start to animationRange.end do
	(
		sliderTime = i
		obj.transform = list_t[n]
		n = n +1
		at time i obj
	)
)
