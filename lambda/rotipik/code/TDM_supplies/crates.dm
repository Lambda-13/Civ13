/obj/item/supply_radio/air/New()
    . = ..()
    if(faction == null)
        return
    switch(map.ID)
        if(MAP_KURSK)
            current_crates["Anti-tank mines"] = /obj/structure/closet/crate/ww2/atmines
            current_crates["Medical"] = /obj/structure/closet/crate/ww2/medical_supplies_crate
            current_crates["Sandbags"] = /obj/structure/closet/crate/ww2/sandbags_crate
            if(faction == 1)
                current_crates["Grenades"] = /obj/structure/closet/crate/ww2/grenades_crate_Kursk_Soviets
                current_crates["Ammo"] = /obj/structure/closet/crate/ww2/ammo_crate_Kursk_Soviets
            if(faction == 2)
                current_crates["Grenades"] = /obj/structure/closet/crate/ww2/grenades_crate_Kursk_German
                current_crates["Ammo"] = /obj/structure/closet/crate/ww2/ammo_crate_Kursk_German
                current_crates["Panzerfaust "] = /obj/structure/closet/crate/ww2/panzerfaust 
        else
            return

/obj/item/supply_radio/land/New()
    . = ..()
    if(faction == null)
        return
    switch(map.ID)
        if(MAP_KURSK)
            current_crates["Mortar"] = /obj/structure/closet/crate/ww2/mortar
            if(faction == 1)
                current_crates["AT rifle"] = /obj/structure/closet/crate/ww2/AT_rifle_Kursk_Soviets
                current_crates["Maxim"] = /obj/structure/closet/crate/ww2/maxim
                current_crates["Madsens LMG"] = /obj/structure/closet/crate/ww2/madsens_lmg
            if(faction == 2)
                current_crates["AT rifle"] = /obj/structure/closet/crate/ww2/AT_rifle_Kursk_German
                current_crates["MG34"] = /obj/structure/closet/crate/ww2/mg34
                current_crates["MG34 LMG"] = /obj/structure/closet/crate/ww2/mg34_lmg
        else
            return