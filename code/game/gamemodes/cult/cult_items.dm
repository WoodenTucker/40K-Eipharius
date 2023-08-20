/obj/item/melee/cultblade
	name = "cult blade"
	desc = "An arcane weapon wielded by the followers of Nar-Sie."
	icon_state = "cultblade"
	item_state = "cultblade"
	edge = 1
	sharp = 1
	w_class = ITEM_SIZE_LARGE
	force = 30
	throwforce = 10
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	sales_price = 30

/obj/item/melee/cultblade/attack(mob/living/M, mob/living/user, var/target_zone)
	//if(iscultist(user) || (user.mind in godcult.current_antagonists))
	//	return ..()

	var/zone = (user.hand ? BP_L_ARM : BP_R_ARM)

	var/obj/item/organ/external/affecting = null
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		affecting = H.get_organ(zone)

	if(affecting)
		to_chat(user, "<span class='danger'>An unexplicable force rips through your [affecting.name], tearing the sword from your grasp!</span>")
	else
		to_chat(user, "<span class='danger'>An unexplicable force rips through you, tearing the sword from your grasp!</span>")

	//random amount of damage between half of the blade's force and the full force of the blade.
	user.apply_damage(rand(force/2, force), BRUTE, zone, 0, (DAM_SHARP|DAM_EDGE))
	user.Weaken(5)

	user.drop_from_inventory(src)
	throw_at(get_edge_target_turf(src, pick(GLOB.alldirs)), rand(1,3), throw_speed)

	var/spooky = pick('sound/hallucinations/growl1.ogg', 'sound/hallucinations/growl2.ogg', 'sound/hallucinations/growl3.ogg', 'sound/hallucinations/wail.ogg')
	playsound(loc, spooky, 50, 1)

	return 1

/obj/item/melee/cultblade/pickup(mob/living/user as mob)
	if(!iscultist(user))
		to_chat(user, "<span class='warning'>An overwhelming feeling of dread comes over you as you pick up the cultist's sword. It would be wise to be rid of this blade quickly.</span>")
		user.make_dizzy(120)


/obj/item/clothing/head/culthood
	name = "Tech-Guard's Hood"
	icon_state = "culthood"
	desc = "A hood worn by the Tech-Guard of the Machine-God."
	flags_inv = HIDEFACE
	body_parts_covered = HEAD
	armor = list(melee = 30, bullet = 10, laser = 5,energy = 5, bomb = 0, bio = 0, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.8 //That's a pretty cool opening in the hood. Also: Cloth making physical contact to the skull.
	sales_price = 2
	
/obj/item/clothing/head/culthood/magus
	name = "magus helm"
	icon_state = "magus"
	desc = "A helm worn by the followers of Nar-Sie."
	flags_inv = HIDEFACE | BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 20, bomb = 15, bio = 0, rad = 0)
	sales_price = 10

/obj/item/clothing/head/culthood/alt
	icon_state = "cult_hoodalt"

/obj/item/clothing/suit/cultrobes
	name = "Tech-Guard's Garb"
	desc = "A set of durable robes worn by the Tech-Guard of the Machine-God."
	icon_state = "cultrobes"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	allowed = list(/obj/item/book/tome,/obj/item/melee/cultblade)
	armor = list(melee = 35, bullet = 30, laser = 25,energy = 20, bomb = 25, bio = 10, rad = 0)
	flags_inv = HIDEJUMPSUIT
	siemens_coefficient = 0.6
	sales_price = 10

/obj/item/clothing/suit/cultrobes/alt
	icon_state = "cultrobesalt"

/obj/item/clothing/suit/cultrobes/magusred
	name = "magus robes"
	desc = "A set of plated robes worn by the followers of Nar-Sie."
	icon_state = "magusred"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor = list(melee = 75, bullet = 50, laser = 55, energy = 40, bomb = 50, bio = 10, rad = 0)
	sales_price = 35

