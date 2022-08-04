/obj/item/toothpuller
	name = "pliars of truth"
	desc = "A form of modified wirecutters. Specially designed by the Ordos Hereticus to inflict maximum pain while extracting teeth. It is sure to get to the truth."
	icon = 'icons/obj/torturetools.dmi'
	icon_state = "teefrippa"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 3.0
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 80)
	center_of_mass = "x=18;y=10"
	attack_verb = list("pinched", "nipped")
	sharp = TRUE
	grab_sound = 'sound/items/handle/wirecutter_pickup.ogg'
	drop_sound = 'sound/items/handle/wirecutter_drop.ogg'



/obj/item/toothpuller/attack(mob/living/carbon/C as mob, mob/living/user as mob)
	if(user.a_intent == I_HELP && (C.handcuffed) && (istype(C.handcuffed, /obj/item/handcuffs/cable)))
		usr.visible_message("\The [usr] cuts \the [C]'s restraints with \the [src]!",\
		"You cut \the [C]'s restraints with \the [src]!",\
		"You hear cable being cut.")
		C.handcuffed = null
		if(C.buckled && C.buckled.buckle_require_restraints)
			C.buckled.unbuckle_mob()
		C.update_inv_handcuffed()
		return

	//Tearing out teeth to find the troof
	if(ishuman(C) && user.zone_sel.selecting == "mouth")
		var/mob/living/carbon/human/H = C
		var/obj/item/organ/external/head/O = locate() in H.organs
		if(!O || !O.get_teeth())
			to_chat(user, "<span class='notice'>[H] doesn't have any teeth left!</span>")
			return
		if(!user.doing_something)
			user.doing_something = 1
			H.visible_message("<span class='danger'>[user] tries to tear off [H]'s tooth with [src]!</span>",
								"<span class='danger'>[user] tries to tear off your tooth with [src]!</span>")
			if(do_after(user, 50))
				if(!O || !O.get_teeth()) return
				var/obj/item/stack/teeth/E = pick(O.teeth_list)
				if(!E || E.zero_amount()) return
				var/obj/item/stack/teeth/T = new E.type(H.loc, 1)
				E.use(1)
				T.add_blood(H)
				E.zero_amount() //Try to delete the teeth
				H.visible_message("<span class='danger'>[user] tears off [H]'s tooth with [src]!</span>",
								"<span class='danger'>[user] tears off your tooth with [src]!</span>")

				H.apply_damage(rand(1, 3), BRUTE, O)
				H.custom_pain("[pick("OH GOD YOUR MOUTH HURTS SO BAD!", "OH GOD WHY!", "OH GOD YOUR MOUTH!")]", 100, affecting = O)

				playsound(H, 'sound/effects/gore/trauma3.ogg', 40, 1, 1) //And out it goes.
				GLOB.teeth_lost++
				if(H.rage >= 2)
					if(prob(20))
						playsound(src, 'sound/effects/khorne.ogg', 100, 1, 1)
						H.say("KHORNE WILL TEAR YOUR CORPSE EMPEROR LIMB FROM LIMB!")
				if(H.intrigue >= 2)
					if(prob(20)) //tzeentch boys are a bit softer than khorne/nurgle lads
						H.say("THIS IS ALL ACCORDING TO HIS PLAN!")
				if(H.lust >= 2)
					H.happiness += 1 //Slaanesh boys enjoy the torture.
					H.apply_damage(rand(-1, -3), BRUTE, O)
					to_chat(H, "The Prince of Pleasure protects his sevants from pain. What would be excruciating is turned to pleasure.")
				if(H.decay >= 2)
					if(prob(20))
						playsound(src, 'sound/effects/fornurgle.ogg', 100, 1, 1)
						H.say("FATHER NURGLE PROTECT YOUR ACOLYTE! BLIGHT THESE CORPSE-WORSHIPPPERS!")

				user.doing_something = 0
			else
				to_chat(user, "<span class='notice'>Your attempt to pull out a tooth fails...</span>")
				user.doing_something = 0
				return
		else
			to_chat(user, "<span class='notice'>You are already trying to pull out a tooth!</span>")
		return
/obj/item/halter
	name = "adrenergic reuptake inhibitor"
	desc = "The Inquisition's brightest chemists have devised this adrenergic reuptake inhibitor as a suitable tool to reveal followers of Slaanesh. It ceases all feeling causing them more discomfort than one could imagine."
	icon = 'icons/obj/torturetools.dmi'
	icon_state = "halter"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 1
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL
	center_of_mass = "x=18;y=10"
	attack_verb = list("jabbed", "nipped")
	sharp = TRUE
	grab_sound = 'sound/items/handle/wirecutter_pickup.ogg'
	drop_sound = 'sound/items/handle/wirecutter_drop.ogg'

/obj/item/halter/attack(mob/living/carbon/human/C as mob, var/mob/living/carbon/human/user as mob)
	user.setClickCooldown(20)
	if(C.stat == DEAD)
		to_chat(user,"This would be wasted on the dead.")
	if(user.a_intent == I_HELP)
		visible_message("[user] threatens [C] with the [src] if they do not talk!")
	else
		playsound(src, 'sound/effects/autochisel.ogg', 100, 1, 1)
		C.apply_damage(rand(5,8), TOX, BP_APPENDIX)
		to_chat(C, "<span class='warning'>[user] momentarily connects [C] to the [src], causing complete cessation of all feeling and thought.</span>")
		if(C.lust >= 2)
			if(prob(20))
				playsound(src, 'sound/effects/slanlaugh.ogg', 100, 1, 1)
				C.say("GIVE IT BACK! I CAN'T FEEL IT ANYMORE! GIVE IT BACK!")
			else
				to_chat(C, "<font color='#800080'>You manage to resist torture! ...This time")
				return

		..()
