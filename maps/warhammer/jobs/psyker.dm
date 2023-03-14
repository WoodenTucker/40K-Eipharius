/mob/living/carbon/human/Stat()
	..()
	if(psyker == 1)
		stat(null, "Focus: [focus]/[max_focus]")
		H.verbs += list(
			/spell/targeted/heal_target,
			/spell/targeted/heal_target/sacrifice/minor,
			/spell/targeted/torment/screech,
			
		)



/mob/living/carbon/human/Life()
	..()
	var/regen = 0.5
	if(max_focus > 0)
		focus = max(0, min(focus + regen, max_focus))


/spell/targeted/subjugation/telepath
	name = "Subjugation"
	desc = "This spell temporarily subjugates a target's mind."
	feedback = "SJ"
	school = "illusion"
	charge_max = 500
	spell_flags = 0
	invocation_type =  SpI_NONE
	max_targets = 1
	level_max = list(Sp_TOTAL = 3, Sp_SPEED = 0, Sp_POWER = 3)
	amt_dizziness = 100
	amt_confused = 100
	amt_stuttering = 100

	compatible_mobs = list(/mob/living/carbon/human)

	hud_state = "wiz_subj"
	
/spell/targeted/torment/screech
	name = "Scream of the witch"
	desc = "Your scream is powered by the power of the warp, you can stun up to 3 people in a 5 meter area."
	feedback = "TM"
	school = "illusion"
	charge_max = 500
	spell_flags = 0
	invocation_type = SpI_EMOTE
	invocation = "screams incredibly loudly, somehow contorting the air around them."
	range = 5
	level_max = list(Sp_TOTAL = 1, Sp_SPEED = 0, Sp_POWER = 1)
	cooldown_min = 50
	message = "<span class='danger'>So much pain! All you can hear is the bubbling and popping of reality itself!</span>"

	max_targets = 3
	compatible_mobs = list(/mob/living/carbon/human)

	var/loss = 30

	hud_state = "wiz_horse"
