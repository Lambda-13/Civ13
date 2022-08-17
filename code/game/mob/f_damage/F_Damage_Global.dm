// Global F_Damage namespace.
F_Damage
	var
		// Alignment bad-boys.
		F_Damage_Horizontal_Alignment/left/LEFT_ALIGN 		= new()
		F_Damage_Horizontal_Alignment/center/CENTER_ALIGN 	= new()
		F_Damage_Horizontal_Alignment/right/RIGHT_ALIGN 	= new()


var/F_Damage/F_Damage = new()

//Debug
/client/proc/F_Little_Hit()
	set name = "Float Message - Little Hit"
	set category = "Debug"
	set desc = "Causes up to 1000 damage to you."
	F_damage(src, rand(-1000, -1), "#ff0000")

/client/proc/F_Little_Heal()
	set name = "Float Message - Little Heal"
	set category = "Debug"
	set desc = "Heals up to 1000 damage to you."
	F_damage(src, rand(1,1000), "#77ff00")

/client/proc/Big_Hit()
	set name = "Float Message - Big Hit"
	set category = "Debug"
	set desc = "Does a crapload of damage to you.  Generally shows in scientific notation."
	F_damage(src, rand(-100000, -10000000), "#ff0")

/client/proc/Big_Heal()
	set name = "Float Message - Big Heal"
	set category = "Debug"
	set desc = "Heals you a bunch.  Generally shows in scientific notation."
	F_damage(src, rand(100000, 10000000), rgb(0,255,255))

/client/proc/Left_Align()
	set name = "Float Message - Left Align"
	set category = "Debug"
	F_damage(src, rand(1,1000), "#ff0", F_Damage.LEFT_ALIGN)

/client/proc/Right_Align()
	set name = "Float Message - Right Align"
	set category = "Debug"
	F_damage(src, rand(1,1000), "#ff0", F_Damage.RIGHT_ALIGN)

/client/proc/Big_Test_Left()
	set name = "Float Message - Big Left Align"
	set category = "Debug"
	for(var/I in 1 to 1000)
		Left_Align()

/client/proc/Big_Test_Right()
	set name = "Float Message - Big Right Align"
	set category = "Debug"
	for(var/I in 1 to 1000)
		Right_Align()