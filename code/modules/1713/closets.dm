/obj/structure/closet/cabinet
	name = "шкаф"
	desc = "Старое всегда будет в моде."
	icon_state = "cabinet_closed"
	icon_closed = "cabinet_closed"
	icon_opened = "cabinet_open"

/obj/structure/closet/cabinet/ceiling
	name = "шкаф"
	desc = "Старое всегда будет в моде."
	icon_state = "cabinet_closed_ceiling"
	icon_closed = "cabinet_closed_ceiling"
	icon_opened = "cabinet_open_ceiling"
	anchored = TRUE

/obj/structure/closet/cabinet/first_aid
	name = "шкаф первой помощи"
	desc = "Настенный шкаф для предметов первой помощи"
	icon_state = "medical_wall"
	icon_closed = "medical_wall"
	icon_opened = "medical_wall_open"
	anchored = TRUE
	density =  FALSE
	wall_mounted = TRUE
	store_mobs = FALSE
	storage_capacity = 2
	New()
		..()
		new /obj/item/weapon/storage/firstaid/advsmall(src)

/obj/structure/closet/cabinet/extinguisher_cabinet
	name = "шкаф огнетушителя"
	desc = "Небольшой настенный шкаф, предназначенный для хранения огнетушителя."
	icon_state = "extinguisher_closed"
	icon_closed = "extinguisher_closed"
	icon_opened = "extinguisher_empty"
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE
	store_mobs = FALSE
	storage_capacity = 2
	var/obj/item/weapon/fire_extinguisher/has_extinguisher

/obj/structure/closet/cabinet/extinguisher_cabinet/New()
	..()
	has_extinguisher = new/obj/item/weapon/fire_extinguisher(src)

/obj/structure/closet/cabinet/extinguisher_cabinet/attackby(obj/item/O, mob/user)
	if(!ishuman(user))
		return
	if(istype(O, /obj/item/weapon/fire_extinguisher))
		if(!has_extinguisher && opened && user.unEquip(O, src))
			has_extinguisher = O
			to_chat(user, "<span class='notice'>Размещаю [O] в [src].</span>")
			playsound(src.loc, 'sound/effects/extin.ogg', 50, 0)
			density = FALSE
		else
			opened = !opened
	else
		opened = !opened
	update_icon()

/obj/structure/closet/cabinet/extinguisher_cabinet/attack_hand(mob/user)
	if(!ishuman(user))
		return
	if(has_extinguisher)
		user.put_in_hands(has_extinguisher)
		to_chat(user, "<span class='notice'>Беру [has_extinguisher] из [src].</span>")
		playsound(src.loc, 'sound/effects/extout.ogg', 50, 0)
		has_extinguisher = null
		opened = 1
	else
		opened = !opened
	update_icon()

/obj/structure/closet/cabinet/extinguisher_cabinet/update_icon()
	if(!opened)
		icon_state = "extinguisher_closed"
		return
	if(has_extinguisher)
		icon_state = "extinguisher_full"
	else
		icon_state = "extinguisher_empty"

/obj/structure/closet/cabinet/extinguisher_cabinet/AltClick(mob/user)
	if(!ishuman(user))
		return
	opened = !opened
	update_icon()

///////////////Hide-outs//////////////////

/obj/structure/closet/hideout
	name = "странные листья"
	desc = "Подозрительно выглядищие листья."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "pine_closed"
	icon_closed = "pine_closed"
	icon_opened = "pine_open"
	anchored = TRUE
	density = FALSE
	not_movable = TRUE
	not_disassemblable = TRUE

/obj/structure/closet/hideout/pine
	name = "странные листья"
	desc = "Подозрительно выглядищие листья."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "pine_closed"
	icon_closed = "pine_closed"
	icon_opened = "pine_open"
	anchored = TRUE
	density = FALSE

/obj/structure/closet/hideout/beach
	name = "странные листья"
	desc = "Подозрительно выглядищие листья."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "beach_closed"
	icon_closed = "beach_closed"
	icon_opened = "beach_open"
	anchored = TRUE
	density = FALSE

/obj/structure/closet/hideout/autumn
	name = "странные листья"
	desc = "Подозрительно выглядищие листья."
	icon = 'icons/obj/hideout.dmi'
	icon_state = "autumn_closed"
	icon_closed = "autumn_closed"
	icon_opened = "autumn_open"
	anchored = TRUE
	density = FALSE


/obj/structure/closet/cabinet/update_icon()
	if (!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened

/obj/structure/closet/chemical
	name = "химический шкафчик"
	desc = "Тут хранят химикаты."
	icon_state = "medical1"
	icon_closed = "medical"
	icon_opened = "medicalopen"

	New()
		..()
		new /obj/item/weapon/storage/box/pillbottles(src)
		new /obj/item/weapon/storage/box/pillbottles(src)