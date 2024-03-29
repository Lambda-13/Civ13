/proc/possess(obj/O as obj in range(7))
	set name = "Possess Obj"
	set category = "Призрак"

	var/turf/T = get_turf(O)

	if (T)
		log_admin("[key_name(usr)] has possessed [O] ([O.type]) at ([T.x], [T.y], [T.z])")
		message_admins("[key_name(usr)] has possessed [O] ([O.type]) at ([T.x], [T.y], [T.z])", key_name(usr))
	else
		log_admin("[key_name(usr)] has possessed [O] ([O.type]) at an unknown location")
		message_admins("[key_name(usr)] has possessed [O] ([O.type]) at an unknown location", key_name(usr))

	if (!usr.control_object) //If you're not already possessing something...
		usr.name_archive = usr.real_name

	usr.loc = O
	usr.real_name = O.name
	usr.name = O.name
	usr.client.eye = O
	usr.control_object = O


/proc/release(obj/O as obj in range(7))
	set name = "Release Obj"
	set category = "Призрак"
	//usr.loc = get_turf(usr)

	if (usr.control_object && usr.name_archive) //if you have a name archived and if you are actually relassing an object
		usr.real_name = usr.name_archive
		usr.name = usr.real_name
		if (ishuman(usr))
			var/mob/living/human/H = usr
			H.name = H.get_visible_name()
//		usr.regenerate_icons() //So the name is updated properly

	usr.loc = O.loc // Appear where the object you were controlling is -- TLE
	usr.client.eye = usr
	usr.control_object = null


/proc/givetestverbs(mob/M as mob in mob_list)
	set desc = "Give this guy possess/release verbs"
	set category = "Дебаг"
	set name = "Give Possessing Verbs"
	M.verbs += /proc/possess
	M.verbs += /proc/release
