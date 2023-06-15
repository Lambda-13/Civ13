#define SUPPLY_COMING_TIME 30 SECONDS
#define SUPPLY_COOLDOWN 5 MINUTES
#define SUPPLY_COOLDOWN_LAND 8 MINUTES

/obj/item/supply_radio
    name = "radio"
    desc = "To request supplies"
    icon = 'lambda/rotipik/icons/supply_stuff.dmi'
    var/faction
    var/cooldown
    var/list/current_crates = list()

/obj/item/supply_radio/air
    icon_state = "radio_air"
    desc = "To request supplies by plane"
    faction = 1

    attack_self(mob/user)
        . = ..()
        if(cooldown > world.time)
            to_chat(usr, "You can't use radio so early! Wait for [SUPPLY_COOLDOWN/600] minutes")
            return

        var/A = input(user, "Choice supplies") as null|anything in current_crates
        if(!A)
            return

        var/turf/active_turf = get_turf(usr)

        //area_inside or roof cheking

        var/area/active_area = get_area(active_turf)
        var/obj/roof = locate(active_turf.contents)
        if(active_area.location == AREA_INSIDE || roof)
            to_chat(usr, "Plane can't drop supplies here!")
            return

        cooldown = world.time + SUPPLY_COOLDOWN

        var/O = /obj/effect/supply_marker
        new O(active_turf)

        spawn(SUPPLY_COMING_TIME)
            var/thing_to_spawn = current_crates[A]

            var/mob/living/stupid = locate(/mob/living) in active_turf.contents
            if(stupid != null)
                stupid.apply_damage(30, BRUTE , "head")

            new thing_to_spawn(active_turf)

/obj/item/supply_radio/air/faction_2
    faction = 2

/obj/item/supply_radio/land
    desc = "To request supplies by land"
    icon_state = "radio_land"
    faction = 1
    attack_self(mob/user)
        . = ..()
        if(cooldown > world.time)
            to_chat(usr, "You can't use radio so early! Wait for [SUPPLY_COOLDOWN_LAND/600] minutes.")
            return

        var/A = input(user, "Choice supplies") as null|anything in current_crates
        if(!A)
            return

        var/list/possibly_turfs = list_of_arriving
        var/active_turf
        var/I = 1
        for(var/obj/structure/arriving_turf/P in possibly_turfs)
            if(possibly_turfs[I] == null)
                return
            if(possibly_turfs[I].faction == faction)
                active_turf = get_turf(possibly_turfs[I])
            else I++
        if(active_turf == null)
            to_chat(usr, "Supplies can't come!")
            return
        cooldown = world.time + SUPPLY_COOLDOWN_LAND
        spawn(SUPPLY_COMING_TIME)
            var/thing_to_spawn = current_crates[A]
            new thing_to_spawn(active_turf)

/obj/item/supply_radio/land/faction_2
    faction = 2

/obj/structure/arriving_turf
    icon = 'lambda/rotipik/icons/supply_stuff.dmi'
    icon_state = "effect_arriving_supplies"
    density = FALSE
    anchored = TRUE
    var/faction = 1
    New()
        list_of_arriving += src
/obj/structure/arriving_turf/faction_2
    faction = 2

/obj/effect/supply_marker
    icon = 'lambda/rotipik/icons/supply_stuff.dmi'
    icon_state = "effect_arriving_supplies"
    anchored = TRUE
    New()
        spawn(SUPPLY_COMING_TIME)
            qdel(src)