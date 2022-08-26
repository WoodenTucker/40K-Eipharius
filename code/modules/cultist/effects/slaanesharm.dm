/mob/living/carbon/human/proc/slannyarm()
	set category = "Ruinous Powers"
	set name = "Mutate Arm"
	set desc = "Embrace your hunger, your lust, your desire."
	if(!ishuman(src))
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this while you're dead.</span>")
		return
	var/obj/item/material/sword/slanarm/arm = locate() in src
	if(!arm)
		arm = new(src)
	if(arm.toggled)
		if(istype(get_active_hand(), /obj/item/material/sword/slanarm)) //Not the nicest way to do it, but eh
			visible_message("<span class='warning'>  [usr] speedily transforms their arm back to normal!</span>", "<span class='notice'>Your arm changes back to normal!</span>", "<span class='warning>What was that sound?</span>")
			arm.forceMove(src)
			update_icon()
			icon_state = initial(icon_state)
			to_chat(usr,"You hide your mutated arm!")
			arm.toggled = FALSE
			adjustStaminaLoss(50)
	else
		visible_message("[src]'s arm rapidly mutates into a terrifying blade!")
		usr.put_in_hands(arm)
		arm.toggled = TRUE


/obj/item/material/sword/slanarm
	name = "mutated arm"
	desc = "The arm lurches towards living beings, insatiable in its thirst for pain."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "slanarm"
	item_state = "slanarm"
	attack_verb = list("stabbed", "impales", "rends", "tears", "flays", "rips")
	force = 5
	block_chance = 45
	hitsound = 'sound/effects/slanattack.ogg'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|HEAD
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)
	w_class = ITEM_SIZE_HUGE
	grab_sound = 'sound/effects/slanarm.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	drop_sound = 'sound/effects/slanarm.ogg'
	var/toggled = FALSE

/obj/item/material/sword/slanarm/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)

/obj/item/material/sword/slanarm/attack(mob/living/carbon/C as mob, var/mob/living/carbon/human/user as mob) //
	user.setClickCooldown(20)
	var/hit_zone = ran_zone()
	if(user.a_intent == I_HELP)
		visible_message("<font color='#800080'>[user] lustfully slaps [C] with their mutated arm, leaving a red mark but no real damage.</font>")
		playsound(usr, 'sound/weapons/succubus.ogg', 100, 1, 1)
	else
		playsound(usr, 'sound/effects/slanattack.ogg', 100, 1, 1)
		C.apply_damage(rand(35,50), BRUTE, hit_zone, 0,(DAM_SHARP|DAM_EDGE))
		to_chat(C, "<span class='warning'>[user] mangles your body with their mutated arm. It causes you pain on a level you didn't know existed.</span>")
		if(C.gender == MALE)
			playsound(usr, 'sound/voice/Screams_Male_3.ogg', 100, 1, 1)
		else if(C.gender == FEMALE)
			playsound(usr, 'sound/voice/Screams_Woman_1.ogg', 100, 1, 1)
		..()
