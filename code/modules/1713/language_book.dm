/obj/item/weapon/book/language_book
	name = "языковая книга"
	desc = "Книга, позволяющая переводить между двумя языками. В нем ничего не написано."
	icon = 'icons/obj/library.dmi'
	icon_state = "book2" // temporary someone fix this aa
	throw_speed = TRUE
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("шлёпает", "бьёт")
	flammable = TRUE
	var/written = FALSE // has this book been written in yet?
	var/datum/language/lang1 = null // 1st language of translation
	var/datum/language/lang2 = null // 2nd language of translation
	unique = TRUE
/obj/item/weapon/book/language_book/attack_self(var/mob/user as mob)
	var/mob/living/human/H = user
	if(src.written && lang1 && lang2)
		var/choice = WWinput(user, "Выучить язык из [src]?", "Учим новый язык", "Yes", list("Yes", "No"))
		if (choice == "No")
			return
		else
			var/known1 = FALSE
			var/known2 = FALSE
			for (var/datum/language/i in H.languages)
				if (i == lang1)
					known1 = TRUE
				if (i == lang2)
					known2 = TRUE
			if(!known1 && !known2)
				user << "<span class = 'warning'>Не могу прочитать книгу по языку, не зная ни одного из языков написаных тут!</span>"
				return
			if(known1 && known2)
				user << "<span class = 'warning'>Не могу читать книгу по языку, если уже знаю оба языка!</span>"
				return
			var/datum/language/langtolearn = lang1
			if (known1)
				langtolearn = lang2
			H.visible_message("<span class='notice'>[user] начинает [pick("", "вдумчиво ")]читать [src].</span>", "<span class='notice'>Начинаю читать переводы для [langtolearn.name] написаных в [src]. Это займет около 2 минут, и вам нужно стоять или сидеть неподвижно.</span>")
			if(do_after(user, 1200, src))
				H.visible_message("<span class='notice'>[user] закончил читать [src].</span>", "<span class='notice'>Заканчиваю читать перевод в [src]. Теперь я знаю [langtolearn.name]!</span>")
				H.add_language(langtolearn.name, FALSE)
				H.add_note("Known Languages", "[langtolearn.name]")
	else
		user << "<span class = 'warning'>Тут ничего не написано!</span>"

/obj/item/weapon/book/language_book/attackby(obj/item/weapon/W as obj, mob/living/human/user as mob)
	if(istype(W, /obj/item/weapon/pen))
		if(user.languages.len < 2)
			user << "<span class = 'warning'>Я знаю только один язык, а нужно два!</span>"
			return
		if(written)
			user << "<span class = 'warning'>Тут уже что-то написано!</span>"
			return
		var/list/langcopy = user.languages.Copy() + "Cancel"
		var/datum/language/language1 = WWinput(user, "Какой будет первый язык для перевода?", "Этот язык", "text", langcopy)
		langcopy.Remove(language1)
		var/datum/language/language2 = WWinput(user, "Каким будет второй язык для перевода?", "Учит этому языку", "text", langcopy)
		user.visible_message("<span class='notice'>[user] пишет в [src].</span>", "<span class='notice'>Начинаю записывать перевод в [src]. Это займет около 2 минут, и вам нужно стоять или сидеть неподвижно.</span>")
		if(do_after(user, 1200, src))
			user.visible_message("<span class='notice'>[user] закончил писать [src].</span>", "<span class='notice'>Я написал перевод в [src].</span>")
			src.name = "языковая книга"
			src.desc = "Книга, позволяющая переводить между двумя языками. Похоже, это перевод между [language1] и [language2]."
			src.written = TRUE
			src.lang1 = language1
			src.lang2 = language2
	else
		..()
