//! ## Timing subsystem
/**
  * Don't run if there is an identical unique timer active
  *
  * if the arguments to addtimer are the same as an existing timer, it doesn't create a new timer,
  * and returns the id of the existing timer
  */
#define TIMER_UNIQUE			(1<<0)

///For unique timers: Replace the old timer rather then not start this one
#define TIMER_OVERRIDE			(1<<1)

/**
  * Timing should be based on how timing progresses on clients, not the server.
  *
  * Tracking this is more expensive,
  * should only be used in conjuction with things that have to progress client side, such as
  * animate() or sound()
  */
#define TIMER_CLIENT_TIME		(1<<2)

///Timer can be stopped using deltimer()
#define TIMER_STOPPABLE			(1<<3)

///prevents distinguishing identical timers with the wait variable
///
///To be used with TIMER_UNIQUE
#define TIMER_NO_HASH_WAIT		(1<<4)

///Loops the timer repeatedly until qdeleted
///
///In most cases you want a subsystem instead, so don't use this unless you have a good reason
#define TIMER_LOOP				(1<<5)

///Empty ID define
#define TIMER_ID_NULL -1

//! ## Initialization subsystem

///New should not call Initialize
#define INITIALIZATION_INSSATOMS 0
///New should call Initialize(TRUE)
#define INITIALIZATION_INNEW_MAPLOAD 2
///New should call Initialize(FALSE)
#define INITIALIZATION_INNEW_REGULAR 1


// Subsystem defines.
// All in one file so it's easier to see what everything is relative to.

#define SS_INIT_TICKER_SPAWN		999
#define SS_INIT_TIMER				100
#define SS_INIT_INPUT				85
#define SS_INIT_RUST				26
#define SS_INIT_UNSPECIFIED			0


#define SS_PRIORITY_INPUT			1000
#define SS_PRIORITY_TIMER			700
#define SS_PRIORITY_UNSPECIFIED		30


#define INITIALIZE_HINT_NORMAL		0  //Nothing happens
#define INITIALIZE_HINT_LATELOAD	1  //Call LateInitialize
#define INITIALIZE_HINT_QDEL		2  //Call qdel on the atom
#define INITIALIZE_HINT_ROUNDSTART	3  //Call LateInitialize on roundstart

// SS runlevels

#define RUNLEVEL_INIT 0
#define RUNLEVEL_LOBBY 1
#define RUNLEVEL_SETUP 2
#define RUNLEVEL_GAME 4
#define RUNLEVEL_POSTGAME 8

#define RUNLEVELS_DEFAULT (RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME)


#define COMPILE_OVERLAYS(A) \
	do {\
		var/list/ad = A.add_overlays;\
		var/list/rm = A.remove_overlays;\
		var/list/po = A.priority_overlays;\
		if(LAZYLEN(rm)){\
			A.overlays -= rm;\
			rm.Cut();\
		}\
		if(LAZYLEN(ad)){\
			A.overlays |= ad;\
			ad.Cut();\
		}\
		if(LAZYLEN(po)){\
			A.overlays |= po;\
		}\
		A.flags_atom &= ~OVERLAY_QUEUED;\
	} while (FALSE)


/**
	Create a new timer and add it to the queue.
	* Arguments:
	* * callback the callback to call on timer finish
	* * wait deciseconds to run the timer for
	* * flags flags for this timer, see: code\__DEFINES\subsystems.dm
*/
#define addtimer(args...) _addtimer(args, file = __FILE__, line = __LINE__)

///type and all subtypes should always immediately call Initialize in New()
#define INITIALIZE_IMMEDIATE(X) ##X/New(loc, ...){\
    ..();\
    if(!(flags_atom & INITIALIZED)) {\
        args[1] = TRUE;\
        SSatoms.InitAtom(src, args);\
    }\
}
