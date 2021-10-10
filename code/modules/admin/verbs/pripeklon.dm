/client/proc/pripeklon(pripeklon_ckey)
	if (!check_rights(R_ADMIN))	return

//	if (!pripeklon_ckey || !istext(pripeklon_ckey))	return
//	if (pripeklon_ckey in admin_datums)
//		usr << "<font color='red'>Error: pripeklon(): You can't butthurt admin ass.</font>"
//		return

	for (var/client/C in clients)
		if (C.ckey == pripeklon_ckey)
			C << 'sound/effects/pripeklon.ogg'
			world << "<big><big><big><font color='red'><b>[uppertext(pripeklon_ckey)]</b>:<b> Моя жопа <big><b>ГОРИТ!!!</b></big></font></big></big></big>"
			message_admins("[key_name_admin(src)] butthurt [key_name_admin(C)] ass.")
			return
	message_admins("[key_name_admin(src)] has butthurt [pripeklon_ckey] ass.")