/obj/item/weapon/material/chainsaw
	name = "chainsaw"
	desc = "A very dangerous tool intended to chop trees"
	icon = 'lambda/rotipik/icons/weapons/weapons.dmi'
	icon_state = "chainsaw"
	item_state = "chainsaw"
	w_class = ITEM_SIZE_LARGE
	sharp = TRUE
	edge = TRUE
	attack_verb = list("рубит", "режет", "разрубает")
	slot_flags = SLOT_BACK
	cooldownw = DEFAULT_ATTACK_COOLDOWN + 4
	chopping_speed = 0.9
	health = 350
	maxhealth = 350
	force = 30
	dropsound = 'sound/effects/drop_default.ogg'
	hitsound = 'lambda/rotipik/sounds/chainsawhit.ogg'
	item_icons = list(
	slot_l_hand_str = 'lambda/rotipik/icons/weapons/lefthand_weapons.dmi',
	slot_r_hand_str = 'lambda/rotipik/icons/weapons/righthand_weapons.dmi',
	)
	

/obj/item/weapon/material/chainsaw/proc/special_check(mob/user)
	if (!user.has_empty_hand(both = FALSE))
		user << "<span class='warning'>You need both hands to swing [src]!</span>"
		return FALSE
	return TRUE


/obj/structure/wild/attackby(obj/item/Q as obj, mob/user as mob)
	if (istype(Q, /obj/item/weapon/material/chainsaw))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		var/obj/item/weapon/material/chainsaw/HT = Q
		if(!HT.special_check(user))
			return
		visible_message("<span class='danger'>[user] begins to chop down \the [src]!</span>")
		playsound(get_turf(src), 'lambda/rotipik/sounds/chainsawhit.ogg', 100)
		user.do_attack_animation(src)
		if (do_after(user, 30*HT.chopping_speed, user.loc))
			health = 0
			try_destroy()
			HT.health -= 0.25
			if (HT.health <=0)
				HT.shatter()
		try_destroy()
		return
	. = ..()

/obj/item/weapon/material/chainsaw/attack(mob/living/M, mob/living/user)
	if(!special_check(user))
		return
	. = ..()

/obj/item/weapon/material/New()
	if(istype(src, /obj/item/weapon/material/chainsaw))
		return
	. = ..()


