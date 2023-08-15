/obj/item/melee/energy
	var/active = 0
	var/active_force
	var/active_throwforce
	icon = 'icons/obj/weapons/melee/energy.dmi'
	sharp = 0
	edge = 0
	armor_penetration = 50
	atom_flags = ATOM_FLAG_NO_BLOOD

/obj/item/melee/energy/proc/activate(mob/living/user)
	anchored = 1
	if(active)
		return
	active = 1
	force = active_force
	throwforce = active_throwforce
	sharp = 1
	edge = 1
	slot_flags |= SLOT_DENYPOCKET
	playsound(user, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/melee/energy/proc/deactivate(mob/living/user)
	anchored = 0
	if(!active)
		return
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)
	active = 0
	force = initial(force)
	throwforce = initial(throwforce)
	sharp = initial(sharp)
	edge = initial(edge)
	slot_flags = initial(slot_flags)

/obj/item/melee/energy/attack_self(mob/living/user as mob)
	if (active)
		if ((CLUMSY in user.mutations) && prob(50))
			user.visible_message("<span class='danger'>\The [user] accidentally cuts \himself with \the [src].</span>",\
			"<span class='danger'>You accidentally cut yourself with \the [src].</span>")
			user.take_organ_damage(5,5)
		deactivate(user)
	else
		activate(user)

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	add_fingerprint(user)
	return

/obj/item/melee/energy/get_storage_cost()
	if(active)
		return ITEM_SIZE_NO_CONTAINER
	return ..()

/*
 * Energy Axe
 */
/obj/item/melee/energy/axe
	name = "energy axe"
	desc = "An energised battle axe."
	icon_state = "axe0"
	active_force = 35
	active_throwforce = 35
	force = 20
	throwforce = 10
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	atom_flags = ATOM_FLAG_NO_BLOOD
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	origin_tech = list(TECH_MAGNET = 3, TECH_COMBAT = 4)
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	sharp = 1
	edge = 1

/obj/item/melee/energy/axe/activate(mob/living/user)
	..()
	icon_state = "axe1"
	to_chat(user, "<span class='notice'>\The [src] is now energised.</span>")

/obj/item/melee/energy/axe/deactivate(mob/living/user)
	..()
	icon_state = initial(icon_state)
	to_chat(user, "<span class='notice'>\The [src] is de-energised. It's just a regular axe now.</span>")

/obj/item/melee/energy/tau
	name = "Tau Blade"
	desc = "A taU blade using high heated plasma to cut through things."
	icon_state = "tau0"
	item_state = "EB-knife"
	active_force = 26
	active_throwforce = 21
	force = 24
	throwforce = 10
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL //ITS A KNIFE
	atom_flags = ATOM_FLAG_NO_BLOOD
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	origin_tech = list(TECH_MAGNET = 3, TECH_COMBAT = 4)
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	sharp = 1
	edge = 1 //its a fucking powerknife essentially

/obj/item/melee/energy/tau/activate(mob/living/user)
	..()
	icon_state = "tau"
	to_chat(user, "<span class='notice'>\The [src] is now energised.</span>")

/obj/item/melee/energy/tau/deactivate(mob/living/user)
	..()
	icon_state = initial(icon_state)
	to_chat(user, "<span class='notice'>\The [src] is de-energised. It's just a regular knife now.</span>")

/*
 * Energy Sword
 */
/obj/item/melee/energy/sword
	color
	name = "energy sword"
	desc = "May the force be within you."
	icon_state = "sword0"
	active_force = 30
	active_throwforce = 20
	force = 3
	throwforce = 5
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	atom_flags = ATOM_FLAG_NO_BLOOD
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)
	sharp = 1
	edge = 1
	var/blade_color

/obj/item/melee/energy/sword/dropped(var/mob/user)
	..()
	if(!istype(loc,/mob))
		deactivate(user)

/obj/item/melee/energy/sword/New()
	blade_color = pick("red","blue","green","purple")

/obj/item/melee/energy/sword/green/New()
	blade_color = "green"

/obj/item/melee/energy/sword/red/New()
	blade_color = "red"

/obj/item/melee/energy/sword/blue/New()
	blade_color = "blue"

/obj/item/melee/energy/sword/purple/New()
	blade_color = "purple"

/obj/item/melee/energy/sword/activate(mob/living/user)
	if(!active)
		to_chat(user, "<span class='notice'>\The [src] is now energised.</span>")
	..()
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	icon_state = "sword[blade_color]"

/obj/item/melee/energy/sword/deactivate(mob/living/user)
	if(active)
		to_chat(user, "<span class='notice'>\The [src] deactivates!</span>")
	..()
	attack_verb = list()
	icon_state = initial(icon_state)

