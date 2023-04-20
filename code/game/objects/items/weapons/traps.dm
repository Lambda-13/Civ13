/obj/item/weapon/beartrap
	name = "капкан"
	throw_speed = 2
	throw_range = TRUE
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "beartrap0"
	desc = "Ловит медведей и ломает ноги. Использовать с осторожностью."
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	var/deployed = FALSE

/obj/item/weapon/beartrap/armed
	deployed = TRUE
	anchored = TRUE
	icon_state = "beartrap1"
	layer = 2

/obj/item/weapon/beartrap/proc/can_use(mob/user)
	return (user.IsAdvancedToolUser() && !user.stat && !user.restrained())

/obj/item/weapon/beartrap/attack_self(mob/user as mob)
	..()
	if (!deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user] разворачивает [src].</span>",
			"<span class='danger'>Начинаю взводить [src]!</span>",
			"Слышу щелчки."
			)

		if (do_after(user, 60, src))
			user.visible_message(
				"<span class='danger'>\The [user] развернул [src].</span>",
				"<span class='danger'>Взвёл [src]!</span>",
				"Слышу сильный щелчок."
				)

			deployed = TRUE
			user.drop_from_inventory(src)
			update_icon()
			anchored = TRUE

/obj/item/weapon/beartrap/attack_hand(mob/user as mob)
	if (buckled_mob && can_use(user))
		user.visible_message(
			"<span class='notice'>[user] освобождает [buckled_mob] из [src].</span>",
			"<span class='notice'>Пытаюсь освободить [buckled_mob] из [src].</span>",
			)
		if (do_after(user, 60, src))
			user.visible_message("<span class='notice'>[user] освободил [buckled_mob] из [src].</span>")
			unbuckle_mob()
			anchored = FALSE
	else if (deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user] сворачивает [src].</span>",
			"<span class='notice'>Начинаю обезвреживать [src]!</span>",
			"Слышу щелчки и переключение механизмов."
			)
		if (do_after(user, 60, src))
			user.visible_message(
				"<span class='danger'>[user] свернул [src].</span>",
				"<span class='notice'>Обезвредил [src]!</span>"
				)
			deployed = FALSE
			anchored = FALSE
			update_icon()
	else
		..()

/obj/item/weapon/beartrap/proc/attack_mob(mob/living/L)

	var/target_zone
	if (L.lying)
		target_zone = ran_zone()
	else
		target_zone = pick("l_foot", "r_foot", "l_leg", "r_leg")

	//armor
	var/blocked = L.run_armor_check(target_zone, "melee")

	if (blocked >= 2)
		return

	if (!L.apply_damage(30, BRUTE, target_zone, blocked, used_weapon=src))
		return FALSE

	//trap the victim in place
	if (!blocked)
		set_dir(L.dir)
		can_buckle = TRUE
		buckle_mob(L)
		L << "<span class='danger'>Стальные зубья [src] кусают тебя, не давая двигаться!</span>"
		deployed = FALSE
		can_buckle = initial(can_buckle)

/obj/item/weapon/beartrap/Crossed(AM as mob|obj)
	if (deployed && isliving(AM))
		var/mob/living/L = AM
		L.visible_message(
			"<span class='danger'>[L] наступает на [src].</span>",
			"<span class='danger'>Я наступаю на [src]!</span>",
			"<b>Слышу щелчок и схлопывание!</b>"
			)
		attack_mob(L)
		if (!buckled_mob)
			anchored = FALSE
		deployed = FALSE
		update_icon()
	..()

/obj/item/weapon/beartrap/update_icon()
	..()

	if (!deployed)
		icon_state = "beartrap0"
	else
		icon_state = "beartrap1"


/obj/item/weapon/punji_sticks
	name = "ловушка панджи"
	throw_speed = 2
	throw_range = TRUE
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "punji0"
	desc = "Простая дыра с острыми палками внутри, прикрытая листьями."
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	flammable = TRUE
	var/deployed = FALSE
	flags = FALSE

/obj/item/weapon/punji_sticks/proc/can_use(mob/user)
	return (user.IsAdvancedToolUser() && !user.stat && !user.restrained())

/obj/item/weapon/punji_sticks/attack_self(mob/user as mob)
	..()
	if (!deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user] ставит [src].</span>",
			"<span class='danger'>Вкапываю [src] в землю!</span>",
			)

		if (do_after(user, 120, src))
			user.visible_message(
				"<span class='danger'>[user] поставил [src].</span>",
				"<span class='danger'>Вкопал [src] в землю!</span>",
				)

			deployed = TRUE
			user.drop_from_inventory(src)
			update_icon()
			anchored = TRUE

/obj/item/weapon/punji_sticks/attack_hand(mob/user as mob)
	if (buckled_mob && can_use(user))
		user.visible_message(
			"<span class='notice'>[user] вытаскивает [buckled_mob] из [src].</span>",
			"<span class='notice'>Начинаю вытаскивать [buckled_mob] из [src].</span>",
			)
		if (do_after(user, 120, src))
			user.visible_message("<span class='notice'>[buckled_mob] высвободился из [src] благодаря [user].</span>")
			unbuckle_mob()
			anchored = FALSE
	else if (deployed && can_use(user))
		user.visible_message(
			"<span class='danger'>[user] убирает [src].</span>",
			"<span class='notice'>Выкапываю [src]!</span>",
			)
		if (do_after(user, 90, src))
			user.visible_message(
				"<span class='danger'>[user] убрал [src].</span>",
				"<span class='notice'>Выкопал [src]!</span>"
				)
			deployed = FALSE
			anchored = FALSE
			update_icon()
	else
		update_icon()
		..()

/obj/item/weapon/punji_sticks/proc/attack_mob(mob/living/L)
	var/target_zone
	if (L.lying)
		target_zone = ran_zone()
	else
		target_zone = pick("l_foot", "r_foot", "l_leg", "r_leg")

	if (!L.apply_damage(90, BRUTE, target_zone, 0, used_weapon=src))
		return FALSE

	//trap the victim in place
	set_dir(L.dir)
	can_buckle = TRUE
	buckle_mob(L)
	L << "<span class='danger'>Падаю прямо на колья! Ловушка!</span>"
	deployed = FALSE
	can_buckle = initial(can_buckle)

/obj/item/weapon/punji_sticks/Crossed(AM as mob|obj)
	if (deployed && isliving(AM))
		var/mob/living/L = AM
		L.visible_message(
			"<span class='danger'>[L] падает в [src].</span>",
			"<span class='danger'>Падаю в [src]!</span>",
			)
		if (istype(L, /mob/living/simple_animal))
			var/mob/living/simple_animal/SA = L
			SA.stop_automated_movement = TRUE
			SA.adjustBruteLoss(rand(20,35))
			return
		else
			attack_mob(L)
			if (!buckled_mob)
				anchored = FALSE
			deployed = FALSE
			update_icon()
	..()

/obj/item/weapon/punji_sticks/update_icon()
	..()

	if (!deployed)
		icon_state = "punji2_sand"
	else
		icon_state = "punji1_sand"