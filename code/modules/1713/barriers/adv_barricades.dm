/obj/structure/barrier
	icon_state = "sandbag_new"
	icon = 'icons/obj/items.dmi'
	climbable = TRUE
	anchored = TRUE
	density = TRUE
	layer = 13
	maxHealth = 100
	var/penetration_threshold = 10
	var/stack = FALSE
	var/type = "/obj/item/weapon/barrier/sandbag"
	var/amount = 3
//Баррикады разрушаемы, их можно сделать, они блокируют пули в зависимости от пробивания, у них есть направление, через них можно пролезать, они состоят из мешков с песком, стали, железа, земли или снега.
//Прок на разбирание, крафты, механику остановки пуль, направление, состояние разрушенности, механику пробития.

/obj/structure/barrier/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover, /obj/effect/effect/smoke))
		return TRUE
	
	if (istype(mover, /obj/item/projectile))
		var/obj/item/projectile/P = mover
		if(prob(20))
			return TRUE
		if(dir != P.direction)
			if(penetration_threshold => P.armor_penetration)
				health -= P.damage/2
				return FALSE
			if(penetration_threshold < P.armor_penetration)
				var/difference = armor_penetration - penetration_threshold
				switch(difference)
					if(5 to 9) P.damage *= 0.25
					if(10 to 14) P.damage *= 0.5
					if(15 to 20) P.damage *= 0.75
				health -= P.damage/2
				return TRUE
		return ..()

/obj/structure/barrier/attack_hand(mob/user)
	var/mob/living/human/H = user
	if(!(barricade_type in hand_destructable))
		return
	if(!H.canmove)
		return
	if(do_after(H, 30, src))
		deconstruct()
	. = ..()

/obj/structure/barrier/proc/deconstruct()
	if(stack_type)
		var/stack_amt
		stack_amt = round(stack_amount * (health/maxhealth))
		if(stack_amt)
			new stack_type (loc, stack_amt)
	qdel(src)
	return ..()

/obj/structure/barrier/dirt
	name = 
	icon
	icon_state
	




