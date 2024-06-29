/process/epochswap
	// epoch = required players

	var/list/epochs = list(
		//"Stone Age (?-3000 B.C.)" = 0,
		"Избранное" = 50,
		"Chad Mode" = 15,
		"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
		//"Bronze Age (3000 B.C.-400 A.D.)" = 0,
		//"Dark Ages (400-700)" = 0,
		//"Middle Ages (700-1450)" = 0,
		//"Renaissance (1450-1650)" = 0,
		//"Imperial Age (1650-1780)" = 0,
		//"Industrial Age (1850-1895)" = 0,
		//"Early Modern Era (1896-1930)" = 0,
		"PvE (Voyage & Cursed Island)" = 0,
		"Early Fire Arms (1650-1930)" = 0,
		"World War II (1931-1948)" = 0,
		//"Cold War Era (1949-1984)" = 0,
		//"Modern Era (1985-2020)" = 0,
		"Modern Fire Arms (1949-2021)" = 0,
		"HRP TDM (Gulag, Occupation, AOTD, etc)" = 10,
		"Civilization 13 (Nomads)" = 0,
		"Civilization 13 (Colony & Pioneers)" = 0,
		//"Civilization 13 (Prison Camps)" = 15,
		"Civilization 13 (Others)" = 0,
		"Battle Royale" = 0,
		"Fiction" = 0,
	)
	var/ready = TRUE
	var/admin_triggered = FALSE
	var/finished_at = -1

/process/epochswap/setup()
	name = "epochswap"
	schedule_interval = 5 SECONDS
	start_delay = 5 SECONDS
	fires_at_gamestates = list(GAME_STATE_PLAYING, GAME_STATE_FINISHED)
	priority = PROCESS_PRIORITY_IRRELEVANT
	processes.epochswap = src

/process/epochswap/fire()
	if(map.admins_cahnged_map)
		return
	// no SCHECK here
	if (is_ready())
		spawn(20)
			map.save_awards()
		if(map.ID == MAP_VOYAGE)
			var/obj/map_metadata/voyage/nmap = map
			nmap.show_stats()
		if (config.allowedgamemodes == "TDM")
			if (clients.len >= 25) // Temporary solution
				var/moderator_present = FALSE
				for (var/client/C in admins)
					if(R_MOD||R_ADMIN & C.holder.rights)
						moderator_present = TRUE
						break
				if (moderator_present == TRUE)
					epochs = list(
						"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
						"Early Fire Arms (1650-1930)" = 0,
						"World War II (1931-1948)" = 0,
						"Modern Fire Arms (1949-2021)" = 0,
						"Fiction" = 0,
						"Battle Royale" = 6,
						"HRP TDM (Gulag, Occupation, AOTD, etc)" = 10,
						"PvE (Voyage & Cursed Island)" = 0,
					)
				else
					epochs = list(
						"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
						"Early Fire Arms (1650-1930)" = 0,
						"World War II (1931-1948)" = 0,
						"Modern Fire Arms (1949-2021)" = 0,
						"Fiction" = 0,
						"Battle Royale" = 6,
						"Chad Mode" = 30,
					)
			else
				epochs = list(
					"Pre-Firearms (3000 B.C-1650 A.D.)" = 0,
					"Early Fire Arms (1650-1930)" = 0,
					"World War II (1931-1948)" = 0,
					"Modern Fire Arms (1949-2021)" = 0,
					"Fiction" = 0,
					"Battle Royale" = 6,
					"HRP TDM (Gulag, Occupation, AOTD, etc)" = 10,
					"PvE (Voyage & Cursed Island)" = 0,
//					"Chad Mode" = 0,
				)
		else if (config.allowedgamemodes == "RP")
			epochs = list(
				//"The Art of the Deal" = 10,
				"Civilization 13 (Nomads)" = 0,
				"Civilization 13 (Colony & Pioneers)" = 0,
				//"Civilization 13 (Prison Camps)" = 15,
				"Civilization 13 (Others)" = 0,)
		else if (config.allowedgamemodes == "PERSISTENCE")
			epochs = list(
				"Civilization 13 (Nomads)" = 5,)
		else if (config.allowedgamemodes == "BR")
			epochs = list(
				"Battle Royale" = 0,)
		else if (config.allowedgamemodes == "LAMBDA")

			var/servertime = "[time2text(world.timeofday,"hh")]" // Текущий час сервера

			if (servertime == "20" || servertime == "21" || servertime == "22" || servertime == "23" || servertime == "24" || servertime == "00" || servertime == "01" || servertime == "02" || servertime == "03" || servertime == "04" || servertime == "05" || servertime == "06") // Проверка на ночное время
				epochs = list(
					"Выживание (Режим Чада)" = 15,
					"Каменный век (? - 3000 до н. э.)" = 10,
					"Бронзовый век и средневековье (3000 до н.э. - 1650 н.э.)" = 10,
					"Эра империализма (1650 - 1930)" = 10,
					"Вторая мировая война (1931 - 1948)" = 10,
					"Эра современности (1949 - 2021)" = 10,
					"Командный бой и ролевая игра (ГУЛАГ, Оккупация, Исскуство сделки...)" = 5,
					"Выживание (Номады)" = 0,
					"Выживание (Колония, Пионеры, Богемия...)" = 5,
					"Другое" = 5,
					"Королевская битва" = 6,
                    "ПвЕ (Воядж, Охота, Колония, Пустошь..." = 0,
					"Альтернативная история" = 10,
				)
				world << "<big>Режим голосования - Ночной</big>"
			else
				epochs = list(
					"Избранное" = 50,
					"Выживание (Режим Чада)" = 15,
					"Каменный век (? - 3000 до н. э.)" = 0,
					"Бронзовый век и средневековье (3000 до н.э. - 1650 н.э.)" = 0,
					"Эра империализма (1650 - 1930)" = 0,
					"Вторая мировая война (1931 - 1948)" = 0,
					"Эра современности (1949 - 2021)" = 0,
					"Командный бой и ролевая игра (ГУЛАГ, Оккупация, Исскуство сделки...)" = 10,
					"Выживание (Номады)" = 15,
					"Выживание (Колония, Пионеры, Богемия...)" = 10,
					"Другое" = 10,
					"Королевская битва" = 0,
                    "ПвЕ (Воядж, Охота, Колония, Пустошь..." = 0,
					"Альтернативная история" = 0,
				)
				world << "<big>Режим голосования - Дневной</big>"
		ready = FALSE
		vote.initiate_vote("epoch", "EpochSwap Process", TRUE, list(src, "swap"))

