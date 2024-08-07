/spell/radiant_aura
	name = "Radiant aura"
	desc = "Form a protective layer of light around you, making you immune to laser fire."
	school = "transmutation"
	feedback = "ra"
	invocation_type = SpI_EMOTE
	invocation = "conjures a sphere of fire around themselves."
	school = "conjuration"
	charge_max = 300
	cooldown_min = 100
	level_max = list(Sp_TOTAL = 2, Sp_SPEED = 2, Sp_POWER = 0)
	cast_sound = 'sound/effects/snap.ogg'
	duration = 600
	hud_state = "gen_immolate"

/spell/radiant_aura/choose_targets()
	return list(holder)

/spell/radiant_aura/cast(var/list/targets, var/mob/user)
	var/obj/aura/radiant_aura/A = new(user)
	spawn(duration)
		qdel(A)

/spell/radiant_aura/psyker
	name = "Radiant aura"
	desc = "Form a protective layer of light around you, making you immune to laser fire."
	school = "transmutation"
	feedback = "rp"
	invocation_type = SpI_EMOTE
	invocation = "conjures a sphere of fire around themselves."
	school = "conjuration"
	charge_max = 300
	cooldown_min = 10
	level_max = list(Sp_TOTAL = 2, Sp_SPEED = 2, Sp_POWER = 0)
	cast_sound = 'sound/effects/snap.ogg'
	duration = 600 //Lasts 60 seconds.
	hud_state = "gen_immolate"

/spell/radiant_aura/psyker/choose_targets()
	return list(holder)

/spell/radiant_aura/psyker/cast(var/list/targets, var/mob/user)
	var/obj/aura/radiant_aura/psyker/A = new(user)
	spawn(duration)
		qdel(A)

/spell/radiant_aura/psyker/ultimate
	name = "Improved Radiant aura"
	desc = "Form a greater protective layer of light around you, making you immune to weapons fire."
	school = "transmutation"
	feedback = "rp"
	invocation_type = SpI_EMOTE
	invocation = "conjures a sphere of fire around themselves."
	school = "conjuration"
	charge_max = 300
	cooldown_min = 10
	level_max = list(Sp_TOTAL = 2, Sp_SPEED = 2, Sp_POWER = 0)
	cast_sound = 'sound/effects/snap.ogg'
	duration = 600 //Lasts 60 seconds.
	hud_state = "gen_immolate"

/spell/radiant_aura/psyker/ultimate/choose_targets()
	return list(holder)

/spell/radiant_aura/psyker/ultimate/cast(var/list/targets, var/mob/user)
	var/obj/aura/radiant_aura/psyker/ultimate/A = new(user)
	spawn(duration)
		qdel(A)
