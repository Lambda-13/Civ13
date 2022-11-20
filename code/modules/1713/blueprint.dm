/obj/item/blueprint
	name = "схема"
	desc = "Схема для создания."
	icon_state = "blueprints"
	icon = 'icons/obj/items.dmi'
	flammable = TRUE

/obj/item/blueprint/gun
	var/stock_type = "none"
	var/receiver_type = "none"
	var/feeding_type = "none"
	var/barrel_type = "none"
	var/custom_name = "gun"
	var/base_icon = "none"
	var/override_sprite = null
	var/override_icon = 'icons/obj/guns/gun.dmi'
	var/caliber = ""
	var/ammo_type = list()

	var/cost_wood = 0
	var/cost_steel = 0

/obj/item/blueprint/gun/arisaka
	name = "Arisaka Type 99 схема"
	desc = "Схема создания Японской винтовки 7.7x58 калибра \"Арисака\"."
	stock_type = "Rifle Wooden Stock"
	receiver_type = "Bolt-Action"
	feeding_type = "Internal Magazine"
	barrel_type = "Long Rifle Barrel"
	custom_name = "Arisaka Type 99"
	base_icon = "arisaka99"
	override_sprite = "arisaka99"
	override_icon = 'icons/obj/guns/gun.dmi'
	caliber = "a77x58"
	ammo_type = list(/obj/item/ammo_casing/a77x58)

	cost_wood = 10
	cost_steel = 15