/process/epochswap/proc/is_ready()
	. = FALSE
	if (config.allowedgamemodes == "BR")
		. = FALSE
	else if (ready)
		if (admin_triggered)
			. = TRUE
		// round will end soon (tm)
		else if (map && map.admins_triggered_roundend)
			. = TRUE
		else if (ticker.finished)
			. = TRUE
	return .

/process/epochswap/proc/swap(var/winner = "Imperial Age (1650-1780)")
	vote.voted_epoch = winner


/process/mapswap
	// map = required players
	var/list/maps = list(MAP_CURSED_ISLAND = 0,)
	var/epoch = "Imperial Age (1650-1780)"
	var/ready = TRUE
	var/admin_triggered = FALSE
	var/finished_at = -1
	var/next_map_title = "TBD"
	var/done = FALSE

/process/mapswap/setup()
	name = "mapswap"
	schedule_interval = 5 SECONDS
	start_delay = 5 SECONDS
	fires_at_gamestates = list(GAME_STATE_PLAYING, GAME_STATE_FINISHED)
	priority = PROCESS_PRIORITY_IRRELEVANT
	processes.mapswap = src

/process/mapswap/fire()
	// no SCHECK here
	if(map.admins_cahnged_map)
		return
	done = FALSE
	if (is_ready())
		ready = FALSE
		epoch = vote.voted_epoch
		if (epoch == "Modern Fire Arms (1949-2021)" || epoch == "Эра современности (1949 - 2021)")
	// 2013 - TDM
			maps = list(
				MAP_RETREAT = 6,
				MAP_BAY_OF_PIGS = 10,
				MAP_ROAD_TO_DAK_TO = 0,
				MAP_COMPOUND = 6,
				MAP_HUE = 15,
				MAP_AFRICAN_WARLORDS = 6,
				MAP_TADOJSVILLE = 12,
				MAP_MAGISTRAL = 10,
				MAP_HILL_3234 = 12,
				MAP_ALLEYWAY = 0,
				MAP_WACO = 0,
				MAP_MAGISTRAL = 10,
				MAP_ARAB_TOWN_RU = 0,
				MAP_YELTSIN = 6,
				MAP_GROZNY = 6,
				MAP_BANK_ROBBERY = 0,
				MAP_DRUG_BUST = 0,
				MAP_ARAB_TOWN = 0,
				MAP_ARAB_TOWN_2 = 0,
				MAP_HOSTAGES = 0,
				MAP_CAPITOL_HILL = 6,
				MAP_PERVOMAISK_CROSSING = 10,
				MAP_WACO = 0,
				MAP_SYRIA = 12,
				MAP_ZHENBAO = 10,
			)
		else if (epoch == "World War II (1931-1948)" || epoch == "Вторая мировая война (1931 - 1948)")
	// 1943 - TDM
			maps = list(
				MAP_REICHSTAG = 0,
				MAP_MICROMAHA = 0,
				MAP_NANKOU = 0,
				MAP_SMALLINGRAD = 0,
				MAP_REICHFLAKTURM = 0,
				MAP_PAVLOV_HOUSE = 0,
				MAP_HOTEL = 0,
				MAP_KHALKHYN_GOL = 8,
				MAP_RIZAL_STADIUM = 10,
				MAP_KURSK = 10,
				MAP_STALINGRAD = 10,
				MAP_LONG_MARCH = 12,
				MAP_SMALLSIEGEMOSCOW = 10,
				MAP_INTRAMUROS = 12,
				MAP_WAKE_ISLAND = 12,
				MAP_NANJING = 12,
				MAP_OMAHA = 14,
//				MAP_BIGSIEGEMOSCOW = 20,
				MAP_FOREST = 10,
				MAP_KARELIA = 10,
				MAP_BERLIN = 14,
				MAP_VITEBSK = 10,
				MAP_WARSAW = 10,
				MAP_ARDENNES = 10,
				MAP_BARBAROSSA = 10,
//				MAP_IWO_JIMA = 40,
			)

		else if (epoch == "Early Fire Arms (1650-1930)" || epoch == "Эра империализма (1650 - 1930)")
	// 1903 - TDM
			maps = list(
				MAP_HILL_203 = 0,
				MAP_YPRES = 0,
				MAP_VERDUN = 0,
				MAP_SIBERSYN = 6,
				MAP_TSARITSYN = 6,
				MAP_PORT_ARTHUR = 10,
				MAP_SANTO_TOMAS = 8,
				MAP_CALOOCAN = 0,
				MAP_LITTLE_CREEK_TDM = 0,
				MAP_MISSIONARY_RIDGE = 10,
				MAP_NAVAL = 0,
//				MAP_SKULLISLAND = 0,
				MAP_SUPPLY_RAID = 0,
				MAP_BRIDGE = 0,
				MAP_RECIFE = 10,
				MAP_FIELDS = 10,
				MAP_ROBUSTA = 15,
				MAP_SEKIGAHARA = 6,
			)
		else if (epoch == "Stone Age (?-3000 B.C.)" || epoch == "Каменный век (? - 3000 до н. э.)")
			maps = list(
				MAP_FOUR_KINGDOMS = 0,
				MAP_TRIBES = 0,
			)
		else if (epoch == "Chad Mode" || epoch == "Выживание (Режим Чада)")
	//	Chad Mode - TDM
			maps = list(
				MAP_JUNGLE_OF_THE_CHADS = 0,
			)
		else if (epoch == "Pre-Firearms (3000 B.C-1650 A.D.)" || epoch == "Бронзовый век и средневековье (3000 до н.э. - 1650 н.э.)")
	//	1013 - TDM
			maps = list(
				MAP_KARAK = 0,
				MAP_CAMP = 0,
				MAP_OASIS = 0,
				MAP_HERACLEA = 0,
				MAP_CLASH = 0,
				MAP_SIEGE = 0,
				MAP_GLADIATORS = 0,
				MAP_TEUTOBURG = 8,
				MAP_HERACLEA = 8,
				MAP_SAMMIRHAYEED = 10,
			)
		else if (epoch == "HRP TDM (Gulag, Occupation, AOTD, etc)" || epoch == "Командный бой и ролевая игра (ГУЛАГ, Оккупация, Исскуство сделки...)")
			maps = list(
				MAP_HUNT = 6,
				MAP_GULAG13 = 6,
//				MAP_ABASHIRI = 6,
//				MAP_RIVER_KWAI = 0,
				MAP_LITTLE_CREEK = 6,
				MAP_OCCUPATION = 10,
				MAP_THE_ART_OF_THE_DEAL = 12,
			)
		else if (epoch == "PvE (Voyage, Hunt, Colony, Wasteland, etc)" || epoch == "ПвЕ (Воядж, Охота, Колония, Пустошь...)")
			maps = list(
				MAP_CURSED_ISLAND = 0,
				MAP_VOYAGE = 6,
			)
		else if (epoch == "Civilization 13 (Nomads)")
			maps = list(
//				MAP_CIVILIZATIONS = 0,
				MAP_NOMADS = 0,
				MAP_NOMADS_DESERT = 0,
				MAP_NOMADS_ICE_AGE = 0,
				MAP_NOMADS_JUNGLE = 0,
				MAP_NOMADS_DIVIDE = 10,
				MAP_NOMADS_CONTINENTAL = 10,
				MAP_NOMADS_PANGEA = 10,
				MAP_NOMADS_WASTELAND = 0,
				MAP_NOMADS_WASTELAND_2 = 0,
				MAP_NOMADS_NEW_WORLD = 5,
				MAP_NOMADS_MEDITERRANEAN = 0,
//				MAP_NOMADS_ISLAND = 0,
				MAP_NOMADS_KARAFUTO = 0,
				MAP_NOMADS_EUROPE = 10
			)
		else if (epoch == "Civilization 13 (Colony & Pioneers)" || epoch == "Выживание (Колония, Пионеры, Богемия...)")
			maps = list(
				MAP_COLONY_CONTINENTAL = 0,
				MAP_COLONY = 0,
				MAP_JUNGLE_COLONY = 5,
				MAP_PIONEERS = 5,
				MAP_PIONEERS_WASTELAND_2 = 10,
				MAP_BOHEMIA = 10,
				MAP_FOUR_COLONIES = 20,
			)
		else if (epoch == "Civilization 13 (Others)" || epoch == "Другое")
			maps = list(
				MAP_TRIBES = 15,
				MAP_HUNT = 0,
				MAP_LITTLE_CREEK = 10,
				MAP_THE_ART_OF_THE_DEAL = 6,
				MAP_FOUR_KINGDOMS = 0,
				MAP_GULAG13 = 10,
//				MAP_ABASHIRI = 6,
//				MAP_RIVER_KWAI = 0,
				MAP_OCCUPATION = 10,
			)
		else if (epoch == "Battle Royale" || epoch == "Королевская битва")
			maps = list(
				MAP_BATTLEROYALE_MEDIEVAL = 0,
				MAP_BATTLEROYALE_IMPERIAL = 0,
				MAP_BATTLEROYALE_WILDWEST = 0,
				MAP_BATTLEROYALE_MODERN = 0,
				MAP_HUNGERGAMES = 0,)
		else if (epoch == "Fiction" || epoch == "Альтернативная история")
			maps = list(
				MAP_TANTIVEIV = 0,
				MAP_WHITERUN = 10,
				MAP_RED_MENACE = 12,
				MAP_OPERATION_FALCON = 10,)
		else if (epoch == "Избранное")
			maps = list(
				MAP_COLONY = 0,
				MAP_KURSK = 0,
				MAP_CAPITOL_HILL = 0)
		spawn(10)
			vote.initiate_vote("map", "MapSwap Process", TRUE, list(src, "swap"))
			return

