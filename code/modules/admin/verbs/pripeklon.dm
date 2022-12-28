/client/proc/pripeklon(pripeklon_ckey)
	if (!check_rights(R_ADMIN))	return

	if (!pripeklon_ckey || !istext(pripeklon_ckey))	return
	if (pripeklon_ckey in admin_datums)
		usr << "<font color='red'>Error: pripeklon(): You can't butthurt admin ass.</font>"
		return

	for (var/client/C in clients)
		if (C.ckey == pripeklon_ckey)
			C << 'sound/effects/pripeklon.ogg'
			world << "<span class='ooc'><span class='everyone'>OOC: <EM>[C.key]:</EM> <span class='message'>Моя жопа <b>ГОРИТ!!!</b></span></span>"
			message_admins("[key_name_admin(src)] butthurt [key_name_admin(C)] ass.")
			return
	message_admins("[key_name_admin(src)] has butthurt [pripeklon_ckey] ass.")


/client/proc/forward_pp(forward_pp_ckey)
	if (!check_rights(R_ADMIN))	return

	if (!forward_pp_ckey || !istext(forward_pp_ckey))	return
	if (forward_pp_ckey in admin_datums)
		usr << "<font color='red'>Error: forward_pp(): You can't forwarding admin.</font>"
		return

	var/links = input("Принимаются http и byond протоколы.")
	if(!links)
		return

	for (var/client/C in clients)
		if (C.ckey == forward_pp_ckey)
			C << link(links)
			message_admins("[key_name_admin(src)] переадресовал [key_name_admin(C)] на \"[links]\".")
			return
	message_admins("[key_name_admin(src)] переадресовал [forward_pp_ckey] на \"[links]\".")

/client/proc/quit_pp(quit_pp_ckey)
	if (!check_rights(R_ADMIN))	return

	if (!quit_pp_ckey || !istext(quit_pp_ckey))	return
	if (quit_pp_ckey in admin_datums)
		usr << "<font color='red'>Error: quit_pp(): You can't ultrakick admin.</font>"
		return

	for (var/client/C in clients)
		if (C.ckey == quit_pp_ckey)
			message_admins("[key_name_admin(src)] закрыл игру [key_name_admin(C)].")
			winset(C, null, "command=.quit")
			return
	message_admins("[key_name_admin(src)] закрыл игру [quit_pp_ckey].")