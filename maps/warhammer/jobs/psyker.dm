/mob/living/carbon/human/Stat()
	..()
	if(psyker == 1)
		stat(null, "Focus: [focus]/[max_focus]")
		verbs += list(
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
	
	
	
/spell/targeted/heal_target/sacrifice/minor
	name = "Sacrifice"
	desc = "This spell heals the target by a moderate amound of damage, but hurts you."
	feedback = "SF"
	spell_flags = SELECTABLE
	invocation = "Thy wounds be made mine!"
	charge_type = Sp_HOLDVAR
	holder_var_type = "fireloss"
	holder_var_amount = 50
	level_max = list(Sp_TOTAL = 1, Sp_SPEED = 0, Sp_POWER = 1)
	amt_dam_brute = -100
	amt_dam_fire = -100
	amt_dam_oxy = -100
	amt_dam_tox = -10
	amt_blood  = 560
	hud_state = "gen_dissolve"

/spell/targeted/heal_target/sacrifice/empower_spell()
	if(!..())
		return 0

	amt_organ = 25
	amt_brain  = -25
	amt_radiation  = -100



	return "You will now heal organ and brain damage, as well as virtually purge all radiation."
	
	
	
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
	compatible_mobs = list(/mob/living/carbon)
	loss = 30
	hud_state = "wiz_horse"
