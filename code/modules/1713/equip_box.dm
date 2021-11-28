/obj/item/gunbox
	name = "equipment kit"
	desc = "A secure box containing your sidearm."
	icon = 'icons/obj/storage.dmi'
	icon_state = "ammo_can" //temp

/obj/item/gunbox/attack_self(mob/living/user)
	var/list/options = list()
	options["Colt Police - revolver"] = list(/obj/item/weapon/gun/projectile/revolver/coltpolicepositive,/obj/item/ammo_magazine/c32,/obj/item/ammo_magazine/c32,/obj/item/ammo_magazine/c32)
	options["Glock 17 - pistol"] = list(/obj/item/weapon/gun/projectile/pistol/glock17,/obj/item/ammo_magazine/glock17,/obj/item/ammo_magazine/glock17,/obj/item/ammo_magazine/glock17)
	options["Peace maker - Pistol"] = list(/obj/item/weapon/gun/projectile/revolver/frontier,/obj/item/ammo_magazine/c44,/obj/item/ammo_magazine/c44,/obj/item/ammo_magazine/c44)
	options["Beretta m9 - revolver"] = list(/obj/item/weapon/gun/projectile/pistol/m9beretta,/obj/item/ammo_magazine/m9beretta,/obj/item/ammo_magazine/m9beretta,/obj/item/ammo_magazine/m9beretta)
	options["TT-30ll - pistol"] = list(/obj/item/weapon/gun/projectile/pistol/tt30ll,/obj/item/ammo_magazine/tt30ll,/obj/item/ammo_magazine/tt30ll)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/gun/))
				to_chat(user, "You have chosen \the [AM]. This is probably worth more than what your paycheck can be used for.")
		qdel(src)

/obj/item/bisinessbox
	name = "key equipment kit"
	desc = "A secure box containing your work."
	icon = 'icons/obj/storage.dmi'
	icon_state = "ammo_can" //temp

/obj/item/bisinessbox/attack_self(mob/living/user)
	var/list/options = list()
	options["Rednikov Bar"] = list(/obj/item/weapon/key/russian,/obj/item/weapon/storage/backpack/civbag)
	options["House Seller"] = list(/obj/item/weapon/key/civ/room1,/obj/item/weapon/key/civ/room2,/obj/item/weapon/key/civ/room3,/obj/item/weapon/key/civ/room4,/obj/item/weapon/key/civ/room5,/obj/item/weapon/key/civ/room6,/obj/item/weapon/key/civ/room7,/obj/item/weapon/key/civ/room8,/obj/item/weapon/storage/belt/keychain,/obj/item/weapon/storage/belt/keychain,/obj/item/weapon/storage/backpack/civbag)
	options["Radio Station"] = list(/obj/item/weapon/key/civ/gov,/obj/item/weapon/storage/backpack/civbag)
	options["Banker/Rich"] = list(/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/stack/money/dollar/onehundy,/obj/item/weapon/storage/backpack/civbag)
	options["Metallurgist"] = list(/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/iron/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/stack/material/steel/twentyfive,/obj/item/weapon/storage/toolbox/mechanical,/obj/item/weapon/storage/backpack/civbag)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/key/russian))
				to_chat(user, "Вы выбрали работу барменом на базе Rednikov.")
			if(istype(AM, /obj/item/weapon/key/civ/room1))
				to_chat(user, "Вы выбрали продавца дома. Дома для продажи находятся немного выше пожарных.")
			if(istype(AM, /obj/item/weapon/key/civ/gov))
				to_chat(user, "Вы выбрали ДиДжея Радиостанции, что находится на месте плотины Гувера.")
			if(istype(AM, /obj/item/stack/money/dollar/onehundy))
				to_chat(user, "Вы выбрали банкира/богача.")
			if(istype(AM, /obj/item/stack/material/iron/twentyfive))
				to_chat(user, "Вы продаёте или используете в своих делах металл и сталь, а так-же имеете ящик с инструментами.")
		qdel(src)