/process/mapswap/proc/is_ready()
	. = FALSE
	if (config.allowedgamemodes == "BR")
		. = FALSE
	else if (ready)
		if (admin_triggered)
			. = TRUE
		// round will end soon (tm)
		else if (map && map.admins_triggered_roundend)
			. = TRUE
		else if (ticker.finished)
			. = TRUE
	return .

/process/mapswap/proc/swap(var/winner = "Karak")
	next_map_title = winner
	winner = uppertext(winner)
	if (!maps.Find(winner))
		winner = maps[rand(0,1)]
	if (!done)
		processes.python.execute("mapswap.py", list(winner))
		done = TRUE
		sleep(300)
		world << "<span class = 'danger'>Меняем карту!</span> <span class='notice'>Нажми сюда что бы переподключиться (обычно нажимают если не сработало переподключение): <b>byond://[world.internet_address]:[world.port]</b></span>"
	if (config.discordurl)
		world << "<span class='notice'>Наш дискорд: <b>[config.discordurl]</b></span>"


/process/gamemode
	var/ready = TRUE
	var/admin_triggered = FALSE
	var/finished_at = -1

/process/gamemode/setup()
	name = "gamemode"
	schedule_interval = 5 SECONDS
	start_delay = 5 SECONDS
	fires_at_gamestates = list()
	priority = PROCESS_PRIORITY_IRRELEVANT
	processes.gamemode = src
