

var/list/radio_prefixes = list(";", ":b", ":l", ":r", ":t", ":f",
	":B", ":L", ":R", ":T", ":F")

/mob/living/proc/binarycheck()
	return FALSE

/mob/living/proc/get_default_language()
	return default_language

/mob/living/proc/is_muzzled()
	return FALSE

/mob/living/proc/handle_speech_problems(var/message, var/verb)

	var/prefix = ""
	for (var/rp in radio_prefixes)
		if (dd_hasprefix(message, rp))
			prefix = copytext(message, 1, length(rp)+1)
			message = copytext(message, length(rp)+1, length(message)+1)

	var/list/returns[3]
	var/speech_problem_flag = FALSE

	if (slurring)
		message = slur(message)
		verb = pick("slobbers","slurs")
		speech_problem_flag = TRUE
	if (stuttering)
		message = stutter(message)
		verb = pick("stammers","stutters")
		speech_problem_flag = TRUE
	if (lisp)
		message = lisp(message, lisp)
		speech_problem_flag = TRUE

	returns[1] = prefix + message
	returns[2] = verb
	returns[3] = speech_problem_flag
	return returns

/mob/living/proc/handle_speech_sound()
	var/list/returns[2]
	returns[1] = null
	returns[2] = null
	return returns

/mob/living/proc/get_speech_ending(verb, var/ending)
	if (ending=="!")
		return pick("exclaims","shouts","yells")
	if (ending=="?")
		return "asks"
	return verb

/mob/living/say(var/message, var/datum/language/speaking = null, var/verb="says", var/alt_name="", var/alt_message=null, var/animal = FALSE, var/howl = FALSE, var/original_message = "")
	if (client)
		if (client.prefs.muted & MUTE_IC)
			src << "<span class = 'red'>You cannot speak in IC (Muted).</span>"
			return
	var/static/regex/memes = regex("метагей|тритор|павергейм|повергейм|генокрад|брейнрот|лол|кек|азаза|ванотян|вуна|лолечка|фоллач|фолач|хостинг|анкап|анкапа|коклав|конкап|анкал|рофляныч|рофелька|футанари|фута|камбой|фембой|майнкрафт|чумба|чушка|чурка|флоппа|флопа|либерахи|либераха|либераху|траповод|тритор|метагей|двач|украинцы|рпшер|спидранер|лабеб|педаль|педалька|педали|педалятор|педалями|педальная|педальное|лутецкий|залутать|лутер|спидран|спидранить|заспидранил|хорни|вайб|фури|фурятина|фуричка|вайбов|вайбер|чирик|ванотян|сорри|коксакингом|коксакинг|коксак|коксакер|сорян|соряныч|сорямба|рофлябма|рофлыч|ауе|ролевой плей|ролевой рп|жигуль|жигули|жигулик|pog|поггерс|погчамп|ролеплеер|ральплеер|кек|кекыч|кекчик|грифер|грифонер|грифозник|хентай|тяночка|лоля|вайфу|lmao|ayy|lol|kek|cheburek|ежжи|спанчбоб|рофл|uwu|owo|0w0|@w@|>w<|обэма|>w>|blacklivesmatters|BLM|вуася", "i")
	if(findtext_char(message, memes))
		//var/memcount // единица, чтобы дамажило с первого мема
		src.adjustBrainLoss(10*memcount) // Каждый следующий мем будет бить в степени
		memcount +=1
		if(memcount > 10)
			src.gib()
			message_admins("[key_name_admin(client)] гибнуло за мемы")
		/*if(key_name(client)=="Вписать сюда сикей") //Всё равно не работает, оставляю на случай если придёт кодер который может починить.
			gib()
		else
			src.adjustBrainLoss(50) //Работает по схеме: 4 мема = смерть.
		//src.gib()
		*/
		message_admins("[key_name_admin(client)] мемы в ИЦ:   [message]")
		to_chat(src, "<B>Не мемась в ИЦ.</B>")
		return 0

	if (stat)
		if (stat == 2)
			return say_dead(message)
		return

	switch(copytext(message,1,2))
		if ("*") return emote(copytext(message,2))
		if ("^") return custom_emote(1, copytext(message,2))

	message = trim_left(message)

	//parse the language code and consume it
	if (!speaking)
		speaking = parse_language(message)

	if (speaking)
		message = copytext(message,2+length_char(speaking.key))
		alt_message = copytext(alt_message,2+length_char(speaking.key))
	else
		speaking = get_default_language()

	// This is broadcast to all mobs with the language,
	// irrespective of distance or anything else.
