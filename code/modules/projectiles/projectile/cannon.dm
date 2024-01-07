/obj/item/projectile/shell
	name = "bullet"
	icon_state = "shell"
	damage = 200
	damage_type = BRUTE
	nodamage = FALSE
	check_armor = "bomb"
	embed = TRUE
	sharp = TRUE
	hitsound_wall = "ric_sound"
	var/mob_passthrough_check = FALSE
	penetrating = 10
	armor_penetration = 80
	heavy_armor_penetration = 25
	var/caliber = 75
	atype = "HE"
	muzzle_type = /obj/effect/projectile/bullet/muzzle
	var/turf/targloc = null
	var/initiated = FALSE

/obj/item/projectile/shell/get_structure_damage()
	if (damage_type == BRUTE || damage_type == BURN)
		return damage/2
	return FALSE

/obj/item/projectile/shell/attack_mob(var/mob/living/target_mob)
	if (prob(80))
		mob_passthrough_check = TRUE
	else
		mob_passthrough_check = FALSE
	return ..()

/obj/item/projectile/shell/can_embed()
	//prevent embedding if the projectile is passing through the mob
	if (mob_passthrough_check)
		return FALSE
	return ..()

/obj/item/projectile/shell/on_impact(var/atom/A)
	impact_effect(effect_transform)		// generate impact effect
	playsound(src, "ric_sound", 50, TRUE, -2)
	if (istype(A, /turf))
		var/turf/T = A
		if (atype == "HE")
			if (!istype(T, /turf/floor/beach) && !istype(T, /turf/floor/broken_floor))
				T.ChangeTurf(/turf/floor/dirt/burned)
			explosion(T, 1, 2, 2, 3)
		else if (atype == "cannonball")
			if (!istype(T, /turf/floor/beach) && !istype(T, /turf/floor/broken_floor))
				T.ChangeTurf(/turf/floor/dirt/burned)
			explosion(T, 1, 1, 1, 2)
		else
			if (!istype(T, /turf/floor/beach) && !istype(T, /turf/floor/broken_floor))
				T.ChangeTurf(/turf/floor/dirt/burned)
			explosion(T, 0, 0, 1, 2)
	spawn(50)
		if (src)
			qdel(src)
	return TRUE


/obj/item/projectile/shell/launch(atom/target, mob/user, obj/structure/cannon/modern/tank/launcher, var/x_offset=0, var/y_offset=0)
	targloc = get_turf(target)
	var/dx = targloc.x - launcher.x
	var/dy = targloc.y - launcher.y
	var/angle = Atan2(dx, dy) // N = 90
	var/x1 = launcher.x + round(abs(4 * cos(angle))) * sign(cos(angle))
	var/y1 = launcher.y + round(abs(4 * sin(angle))) * sign(sin(angle))
	var/turf/curloc = locate(x1, y1, launcher.z)
	if (!istype(targloc) || !istype(curloc))
		qdel(src)
		return TRUE
	if (user)
		firer = user
		firer_original_dir = firer.dir
	else
		firer = null
		firer_original_dir = dir
	firer_loc = get_turf(src)
	firedfrom = launcher

	original = target
	loc = curloc
	starting = curloc

	yo = targloc.y - curloc.y + y_offset
	xo = targloc.x - curloc.x + x_offset
	shot_from = launcher
	silenced = FALSE

	projectile_list += src

	return FALSE

/obj/item/projectile/shell/proc/initiate(var/turf/T)
	if(!T)
		return
	var/caliber_modifier = round(caliber / 50)
	caliber_modifier = clamp(caliber_modifier, 1, 4)
	if (atype == "HE")
		var/he_range = caliber_modifier
		explosion(T, he_range, he_range + 1, he_range + 2, 6)
		var/list/fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/short_range = 1)
		fragmentate(T, 12, 7, fragment_types)
		loc = null
		qdel(src)
	else if (atype == "AP")
		var/ap_range = round(caliber_modifier / 2)
		ap_range = clamp(ap_range, 1, 4)
		explosion(T, ap_range, ap_range + 1, ap_range + 2, 3)
		var/list/fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/short_range = 1)
		fragmentate(T, 6, 3, fragment_types)
		loc = null
		qdel(src)

//////////////////////////////////////////
////////////////CANNONBALL////////////////

/obj/item/projectile/shell/cannonball
	icon_state = "shell"
	atype = "cannonball"
/obj/item/projectile/shell/cannonball/chainshot
	icon_state = "chainshot"
	atype = "chainshot"
/obj/item/projectile/shell/cannonball/grapeshot
	icon_state = "buckshot"
	atype = "grapeshot"

/obj/item/projectile/shell/cannonball/on_impact(var/atom/A)
	impact_effect(effect_transform)		// generate impact effect
	playsound(src, artillery_in, 50, TRUE, -2)
	if (istype(A, /turf))
		var/turf/T = A
		if (atype == "cannonball")
			if (!istype(T, /turf/floor/beach) && !istype(T, /turf/floor/broken_floor))
				T.ChangeTurf(/turf/floor/dirt/burned)
			explosion(T, 1, 2, 2, 3)
		else
			if (!istype(T, /turf/floor/beach) && !istype(T, /turf/floor/broken_floor))
				T.ChangeTurf(/turf/floor/dirt/burned)
			explosion(T, 0, 0, 1, 3)
	spawn(50)
		if (src)
			qdel(src)
	return TRUE

/obj/item/projectile/shell/cannonball/get_structure_damage()
	if (atype == "chainshot")
		return damage/2
	if (atype == "grapeshot")
		return damage/5
	return FALSE

/obj/item/projectile/shell/cannonball/attack_mob(var/mob/living/target_mob)
	switch(atype)
		if("cannonball")
			if (prob(80))
				mob_passthrough_check = TRUE
			else
				mob_passthrough_check = FALSE
		if("grapeshot")
			mob_passthrough_check = FALSE
			is_shrapnel = TRUE
		if("chainshot")
			mob_passthrough_check = TRUE
			if (ishuman(target_mob))
				var/mob/living/human/H = target_mob
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_leg","l_arm","r_leg","r_arm"))
				affecting.droplimb(0, DROPLIMB_BLUNT)
	return ..()

/obj/item/projectile/shell/can_embed()
	//prevent embedding if the projectile is passing through the mob
	if (mob_passthrough_check)
		return FALSE
	return ..()