/obj/item/melee/energy/sword/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(active && default_parry_check(user, attacker, damage_source) && prob(50))
		user.visible_message("<span class='danger'>\The [user] parries [attack_text] with \the [src]!</span>")

		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, 'sound/weapons/blade1.ogg', 50, 1)
		return 1
	return 0

/obj/item/melee/energy/sword/pirate
	name = "energy cutlass"
	desc = "Arrrr matey."
	icon_state = "cutlass0"

/obj/item/melee/energy/sword/pirate/activate(mob/living/user)
	..()
	icon_state = "cutlass1"


/obj/item/melee/energy/sword/bogsword
	name = "alien sword"
	desc = "A strange, strange energy sword."
	icon_state = "sword0"

/obj/item/melee/energy/sword/bogswrd/activate(mob/living/user)
	..()
	icon_state = "bog_sword"


/*
 *Energy Blade
 */

//Can't be activated or deactivated, so no reason to be a subtype of energy
/obj/item/melee/energy/blade
	name = "energy blade"
	desc = "A concentrated beam of energy in the shape of a blade. Very stylish... and lethal."
	icon_state = "blade"
	force = 40 //Normal attacks deal very high damage - about the same as wielded fire axe
	armor_penetration = 100
	sharp = 1
	edge = 1
	anchored = 1    // Never spawned outside of inventory, should be fine.
	throwforce = 1  //Throwing or dropping the item deletes it.
	throw_speed = 1
	throw_range = 1
	w_class = ITEM_SIZE_TINY //technically it's just energy or something, I dunno
	atom_flags = ATOM_FLAG_NO_BLOOD
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	var/mob/living/creator
	var/datum/effect/effect/system/spark_spread/spark_system

/obj/item/melee/energy/blade/New()
	..()
	spark_system = new /datum/effect/effect/system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

/obj/item/melee/energy/blade/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/melee/energy/blade/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/melee/energy/blade/get_storage_cost()
	return ITEM_SIZE_NO_CONTAINER

/obj/item/melee/energy/blade/attack_self(mob/user as mob)
	user.drop_from_inventory(src)
	spawn(1) if(src) qdel(src)

/obj/item/melee/energy/blade/dropped()
	..()
	spawn(1) if(src) qdel(src)

/obj/item/melee/energy/blade/Process()
	if(!creator || loc != creator || (creator.l_hand != src && creator.r_hand != src))
		// Tidy up a bit.
		if(istype(loc,/mob/living))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		spawn(1) if(src) qdel(src)













//WARHAMMER 40 THOUSAND IMPERIAL BITCHES WITH BOLTERS!


