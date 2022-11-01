/mob/observer/ghost/verb/moveup()
	set name = "Move Upwards"
	set category = "Призрак"
	if (z < world.maxz)
		z = z+1


/mob/observer/ghost/verb/movedown()
	set name = "Move Downwards"
	set category = "Призрак"
	if (z > 1)
		z = z-1