/client/proc/pripeklon(pripeklon_ckey)
	if (!check_rights(R_ADMIN))	return

//	if (!pripeklon_ckey || !istext(pripeklon_ckey))	return
//	if (pripeklon_ckey in admin_datums)
//		usr << "<font color='red'>Error: pripeklon(): You can't butthurt admin ass.</font>"
//		return

	for (var/client/C in clients)
		if (C.ckey == pripeklon_ckey)
			C << 'sound/effects/pripeklon.ogg'
			world << "<span class='ooc'><span class='everyone'>OOC: <EM>[C.key]:</EM> <span class='message'>Моя жопа <b>ГОРИТ!!!</b></span></span>"
			message_admins("[key_name_admin(src)] butthurt [key_name_admin(C)] ass.")
			return
	message_admins("[key_name_admin(src)] has butthurt [pripeklon_ckey] ass.")