/obj/item/melee/energy/powersword //basis for other power weapons
	name = "Power Sword"
	desc = "A adamantium sword with a void shield generator inside of it, the void shield will cut through almost anything that it touches when its on, so make sure you don't cut yourself."
	item_state = "powersword"
	icon_state = "powersword"
	wielded_icon = "powersword-w"
	active_force = 43 //should be enough to cut off most limbs
	active_throwforce = 18
	icon = 'icons/obj/guardpower_gear_32xOBJ.dmi'
	force = 34
	armor_penetration = 30
	throwforce = 15
	throw_speed = 1
	throw_range = 4
	block_chance = 30
	sales_price = 0
	weapon_speed_delay = 9 //2 seconds
	edge = 1
	sharp = 1
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	atom_flags = 0
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	origin_tech = list(TECH_MAGNET = 6, TECH_COMBAT = 6)
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut", "slashed", "sliced")
	hitsound = "slash_sound"
	parry_sounds = list('sound/weapons/bladeparry1.ogg', 'sound/weapons/bladeparry2.ogg', 'sound/weapons/bladeparry3.ogg', 'sound/weapons/bladeparry4.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'
	grab_sound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
/obj/item/melee/energy/powersword/activate(mob/living/user)
	..()
	icon_state = "powersword_on"
	to_chat(user, "<span class='notice'>\The [src] is now energised.</span>")

/obj/item/melee/energy/powersword/deactivate(mob/living/user)
	..()
	icon_state = initial(icon_state)
	to_chat(user, "<span class='notice'>\The [src] is de-energised. It's just a regular adamantium sword now.</span>")

/obj/item/melee/energy/powersword/astartes/ingelldina
	name = "Ingelldina Pattern Power Sword"
	desc = "A adamantium sword with a void shield generator inside of it, this one is very long and heavy, clearly having been made for one of the sons of the emperor."
	item_state = "powersword" // There is no on-mob for powersword we must use this. It looks alright.
	icon_state = "powersword"
	wielded_icon = "powersword-w"
	active_force = 46 //should be enough to cut off most limbs
	active_throwforce = 20
	force = 36 //its just a adamantium sword when offline
	throwforce = 15
	throw_speed = 1
	throw_range = 4
	sharp = TRUE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE //we have a power sword belt sprite, but im not going to code it in just yet, alright? enough codin' today
	block_chance = 33
	sales_price = 0
	w_class = ITEM_SIZE_HUGE
	atom_flags = 0
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	origin_tech = list(TECH_MAGNET = 7, TECH_COMBAT = 7)
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")



/obj/item/melee/energy/powersword/claw/integrated
	name = "Power Claws"
	desc = "A gauntlet with 4 clawed fingers with a void shield generator inside of it, the voidshield makes a concentrated power field around each of the 4 claws, making them able to cut through almost anything, this one was integrated to the user's armor and would need a series of ajustments to be safely removed."
	icon_state = "powerclaw-alt_mag"
	item_state = "none"
	wielded_icon = "none"
	active_force = 40 
	active_throwforce = 0
	force = 30
	throwforce = 1
	throw_speed = 1
	throw_range = 1
	weapon_speed_delay = 8
	edge = 1
	sharp = 1
	block_chance = 15
	sales_price = 0
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_LARGE
	atom_flags = 0
	origin_tech = list(TECH_MAGNET = 1, TECH_COMBAT = 1)
	attack_verb = list("mauled", "clawed", "cleaved", "torn", "cut")

/obj/item/melee/energy/powersword/claw/integrated/activate(mob/living/user)
	..()
	icon_state = "powerclaw-alt_on_mag"
	to_chat(user, "<span class='notice'>\The [src] is now energised.</span>")

/obj/item/melee/energy/powersword/claw/integrated/deactivate(mob/living/user)
	..()
	icon_state = initial(icon_state)
	to_chat(user, "<span class='notice'>\The [src] is de-energised. It's just some adamantium claws now now.</span>")


/obj/item/melee/energy/powersword/claw/integrated/dropped()
	..()
	spawn(1) if(src) qdel(src)













//WIP//


/obj/item/reagent_containers/hypospray/vial/narthecium
	name = "narthecium"
	desc = "The DeForest Medical Corporation hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to patients. Uses a replacable 30u vial."
	volume = 60
	icon = 'icons/obj/guardpower_gear_32xOBJ.dmi'
	icon_state = "hypogauntlet_on"
	item_state = "hypogauntlet_on"
	wielded_icon = "trenchaxe-w"
	str_requirement = 18 //this shouldn't even be here but just in case of someone abusing bugs to get the apothecary's power armor
	force = 30 //sharp enough to penetrate ceramite and adamantium alike
	block_chance = 10 //apothecaries are based
	armor_penetration = 50 //VERY fucking sharp
	sharp = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 9 //should be 5 or 3 seconds
	sharp = 1
	unacidable = 1

/obj/item/reagent_containers/hypospray/vial/narthecium/do_surgery(mob/living/carbon/M, mob/living/user)
	if(user.a_intent != I_GRAB) //in case it is ever used as a surgery tool
		return ..()
	attack(M, user)
	return 1

/obj/item/reagent_containers/hypospray/vial/narthecium/attack(mob/living/M as mob, mob/user as mob)
	if(user.a_intent != I_HELP) //in case it is ever used as a surgery tool
		return
	if(!reagents.total_volume)
		to_chat(user, "<span class='warning'>[src] is empty.</span>")
		return
	if (!istype(M))
		return

	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/organ/external/affected = H.get_organ(user.zone_sel.selecting)
		if(!affected)
			to_chat(user, "<span class='danger'>\The [H] is missing that limb!</span>")
			return
		else if(affected.robotic >= ORGAN_ROBOT)
			to_chat(user, "<span class='danger'>You cannot inject a robotic limb.</span>")
			return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	//user.do_attack_animation(M)
	to_chat(user, "<span class='notice'>You inject [M] with [src].</span>")
	to_chat(M, "<span class='notice'>You feel a tiny prick!</span>")
	user.visible_message("<span class='warning'>[user] injects [M] with [src].</span>")

	if(M.reagents)
		var/contained = reagentlist()
		var/trans = reagents.trans_to_mob(M, amount_per_transfer_from_this, CHEM_BLOOD)
		admin_inject_log(user, M, src, contained, trans)
		to_chat(user, "<span class='notice'>[trans] units injected. [reagents.total_volume] units remaining in \the [src].</span>")

	playsound(M, inject_sound, 100)
	return
