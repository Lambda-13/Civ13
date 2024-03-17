#define SANDBAG_BLOCK_ITEMS_CHANCE 40

/obj/structure/window/barrier/proc/check_cover(obj/item/projectile/P)
	. = TRUE

	if (P.def_zone in list("r_leg", "l_leg", "r_foot", "l_foot"))
		return FALSE

	if (ismob(P.original)) // projectile target
		var/mob/m = P.original
		if (m.lying || m.prone)
			return FALSE

// what is our chance of deflecting bullets regardless (compounded by check_cover)
/proc/bullet_deflection_chance(obj/item/projectile/proj)
	var/base = 100
	if (!istype(proj))
		return base
	return base - 15

// procedure for both incomplete and complete sandbags
/obj/structure/window/barrier/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	for (var/obj/covers/repairedfloor/rope/R in loc)
		return TRUE

	for (var/obj/covers/repairedfloor/rope/R in get_turf(get_step(mover,mover.dir)))
		return TRUE

	if (istype(mover, /obj/effect/effect/smoke))
		return TRUE

	if (!istype(mover, /obj/item))
		if (get_dir(loc, target) & dir)
			return FALSE
		else
			return TRUE

	if (!istype(mover, /obj/item/projectile))
		return TRUE

	var/obj/item/projectile/proj = mover
	proj.throw_source = proj.starting

	if (ishuman(proj.firer) && !incomplete && (proj.firer.lying || proj.firer.prone))
		visible_message("<span class = 'warning'>[mover] hits the [src]!</span>")
		health -= round(proj.damage*0.2)
		proj.damage = 0 // make sure we can't hurt people after hitting a sandbag
		proj.invisibility = 101
		proj.loc = null
		qdel(proj) // because somehow we were still passing the sandbag
		return FALSE

	if(proj.get_direction() in check_dir())

		if(check_cover(proj) && prob(33))
			return TRUE

		if (get_dist(proj.starting, loc) <= 1)
			return TRUE

		health -= round(proj.damage*0.2)
		proj.damage = 0
		proj.invisibility = 101
		proj.loc = null
		qdel(proj)
		return FALSE

	return TRUE

//Без понятия для чего это
/*	if (!mover.throw_source)
		if (get_dir(loc, target) & dir)
			return FALSE
		else
			return TRUE

	switch (get_dir(mover.throw_source, get_turf(src)))
		if (NORTH, NORTHEAST)
			if (dir == EAST || dir == WEST || dir == NORTH)
				return TRUE
		if (SOUTH, SOUTHEAST)
			if (dir == EAST || dir == WEST || dir == SOUTH)
				return TRUE
		if (EAST)
			if (dir != WEST)
				return TRUE
		if (WEST)
			if (dir != EAST)
				return TRUE*/

/obj/structure/window/barrier/proc/check_dir()
	switch(opposite_direction(dir))
		if(SOUTH)
			return list(SOUTH, SOUTHWEST, SOUTHEAST)
		if(EAST)
			return list(EAST, NORTHEAST, SOUTHEAST)
		if(NORTH)
			return list(NORTH, NORTHEAST, NORTHWEST)
		if(WEST)
			return list(WEST, SOUTHWEST, NORTHWEST)