/process/gamemode/fire()
	// no SCHECK here
	if (is_ready())
		ready = FALSE
		vote.initiate_vote("gamemode", "Gamemode Process", TRUE, list(src, "swap"))

/process/gamemode/proc/is_ready()
	. = FALSE

	if (ready)
		if (admin_triggered)
			. = TRUE
		// round will end soon (tm)
		else if (map && map.admins_triggered_roundend)
			. = TRUE
		else if (ticker.finished)
			. = FALSE
	return .

/process/gamemode/proc/swap(var/winner = "Classic (Stone Age Start)")
	vote.voted_gamemode = winner
	round_progressing = TRUE
	ticker.delay_end = FALSE
	ticker.pregame_timeleft = 10
	if (vote.voted_gamemode == "Random")
		vote.voted_gamemode = pick("Classic (Stone Age Start)", "Auto-Research Mode", "Resource-Based Research", "Bronze Age (No Research)","Medieval (No Research)","Imperial Age (No Research)", "Industrial Age (No Research)", "Early Modern Age (No Research)", "WW2 Age (No Research)", "Modern Age (No Research)")

	map.gamemode = vote.voted_gamemode
	if (vote.voted_gamemode == "Classic (Stone Age Start)")
		world << "<big>Starting <b>Classic</b> mode. Starting epoch is the Stone Age, research active.</big>"
		map.ordinal_age = 0
		return

	if (vote.voted_gamemode == "Chad Mode")
		world << "<font color=#CECE00><big>Starting <b>Chad Mode</b>. Game epoch is the Stone Age, research inactive. Reduced starting items and more hostile conditions.</big></font>"
		map.ordinal_age = 0
		map.research_active = FALSE
		map.chad_mode = TRUE
		for (var/obj/effect/spawner/mobspawner/MS)
			MS.buff()
		for (var/obj/structure/wild/tree/T)
			T.amount *= 0.5
			T.amount = round(T.amount)
		for (var/obj/structure/wild/jungle/J)
			J.amount *= 0.5
			J.amount = round(J.amount)
		for (var/obj/structure/wild/palm/P)
			P.amount *= 0.5
			P.amount = round(P.amount)
		for (var/obj/structure/wild/junglebush/V)
			if (prob(75) && !istype(V,/obj/structure/wild/junglebush/chinchona))
				qdel(V)
		spawn(10)
			if (map.ID == MAP_NOMADS_ICE_AGE)
				for (var/turf/floor/dirt/winter/W)
					if (prob(40))
						W.ChangeTurf(/turf/floor/winter)
				for (var/turf/floor/winter/grass/WW)
					if (prob(40))
						WW.ChangeTurf(/turf/floor/winter)
			else if (map.ID == MAP_NOMADS_JUNGLE)
				for (var/turf/floor/dirt/winter/W)
					if (prob(40))
						W.ChangeTurf(/turf/floor/winter)
				for (var/turf/floor/winter/grass/WW)
					if (prob(40))
						WW.ChangeTurf(/turf/floor/winter)
		return

	if (vote.voted_gamemode == "Chad Mode +")
		world << "<font color=#CECE00><big>Starting <b>Chad Mode +</b>. Starting epoch is the Stone Age, research is done by sacrificing players. Reduced starting items and more hostile conditions.</big></font>"
		map.ordinal_age = 0
		map.research_active = TRUE
		map.chad_mode = TRUE
		map.chad_mode_plus = TRUE
		for (var/obj/effect/spawner/mobspawner/MS)
			MS.buff()
		for (var/obj/structure/wild/tree/T)
			T.amount *= 0.5
			T.amount = round(T.amount)
		for (var/obj/structure/wild/jungle/J)
			J.amount *= 0.5
			J.amount = round(J.amount)
		for (var/obj/structure/wild/palm/P)
			P.amount *= 0.5
			P.amount = round(P.amount)
		for (var/obj/structure/wild/junglebush/V)
			if (prob(75) && !istype(V,/obj/structure/wild/junglebush/chinchona))
				qdel(V)
		spawn(10)
			if (map.ID == MAP_NOMADS_ICE_AGE)
				for (var/turf/floor/dirt/winter/W)
					if (prob(40))
						W.ChangeTurf(/turf/floor/winter)
				for (var/turf/floor/winter/grass/WW)
					if (prob(40))
						WW.ChangeTurf(/turf/floor/winter)
			else if (map.ID == MAP_NOMADS_JUNGLE)
				for (var/turf/floor/dirt/winter/W)
					if (prob(40))
						W.ChangeTurf(/turf/floor/winter)
				for (var/turf/floor/winter/grass/WW)
					if (prob(40))
						WW.ChangeTurf(/turf/floor/winter)
		return

	else if (vote.voted_gamemode == "Bronze Age (No Research)")
		world << "<big>Starting <b>Bronze Age</b> mode. Game epoch is the Bronze Age, research inactive.</big>"
		map.ordinal_age = 1
		map.age = "313 B.C."
		map.age1_done = TRUE
		map.research_active = FALSE
		var/customresearch = 35
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return

	else if (vote.voted_gamemode == "Auto-Research Mode")
		world << "<big>Starting <b>Auto-Research mode</b>. Starting epoch is the Stone Age, research active but automatic.</big>"
		map.research_active = FALSE //well, it is, but we dont get research kits.
		map.autoresearch = TRUE
		map.ordinal_age = 0
		spawn(100)
			map.autoresearch_proc()
		return

	else if (vote.voted_gamemode == "Resource-Based Research")
		world << "<big>Starting <b>Resource-Based Research</b>. Starting epoch is the Stone Age, research active and requires the sale of items through <b>Research Desks</b>.</big>"
		map.research_active = FALSE //well, it is, but we dont get research kits.
		map.resourceresearch = TRUE
		map.ordinal_age = 0
		return

	else if (vote.voted_gamemode == "Bronze Age Start")
		world << "<big>Starting Classic mode with <b>Bronze Age</b> start. Starting epoch is the Bronze Age, research active.</big>"
		map.ordinal_age = 1
		map.age = "313 B.C."
		map.age1_done = TRUE
		map.research_active = TRUE
		var/customresearch = 35
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return
	else if (vote.voted_gamemode == "Medieval (No Research)")
		world << "<big>Starting <b>Medieval Age</b> mode. Game Epoch is the Medieval Age, research inactive.</big>"
		map.ordinal_age = 2
		map.age = "1013"
		map.age1_done = TRUE
		map.age2_done = TRUE
		map.research_active = FALSE
		var/customresearch = 50
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return
	else if (vote.voted_gamemode == "Imperial Age (No Research)")
		world << "<big>Starting <b>Imperial Age</b> mode. Game Epoch is the Imperial Age, research inactive.</big>"
		map.ordinal_age = 3
		map.age = "1713"
		map.age1_done = TRUE
		map.age2_done = TRUE
		map.age3_done = TRUE
		map.research_active = FALSE
		var/customresearch = 90
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return
	else if (vote.voted_gamemode == "Industrial Age (No Research)")
		world << "<big>Starting <b>Industrial Age</b> mode. Game Epoch is the Industrial Age, research inactive.</big>"
		map.ordinal_age = 4
		map.age = "1873"
		map.age1_done = TRUE
		map.age2_done = TRUE
		map.age3_done = TRUE
		map.age4_done = TRUE
		map.research_active = FALSE
		var/customresearch = 105
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return

	else if (vote.voted_gamemode == "Early Modern Age (No Research)")
		world << "<big>Starting <b>Early Modern Age</b> mode. Game Epoch is the EarLy Modern Age, research inactive.</big>"
		map.ordinal_age = 5
		map.age = "1903"
		map.age1_done = TRUE
		map.age2_done = TRUE
		map.age3_done = TRUE
		map.age4_done = TRUE
		map.age5_done = TRUE
		map.research_active = FALSE
		var/customresearch = 135
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return

	else if (vote.voted_gamemode == "WW2 Age (No Research)")
		world << "<big>Starting <b>WW2 Age</b> mode. Game Epoch is the WW2 Age, research inactive.</big>"
		map.ordinal_age = 6
		map.age = "1943"
		map.age1_done = TRUE
		map.age2_done = TRUE
		map.age3_done = TRUE
		map.age4_done = TRUE
		map.age5_done = TRUE
		map.age6_done = TRUE
		map.research_active = FALSE
		var/customresearch = 152
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return

	else if (vote.voted_gamemode == "Modern Age (No Research)")
		world << "<big>Starting <b>Modern Age</b> mode. Game Epoch is the Modern Age, research inactive.</big>"
		map.ordinal_age = 8
		map.age = "2013"
		map.age1_done = TRUE
		map.age2_done = TRUE
		map.age3_done = TRUE
		map.age4_done = TRUE
		map.age5_done = TRUE
		map.age6_done = TRUE
		map.age7_done = TRUE
		map.age8_done = TRUE
		map.research_active = FALSE
		var/customresearch = 230
		map.default_research = customresearch
		map.civa_research = list(customresearch,customresearch,customresearch,null)
		map.civb_research = list(customresearch,customresearch,customresearch,null)
		map.civc_research = list(customresearch,customresearch,customresearch,null)
		map.civd_research = list(customresearch,customresearch,customresearch,null)
		map.cive_research = list(customresearch,customresearch,customresearch,null)
		map.civf_research = list(customresearch,customresearch,customresearch,null)
		return
	/// TDM MODES ///
		//Easy Mode - damage mod 0.5, no delay, no fov, no medals//
	else if (vote.voted_gamemode == "Easy")
		world << "<font color='blue'><big>Лёгкий Режим</big><br>Без ограничений по респавну, 0.5 урон.</big></font>"
		config.disable_fov = TRUE
		config.no_respawn_delays = TRUE
		map.gamemode = "Easy"
		global_damage_modifier = 0.5
		return
	else if (vote.voted_gamemode == "Normal")
		world << "<font color='green'><big>Нормальный Режим</big><br>Без ограничений по респавну.</big></font>"
		config.disable_fov = TRUE
		config.no_respawn_delays = TRUE
		map.gamemode = "Normal"
		global_damage_modifier = 1
		return
	else if (vote.voted_gamemode == "Competitive")
		world << "<font color='yellow'><big>Соревновательный Режим</big><br>1.25 урон, время по респавну.</big></font>"
		config.disable_fov = TRUE
		config.no_respawn_delays = FALSE
		map.gamemode = "Competitive"
		global_damage_modifier = 1.15
		return
	else if (vote.voted_gamemode == "Hardcore")
		world << "<font color='red'><big>ХАРДКОРНЫЙ режим</big><br>Респавн отключён, 1.50 урон, ограничение на обзор включён, включены медали.</big></font>"
		config.disable_fov = FALSE
		config.no_respawn_delays = FALSE
		map.gamemode = "Hardcore"
		global_damage_modifier = 1.30
		return
		//Really Life - damage modifer 3.0, no hud, medals//
	else if (vote.voted_gamemode == "RealLive")
		world << "<font color='white'><big>Режим реальной жизни</big><br>Худ отключён, трёхкратный урон, ограничение на обзор включён, респавн отключён, включены медали.</big></font>"
		config.disable_fov = FALSE
		config.no_respawn_delays = FALSE
		map.gamemode = "RealLive"
		global_damage_modifier = 3
		map.disablehud = TRUE
		return
	/// CAPITOL MODES //
	else if (vote.voted_gamemode == "Siege")
		if (map && map.ID == MAP_CAPITOL_HILL)
			world << "<font color='yellow'><big>Siege</big><br>The <b>National Guard</b> must defend the Chambers of the <b>Congress</b> and the <b>Senate</b></big> for <b>40 minutes</b>!</font>"
		else if (map && map.ID == MAP_YELTSIN)
			world << "<font color='yellow'><big>Siege</big><br>The <b>Militia</b> must defend the <b>Parliamental Hall</b></big> until <b>40 minutes</b>!<br><font size=4>All factions have <b>10 minutes</b> to prepare before the battle.</font>"
		else if (map && map.ID == MAP_WACO)
			world << "<font color='yellow'><big>Siege</big><br>The <b>Branch Davidians</b> must defend the <b>Mount Carmel Compound</b></big> until <b>20 minutes</b have elapsed!<br><font size=4>All factions have <b>3 minutes</b> to prepare before the battle.</font>"
		config.disable_fov = TRUE
		config.no_respawn_delays = TRUE
		map.gamemode = "Siege"
		if (map && map.ID == MAP_WACO)
			for (var/turf/T in get_area_turfs(/area/caribbean/british/land/inside/objective))
				new /area/caribbean/no_mans_land/capturable(T)
		else
			for (var/turf/T in get_area_turfs(/area/caribbean/no_mans_land/capturable/one))
				new /area/caribbean/british/land/inside/objective(T)
			for (var/turf/T in get_area_turfs(/area/caribbean/no_mans_land/capturable/two))
				new /area/caribbean/british/land/inside/objective(T)
		return
	else if (vote.voted_gamemode == "Protect the VIP")
		if (map && map.ID == MAP_CAPITOL_HILL)
			world << "<font color='yellow'><big>Protect the VIP</big><br>The <b>HVT</b> is being guarded by the <b>FBI</b> inside the National Guard-controlled Capitol. Protestors must find him!<br>They have <b>25 minutes to do it!</b></big></font>"
		else if (map && map.ID == MAP_YELTSIN)
			world << "<font color='yellow'><big>Protect the VIP</big><br>The <b>HVT</b> is being guarded by the <b>KGB</b> inside the Militia-controlled Capitol. The Soviet Army must find them!<br>They have <b>40 minutes to do it!</b></big></font>"
		if (map && map.ID == MAP_WACO)
			world << "<font color='yellow'><big>Protect the VIP</big><br><b>David Koresh</b> is being guarded by the <b>Branch Davidians</b> inside the Mount Carmel Compound. The ATF must find him!<br>They have <b>20 minutes to do it!</b></big></font>"
		config.disable_fov = TRUE
		config.no_respawn_delays = TRUE
		map.gamemode = "Protect the VIP"
		return
	else if (vote.voted_gamemode == "Area Capture")
		world << "<font color='yellow'><big>Area Capture</big><br>Capture the <b>Congress</b> and the <b>Senate</b> to gain points. First team to <b>40 points</b> wins!</big></font>"
		config.disable_fov = TRUE
		config.no_respawn_delays = TRUE
		map.gamemode = "Area Capture"
		var/obj/map_metadata/capitol_hill/CP = map
		CP.points_check()
		return
	else if (vote.voted_gamemode == "Kills")
		if (map && map.ID == MAP_CAPITOL_HILL)
			world << "<font color='yellow'><big>Kills</big><br>The <b>American Militia</b> storms the  <b>National Guard</b>-controlled Capitol!</b></big></font>"
			var/obj/map_metadata/capitol_hill/CP = map
			CP.points_check()
		else if (map && map.ID == MAP_YELTSIN)
			world << "<font color='yellow'><big>Kills</big><br>The <b>Soviet Army</b> storms the <b>Militia</b>-controlled Capitol!</b></big></font>"
			var/obj/map_metadata/yeltsin/CP = map
			CP.points_check()
		config.disable_fov = TRUE
		config.no_respawn_delays = TRUE
		map.gamemode = "Kills"
		return

		/// WASTELAND MODES //
	else if (vote.voted_gamemode == "After the Fall")
		world << "<font color='yellow'><big>After the Fall</big><br>The world has long since become lost and desolate. Can you survive?</big><br><b>Wiki Guide: https://civ13.github.io/civ13-wiki/Civilizations_and_Nomads</b>"
		map.gamemode = "After the Fall"
		map.is_zombie = FALSE
		map.nonukes = TRUE
		return
	else if (vote.voted_gamemode == "Nuclear")
		world << "<font color='yellow'><big>Nuclear</big><br>To make things worse sometime between 2 and 3.5 hours a nuclear missle will be hitting somewhere nearby. Can you survive?</big><br><b>Wiki Guide: https://civ13.github.io/civ13-wiki/Civilizations_and_Nomads</b>"
		map.gamemode = "Nuclear"
		map.is_zombie = FALSE
		map.nonukes = FALSE
		return
	else if (vote.voted_gamemode == "Zombie Apocalypse")
		world << "<font color='yellow'><big>Zombie Apocalypse</big><br>Something has gone terribly wrong. Monsters roam the world and society has fallen. Can you survive?</big><br><b>Wiki Guide: https://civ13.github.io/civ13-wiki/Civilizations_and_Nomads</b>"
		map.gamemode = "Zombie Apocalypse"
		map.is_zombie = TRUE
		map.nonukes = TRUE
		return