/obj/item/clothing/suit/cultrobes/magusred/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1

/obj/item/clothing/head/helmet/space/cult
	name = "cult helmet"
	desc = "A space worthy helmet used by the followers of Nar-Sie."
	icon_state = "cult_helmet"
	armor = list(melee = 60, bullet = 60, laser = 60,energy = 15, bomb = 30, bio = 100, rad = 30) //Real tanky shit.
	siemens_coefficient = 0.3 //Bone is not very conducive to electricity.
	sales_price = 5

/obj/item/clothing/suit/space/cult
	name = "cult armour"
	icon_state = "cult_armour"
	desc = "A bulky suit of armour, bristling with spikes. It looks space proof."
	allowed = list(/obj/item/book/tome,/obj/item/melee/cultblade,/obj/item/tank,/obj/item/device/suit_cooling_unit)
	armor = list(melee = 60, bullet = 50, laser = 60,energy = 15, bomb = 30, bio = 100, rad = 30)
	siemens_coefficient = 0.2
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS
	sales_price = 10

/obj/item/clothing/suit/space/cult/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 1



/obj/item/clothing/suit/cultist
	name = "chaos cultist garbs"
	desc = "A garment worn by followers of the ruinous powers, truly hard to conceal your allegiance with this honestly."
	icon_state = "workship_tunic"
	item_state = "workship_tunic"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 25, bullet = 35, laser = 25, energy = 0, bomb = 10, bio = 5, rad = 5)

/obj/item/clothing/suit/witchhunter
	name = "Witch Hunter Garments"
	desc = "A garment worn by the Ordo Hereticus, despite looking like your usual clothes, these have reinforced materials below that protect from most small to medium caliber and sharp weapons."
	icon = 'icons/map_project/ordo_hereticus.dmi'
	armor = list(melee = 75, bullet = 65, laser = 65, energy = 55, bomb = 55, bio = 85, rad = 100)
	icon_state = "femquisitor-armor_worn"
	item_state = "femquisitor-armor_worn"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/head/witchhunter_hat
	name = "Ordo Hereticus Hat"
	icon = 'icons/map_project/ordo_hereticus_helmet.dmi'
	icon_state = "femquisitor-hat_worn"
	desc = "A hat worn by the Ordo Hereticus, or more often called 'Witch Hunters' due the tasks they've got to do."
	flags_inv = BLOCKHAIR
	armor = list(melee = 65, bullet = 55, laser = 55, energy = 55, bomb = 75, bio = 55, rad = 100) //We make the hat actually useful for the witch hunters to wear + Actually protects = Fear

/*

// Hoods - Mostly from Lifeweb, decided to port these cause certain parties (Cultists) might need some face cover & disguises, plus some of these look nice and cool to conceal weaponary and the like, aswell as name, etc.

/obj/item/clothing/suit/hood
	var/hood_state
	var/hooded = FALSE

/obj/item/clothing/suit/hood/RightClick(mob/living/carbon/human/user as mob)
	if(hooded)
		icon_state = initial(icon_state)
		hooded = FALSE
	else
		icon_state = hood_state
		hooded = TRUE
	user.update_inv_wear_suit(1)
	user.update_icons(1)
	user.update_hair(1)

/obj/item/clothing/suit/hood/monk
	name = "Monk cloak"
	desc = "The cloak of devotion."
	icon_state = "monk"
	item_state = "monk"
	hood_state = "monk-hooded"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/hood/thief
	name = "Grave robber cloak"
	desc = "The cloak of silence."
	icon_state = "thief"
	item_state = "thief"
	hood_state = "thief-hooded"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/suit/hood/donor/absenceofwords/blackcloak
	name = "Black cloak"
	desc = "The cloak of silence."
	icon_state = "donor_absenceofwords_blackcape"
	item_state = "donor_absenceofwords_blackcape"
	hood_state = "donor_absenceofwords_blackcapehood"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS



*/