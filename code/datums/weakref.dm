/datum
	/**
	  * Tick count time when this object was destroyed.
	  *
	  * If this is non zero then the object has been garbage collected and is awaiting either
	  * a hard del by the GC subsystme, or to be autocollected (if it has no references)
	  */
	var/gc_destroyed

	/// Active timers with this datum as the target
	var/list/active_timers

	/// Datum level flags
	var/datum_flags = NONE

	var/weakref

/datum/Destroy()
	weakref = null // Clear this reference to ensure it's kept for as brief duration as possible.
	var/list/timers = active_timers
	active_timers = null
	for(var/thing in timers)
		var/datum/timedevent/timer = thing
		if (timer.spent)
			continue
		qdel(timer)
	. = ..()

//obtain a weak reference to a datum
/proc/weakref(datum/D)
	if (D.gcDestroyed)
		return
	if (!D.weakref)
		D.weakref = new /datum/weakref(D)
	return D.weakref

/datum/weakref
	var/ref

/datum/weakref/New(datum/D)
	ref = "\ref[D]"

/datum/weakref/Destroy()
	// A weakref datum should not be manually destroyed as it is a shared resource,
	//  rather it should be automatically collected by the BYOND GC when all references are gone.
	return FALSE

/datum/weakref/proc/resolve()
	var/datum/D = locate(ref)
	if (D && D.weakref == src)
		return D
	return null
