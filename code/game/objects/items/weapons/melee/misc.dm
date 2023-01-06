/obj/item/melee/whip
	name = "whip"
	desc = "A generic whip."
	icon_state = "chain"
	item_state = "chain"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 10
	armor_penetration = 6
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")

/obj/item/melee/whip/abyssal
	name = "abyssal whip"
	desc = "A weapon from the abyss. Requires 70 attack to wield."
	icon_state = "whip"
	item_state = "whip"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 16 //max hit with 60 strength and no equipment. Duel Arena no No forfeit - Snapshot
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")

/obj/item/melee/whip/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	icon_state = "chain"
	item_state = "whip"

/obj/item/material/sword/replica/officersword
	name = "fleet officer's sword"
	desc = "A polished sword issued to officers of the fleet."
	icon_state = "officersword"
	item_state = "officersword"
	slot_flags = SLOT_BELT
	applies_material_colour = FALSE

/obj/item/material/sword/replica/officersword/marine
	name = "marine NCO's sword"
	desc = "A polished sword issued to SCG Marine NCOs."
	icon_state = "marinesword"

/obj/item/material/sword/replica/officersword/marineofficer
	name = "marine officer's sword"
	desc = "A curved sword issued to SCG Marine officers."
	icon_state = "marineofficersword"
	item_state = "marineofficersword"

/obj/item/material/sword/replica/officersword/pettyofficer
	name = "chief petty officer's cutlass"
	desc = "A polished cutlass issued to chief petty officers of the fleet."
	icon_state = "pettyofficersword"
	item_state = "pettyofficersword"

/obj/item/material/mekmace
	name = "scrap mace"
	desc = "A mace normally used by the ork meks, made of scrap."
	str_requirement = 13
	armor_penetration = 35 //Crushing damage
	force = 35
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mekmace"
	item_state = "mekmace"

/obj/item/material/mekmace/afterattack(atom/target, mob/user, proximity_flag, click_parameters)

	if(istype(target, /obj/item/stack/material))
		var/obj/item/stack/material/M = target
		to_chat(user, "<span class='notice'> You start making scrap. </span>")
		if(do_after(user, 30))
			to_chat(user, "<span class='notice'> You make scrap using the [target].</span>")
			new /obj/item/stack/material/scrap(target.loc, M.amount)
			del(target)
		else
			to_chat(user, "<span class='notice'> You stop making scrap.</span>")
	. = ..()

/obj/item/melee/whip/lashoftorment //my little POGchamp pain harvester
	name = "lash of torment"
	desc = "Made up of lascivious coils and barbed hooks, a Lash of Torment moves with a mind of its own."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "lash"
	item_state = "lash"
	hitsound = 'sound/weapons/whip.ogg'
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	armor_penetration = 25
	force = 5
	block_chance = 35
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")
	var/slan = 1

//code copypasted from the mutated arm
/obj/item/melee/whip/lashoftorment/attack(mob/living/carbon/C as mob, var/mob/living/carbon/human/user as mob) //
	user.setClickCooldown(5)
	var/hit_zone = ran_zone()
	if(!isheretic(user))
		return
	if(C.stat == DEAD)
		to_chat(user,"<font color='#800080'>There is no pain to be harvested from the dead, a waste...</font>")
	if(user.a_intent == I_HELP)
		visible_message("<font color='#800080'>[user] lustfully whips [C] , leaving a red mark.</font>")
		playsound(usr, 'sound/weapons/succubus.ogg', 100, 1, 1)
	else
		playsound(usr, 'sound/effects/slanattack.ogg', 100, 1, 1)
		C.apply_damage(rand(30,40), BRUTE, hit_zone, 0,(DAM_SHARP|DAM_EDGE))
		to_chat(C, "<span class='warning'>[user] mangles your body with the whip. It causes you pain on a level you didn't know existed.</span>")
		if(C.gender == MALE)
			playsound(usr, 'sound/voice/Screams_Male_3.ogg', 100, 1, 1)
		else if(C.gender == FEMALE)
			playsound(usr, 'sound/voice/Screams_Woman_1.ogg', 100, 1, 1)
		..()


/obj/item/melee/whip/lashoftorment/pickup(var/mob/living/carbon/human/user)
	if(!isheretic(user))
		to_chat(user, "<span class='warning'>An overwhelming feeling of dread comes over you as you pick up the [src]. It would be wise to be rid of this quickly.</span>")
		user.make_dizzy(120)
		playsound(usr, 'sound/effects/whispers1.ogg', 100, 0, -1)
