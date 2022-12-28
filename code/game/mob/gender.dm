
/var/list/gender_datums = list()

/hook/startup/proc/populate_gender_datum_list()
	for (var/type in typesof(/datum/gender))
		var/datum/gender/G = new type
		gender_datums[G.key] = G
	return TRUE

/datum/gender
	var/key  = "plural"
	var/He   = "They"
	var/he   = "they"
	var/His  = "Their"
	var/his  = "their"
	var/him  = "them"
	var/has  = "have"
	var/is   = "are"
	var/does = "do"
	var/He_ru = "Он"
	var/he_ru = "он"
	var/His_ru = "Его"
	var/his_ru = "его"

/datum/gender/male
	key  = "male"

	He   = "He"
	he   = "he"
	His  = "His"
	his  = "his"
	him  = "him"
	has  = "has"
	is   = "is"
	does = "does"
	He_ru = "Он"
	he_ru = "он"
	His_ru = "Его"
	his_ru = "его"

/datum/gender/female
	key  = "female"

	He   = "She"
	he   = "she"
	His  = "Her"
	his  = "her"
	him  = "her"
	has  = "has"
	is   = "is"
	does = "does"
	He_ru = "Она"
	he_ru = "она"
	His_ru = "Её"
	his_ru = "её"

/datum/gender/neuter
	key = "neuter"

	He   = "It"
	he   = "it"
	His  = "Its"
	his  = "its"
	him  = "it"
	has  = "has"
	is   = "is"
	does = "does"
	He_ru = "Оно"
	he_ru = "оно"
	His_ru = "Его"
	his_ru = "его"