//	if (speaking && (speaking.flags & HIVEMIND))
//		speaking.broadcast(src,trim(message))
//		return TRUE

	verb = say_quote(message, speaking)

	if (is_muzzled())
		src << "<span class='danger'>You're muzzled and cannot speak!</span>"
		return
	original_message = message

	message = trim_left(message)

	if (!(speaking && (speaking.flags & NO_STUTTER)))

		if (slurring || stuttering || lisp)
			if (alt_message)
				message = alt_message // use the message with no HTML, because it gets fucked up

		var/list/handle_s = handle_speech_problems(message, verb)
		message = handle_s[1]
		verb = handle_s[2]

	if (!message || message == "")
		return FALSE


	var/list/handle_v = handle_speech_sound()
	var/sound/speech_sound = handle_v[1]
	var/sound_vol = handle_v[2]

	var/italics = FALSE
	var/message_range = 7
	if (ishuman(src))
		var/mob/living/human/H = src
		if (H.wolfman && howl)
			message_range = 30
	var/turf/T = get_turf(src)

	//handle nonverbal and sign languages here
	if (speaking)
		if (speaking.flags & NONVERBAL)
			if (prob(30))
				custom_emote(1, "[pick(speaking.signlang_verb)].")

		if (speaking.flags & SIGNLANG)
			return say_signlang(message, pick(speaking.signlang_verb), speaking)

	var/list/listening = list()
	var/list/listening_obj = list()

	if (T)
		//DO NOT FUCKING CHANGE THIS TO GET_OBJ_OR_MOB_AND_BULLSHIT() -- Hugs and Kisses ~Ccomp
		var/list/hear = hear(message_range,T)
		var/list/hearturfs = list()

		for (var/I in hear)
			if (ismob(I))
				var/mob/M = I
				listening += M
				hearturfs += M.locs[1]
			else if (isobj(I))
				var/obj/O = I
				hearturfs += O.locs[1]
				listening_obj |= O

		for (var/mob/M in player_list)
			if (M.stat == DEAD && M.is_preference_enabled(/datum/client_preference/ghost_ears))
				listening |= M
				continue
			if (M.loc && M.locs[1] in hearturfs)
				listening |= M

	var/speech_bubble_test = say_test(message)
	var/image/speech_bubble = image('icons/mob/talk.dmi',src,"h[speech_bubble_test]")
	spawn(30) qdel(speech_bubble)

	for (var/mob/M in listening)
		if (howl)
			verb = "howls"
		M << speech_bubble
		M.hear_say(message, verb, speaking, alt_name, italics, src, speech_sound, sound_vol, alt_message, animal, original_message)

	for (var/obj/O in listening_obj)
		spawn(0)
			if (O) //It's possible that it could be deleted in the meantime.
				if (howl)
					verb = "howls"
				O.hear_talk(src, message, verb, speaking)
	if (client)
		log_say("[name]/[key] : [message]")
	return TRUE

/mob/living/proc/say_signlang(var/message, var/verb="gestures", var/datum/language/language)
	for (var/mob/O in viewers(src, null))
		O.hear_signlang(message, verb, language, src)
	return TRUE

/obj/effect/speech_bubble
	var/mob/parent

/mob/living/proc/GetVoice()
	return name
