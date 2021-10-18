/mob/verb/on_press_spacebar()

	set category = null

	if (ishuman(src) && !src.stat)
		var/mob/living/human/H = src
		H.look_into_distance(src)
		return
	return FALSE

/*/mob/verb/on_press_spacebar/button()
	set name = "Look into distance"
	set category = "IC"*/