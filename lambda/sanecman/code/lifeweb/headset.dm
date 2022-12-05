/obj/item/weapon/radio/walkietalkie/lfwb
    icon = 'lambda/sanecman/icons/obj/radio.dmi'

/obj/item/weapon/radio/walkietalkie/lfwb/castle
	freq = "General"

/obj/item/weapon/radio/walkietalkie/lfwb/command
	freq = "Command"

/obj/item/weapon/radio/walkietalkie/lfwb/duke
	freq = "Duke"

/obj/item/weapon/radio/walkietalkie/lfwb/station
	freq = "Station"

/obj/item/weapon/radio/walkietalkie/lfwb/soulbreaker
	freq = "Soulbreakers"

//Замок ратуша крепость
/obj/item/weapon/radio/walkietalkie/lfwb/castle/walkietalkie
	name = "рация"
	desc = "Для связи между жителями."
	icon_state = "walkietalkie-old"
	item_state = "walkietalkie-old"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	powerneeded = 0
	w_class = 2.0
	slot_flags = SLOT_BELT|SLOT_ID
	nothrow = FALSE

/obj/item/weapon/radio/walkietalkie/lfwb/castle/walkietalkie/radio
	name = "радио"
	desc = "Для связи между жителями. Не имеет микрофона."
	icon_state = "radio-old"
	item_state = "radio-old"
	transmitter = FALSE
	transmitter_on = FALSE

/obj/item/weapon/radio/walkietalkie/lfwb/castle/headset
	name = "радионаушник"
	desc = "Для связи между жителями."
	icon_state = "headset-c"
	item_state = "headset-c"
	slot_flags = SLOT_EARS | SLOT_TWOEARS
	var/ear_safety = 2

/obj/item/weapon/radio/walkietalkie/lfwb/castle/headset/command
	name = "радионаушник командования"
	desc = "Для связи между элитой. Имеет две частоты."
	icon_state = "headset-cc"
	item_state = "headset-cc"
	multifreq = TRUE
	multifreqlist = list("General","Command")
	multifreqlist_selectable = list("General","Command")

/obj/item/weapon/radio/walkietalkie/lfwb/castle/mintercom
	name = "интерком"
	desc = "Если вдруг не оказалось наушника. Без микрофона."
	icon_state = "mintercom"
	transmitter = FALSE
	receiver = TRUE
	receiver_on = TRUE
	transmitter_on = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	powerneeded = 0

/obj/item/weapon/radio/walkietalkie/lfwb/castle/inmachine
	name = "динамик"
	transmitter = FALSE
	receiver = TRUE
	receiver_on = TRUE
	transmitter_on = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	powerneeded = 0

/obj/item/weapon/radio/walkietalkie/lfwb/castle/intercom
	name = "интерком"
	desc = "Если вдруг не оказалось наушника."
	icon_state = "intercom"
	transmitter = TRUE
	receiver = TRUE
	receiver_on = TRUE
	transmitter_on = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	powerneeded = 0

//Командование
/obj/item/weapon/radio/walkietalkie/lfwb/command/mintercom
	name = "интерком командования"
	desc = "Если вдруг не оказалось наушника. Без микрофона."
	icon_state = "mintercom-c"
	transmitter = FALSE
	receiver = TRUE
	receiver_on = TRUE
	transmitter_on = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	powerneeded = 0

/obj/item/weapon/radio/walkietalkie/lfwb/command/intercom
	name = "интерком командования"
	desc = "Если вдруг не оказалось наушника."
	icon_state = "intercom-c"
	transmitter = TRUE
	receiver = TRUE
	receiver_on = TRUE
	transmitter_on = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	powerneeded = 0

//Захватчик
/obj/item/weapon/radio/walkietalkie/lfwb/duke/headset
	name = "радионаушник"
	desc = "Для связи между слугами Графа."
	icon_state = "headset-d"
	item_state = "headset-d"
	slot_flags = SLOT_EARS | SLOT_TWOEARS
	var/ear_safety = 2

//Станция
/obj/item/weapon/radio/walkietalkie/lfwb/station/walkietalkie
	name = "рация"
	desc = "Для связи между экипажем."
	icon_state = "walkietalkie"
	item_state = "walkietalkie"
	flammable = FALSE
	density = FALSE
	opacity = FALSE
	powerneeded = 0
	w_class = 2.0
	slot_flags = SLOT_BELT|SLOT_ID
	nothrow = FALSE

/obj/item/weapon/radio/walkietalkie/lfwb/station/walkietalkie/radio
	name = "радио"
	desc = "Для связи между экипажем. Не имеет динамика."
	icon_state = "radio"
	item_state = "radio"
	transmitter = FALSE
	transmitter_on = FALSE

/obj/item/weapon/radio/walkietalkie/lfwb/station/headset
	name = "радиогарнитура"
	desc = "Для связи между экипажем."
	icon_state = "headset-s"
	item_state = "headset-s"
	slot_flags = SLOT_EARS | SLOT_TWOEARS
	var/ear_safety = 2

/obj/item/weapon/radio/walkietalkie/lfwb/station/intercom
	name = "интерком"
	desc = "Для связи с экипажем станции."
	icon_state = "intercom-s"
	transmitter = TRUE
	receiver = TRUE
	receiver_on = TRUE
	transmitter_on = TRUE
	not_movable = FALSE
	not_disassemblable = TRUE
	powerneeded = 0

/obj/item/weapon/radio/walkietalkie/lfwb/station/mintercom
	name = "интерком"
	desc = "Для связи с экипажем станции. Без микрофона."
	icon_state = "mintercom-s"
	transmitter = FALSE
	receiver = TRUE
	receiver_on = TRUE
	transmitter_on = FALSE
	not_movable = FALSE
	not_disassemblable = TRUE
	powerneeded = 0

//Душегубы
/obj/item/weapon/radio/walkietalkie/lfwb/soulbreaker/amulet
	name = "амулет связи"
	desc = "Даёт возможность координировать свои действия с другими."
	icon_state = "radioamulet-sb"
	item_state = "radioamulet-sb"