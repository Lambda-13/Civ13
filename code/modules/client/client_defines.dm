/client
	parent_type = /datum // black magic
	preload_rsc = PRELOAD_RSC // This is 0 so we can set it to an URL once the player logs in and have them download the resources from a different server.
	view = WORLD_VIEW
	var/view_num_x = WORLD_VIEW_NUM_X
	var/view_num_y = WORLD_VIEW_NUM_Y
	var/datum/admins/holder = null
	var/datum/admins/deadmin_holder = null
	var/buildmode		= FALSE

	var/last_message	= "" //Contains the last message sent by this client - used to protect against copy-paste spamming.
	var/last_message_count = FALSE //contins a number of how many times a message identical to last_message was sent.

		/////////
		//OTHER//
		/////////
	var/datum/preferences/prefs = null
	var/canmove = TRUE
	var/move_delay		= TRUE
	var/moving			= null
	var/adminobs		= null
	var/area			= null

	var/adminhelped = FALSE
	var/mentorhelped = FALSE
		///////////////
		//SOUND STUFF//
		///////////////
	var/ambience_playing = null
	var/played			= FALSE

		////////////
		//SECURITY//
		////////////
	// comment out the line below when debugging locally to enable the options & messages menu
	//control_freak = TRUE

	var/received_irc_pm = -99999
	var/irc_admin			//IRC admin that spoke with them last.
	var/mute_irc = FALSE


		////////////////////////////////////
		//things that require the database//
		////////////////////////////////////
	var/player_age = 0	//So admins know why it isn't working - Used to determine how old the account is - in days.

	var/next_normal_respawn = -1
	var/respawn_count = 0

	var/last_ping = 0

	var/status_tabs = TRUE

	var/saved_slot = 1

	var/is_active_non_observer = TRUE

	var/next_calculate_is_active_non_observer = -1

	var/movement_busy = FALSE

	var/fullscreen = FALSE

	// Transparent image for maptext tooltip
	var/obj/screen/tooltip = null

	// right click menu no longer shows up
//	show_popup_menus = FALSE

/client/authenticate = FALSE