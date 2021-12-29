var/list/sounds_cache = list()

/client/proc/play_sound(S as sound)
	set category = "Fun"
	set name = "Play Global Sound"
	if (!check_rights(R_SOUNDS))	return

	var/sound/uploaded_sound = sound(S, repeat = FALSE, wait = TRUE, channel = 777)
	uploaded_sound.priority = 250

	sounds_cache += S

	if (WWinput(src, "Are you ready?\nSong: [S]\nNow you can also play this sound using \"Play Server Sound\".", "Confirmation request", "Play", list("Play", "Cancel")) == "Cancel")
		return

	log_admin("[key_name(src)] played sound [S]")
	message_admins("[key_name_admin(src)] played sound [S]", TRUE)
	for (var/mob/M in player_list)
		if (!new_player_mob_list.Find(M) || !M.is_preference_enabled(/datum/client_preference/play_lobby_music))
			if (M.is_preference_enabled(/datum/client_preference/play_admin_midis))
				M.client << uploaded_sound

/client/proc/play_local_sound(S as sound, var/volume = 50)
	set category = "Fun"
	set name = "Play Local Sound"
	if (!check_rights(R_SOUNDS))	return

	log_admin("[key_name(src)] played a local sound [S]")
	message_admins("[key_name_admin(src)] played a local sound [S]", TRUE)
	playsound(get_turf(mob), S, volume, FALSE, FALSE)


/client/proc/play_server_sound()
	set category = "Fun"
	set name = "Play Server Sound"
	if (!check_rights(R_SOUNDS))	return

	var/list/sounds = file2list("sound/serversound_list.txt");
	sounds += "--CANCEL--"
	sounds += sounds_cache

	var/melody = input("Select a sound from the server to play", "Server sound list", "--CANCEL--") in sounds

	if (melody == "--CANCEL--")	return

	play_sound(melody)

//youtube-dl//
/client/proc/play_web_sound()
	set category = "Fun"
	set name = "Play Internet Sound"
	if (!check_rights(R_SOUNDS))	return

//	var/sound/uploaded_sound = sound(S, repeat = FALSE, wait = TRUE, channel = 777)
//	uploaded_sound.priority = 250

	var/ytdl = config.ytdl
	if (!ytdl)
		src << "<span class='boldwarning'>Youtube-dl was not configured, action unavailable</span>" //Check config.txt for the INVOKE_YOUTUBEDL value
		return

	var/web_sound_input = input("Enter content URL (supported sites only, leave blank to stop playing)", "Play Internet Sound via youtube-dl") as text|null
	if(istext(web_sound_input))
		var/web_sound_url = ""
//		var/stop_web_sounds = FALSE
		var/list/music_extra_data = list()
		if(length(web_sound_input))

			web_sound_input = trim(web_sound_input)
			if(findtext(web_sound_input, ":") && !findtext(web_sound_input, GLOB.is_http_protocol))
				src << "<span class='boldwarning'>Non-http(s) URIs are not allowed.</span>"
				src << "<span class='warning'>For youtube-dl shortcuts like ytsearch: please use the appropriate full url from the website.</span>"
				return
			var/shell_scrubbed_input = shell_url_scrub(web_sound_input)
			var/list/output = world.shelleo(ytdl + " --geo-bypass --format \"bestaudio\[ext=mp3]/best\[ext=mp4]\[height<=360]/bestaudio\[ext=m4a]/bestaudio\[ext=aac]\" --dump-single-json --no-playlist -- \"[shell_scrubbed_input]\"")
			var/errorlevel = output[SHELLEO_ERRORLEVEL]
			var/stdout = output[SHELLEO_STDOUT]
			var/stderr = output[SHELLEO_STDERR]
			if(!errorlevel)
				var/list/data
				try
					data = json_decode(stdout)
				catch(var/exception/e)
					src << "<span class='boldwarning'>Youtube-dl JSON parsing FAILED:</span>"
					src << "<span class='warning'>[e]: [stdout]</span>"
					return

				if (data["url"])
					web_sound_url = data["url"]
					var/title = "[data["title"]]"
					var/webpage_url = title
					if (data["webpage_url"])
						webpage_url = "<a href=\"[data["webpage_url"]]\">[title]</a>"
					music_extra_data["start"] = data["start_time"]
					music_extra_data["end"] = data["end_time"]
					music_extra_data["link"] = data["webpage_url"]
					music_extra_data["title"] = data["title"]

					var/res = alert(usr, "Show the title of and link to this song to the players?\n[title]",, "No", "Yes", "Cancel")
					switch(res)
						if("Yes")
							world << "<span class='boldannounce'>An admin played: [webpage_url]</span>"
						if("Cancel")
							return

					log_admin("[key_name(src)] played web sound: [web_sound_input]")
					message_admins("[key_name(src)] played web sound: [web_sound_input]")
			else
				src << "<span class='boldwarning'>Youtube-dl URL retrieval FAILED:</span>"
				src << "<span class='warning'>[stderr]</span>"

		else //pressed ok with blank
			log_admin("[key_name(src)] stopped web sound")
			message_admins("[key_name(src)] stopped web sound")
			web_sound_url = null
//			stop_web_sounds = TRUE

		if(web_sound_url && !findtext(web_sound_url, GLOB.is_http_protocol))
			src << "<span class='boldwarning'>BLOCKED: Content URL not using http(s) protocol</span>"
			src << "<span class='warning'>The media provider returned a content URL that isn't using the HTTP or HTTPS protocol</span>"
			return
/*		if(web_sound_url || stop_web_sounds)
			for(var/m in player_list)
				var/mob/M = m
				var/client/C = M.client
				if(C.prefs.toggles_sound & SOUND_MIDI)
					if(!stop_web_sounds)
						C.tgui_panel?.play_music(web_sound_url, music_extra_data)
					else
						C.tgui_panel?.stop_music()*/
		for (var/mob/M in player_list)
			if (!new_player_mob_list.Find(M) || !M.is_preference_enabled(/datum/client_preference/play_lobby_music))
				if (M.is_preference_enabled(/datum/client_preference/play_admin_midis))
					M.client << web_sound_input