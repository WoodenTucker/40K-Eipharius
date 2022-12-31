/////////////////////////////////////////
//Standard Rings
/obj/item/clothing/ring/engagement
	name = "engagement ring"
	desc = "An engagement ring. It certainly looks expensive."
	icon_state = "diamond"

/obj/item/clothing/ring/engagement/attack_self(mob/user)
	user.visible_message("<span class='warning'>\The [user] gets down on one knee, presenting \the [src].</span>","<span class='warning'>You get down on one knee, presenting \the [src].</span>")

/obj/item/clothing/ring/cti
	name = "CTI ring"
	desc = "A ring commemorating graduation from CTI."
	icon_state = "cti-grad"

/obj/item/clothing/ring/mariner
	name = "Mariner University ring"
	desc = "A ring commemorating graduation from Mariner University."
	icon_state = "mariner-grad"

/////////////////////////////////////////
//Magic Rings

/obj/item/clothing/ring/magic
	name = "magic ring"
	desc = "A strange ring with symbols carved on it in some arcane language."
	icon_state = "magic"

/obj/item/clothing/ring/magic/equipped(var/mob/living/carbon/human/H, var/slot)
	..()
	if(istype(H) && slot == SLOT_GLOVES)
		H.add_cloaking_source(src)

/obj/item/clothing/ring/magic/dropped(var/mob/living/carbon/human/H)
	if(!..())
		return 0

	if(istype(H))
		H.remove_cloaking_source(src)

/////////////////////////////////////////
//Reagent Rings

/obj/item/clothing/ring/reagent
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	origin_tech = list(TECH_MATERIAL = 2, TECH_ILLEGAL = 4)

/obj/item/clothing/ring/reagent/New()
	..()
	create_reagents(15)

/obj/item/clothing/ring/reagent/equipped(var/mob/living/carbon/human/H)
	..()
	if(istype(H) && H.gloves==src)
		to_chat(H, "<font color='blue'><b>You feel a prick as you slip on the ring.</b></font>")

		if(reagents.total_volume)
			if(H.reagents)
				var/contained_reagents = reagents.get_reagents()
				var/trans = reagents.trans_to_mob(H, 15, CHEM_BLOOD)
				admin_inject_log(usr, H, src, contained_reagents, trans)
	return

//Sleepy Ring
/obj/item/clothing/ring/reagent/sleepy
	name = "silver ring"
	desc = "A ring made from what appears to be silver."
	icon_state = "material"
	origin_tech = list(TECH_MATERIAL = 2, TECH_ILLEGAL = 5)

/obj/item/clothing/ring/reagent/sleepy/New()
	..()
	reagents.add_reagent(/datum/reagent/chloralhydrate, 15) // Less than a sleepy-pen, but still enough to knock someone out

/////////////////////////////////////////
//Seals and Signet Rings
/obj/item/clothing/ring/seal/secgen
	name = "Secretary-General's official seal"
	desc = "The official seal of the Secretary-General of the Sol Central Government, featured prominently on a silver ring."
	icon = 'icons/obj/clothing/rings.dmi'
	icon_state = "seal-secgen"

/obj/item/clothing/ring/seal/mason
	name = "masonic ring"
	desc = "The Square and Compasses feature prominently on this Masonic ring."
	icon = 'icons/obj/clothing/rings.dmi'
	icon_state = "seal-masonic"

/obj/item/clothing/ring/seal/signet
	name = "signet ring"
	desc = "A signet ring, for when you're too sophisticated to sign letters."
	icon = 'icons/obj/clothing/rings.dmi'
	icon_state = "seal-signet"
	var/nameset = 0

/obj/item/clothing/ring/seal/signet/attack_self(mob/user)
	if(nameset)
		to_chat(user, "<span class='notice'>The [src] has already been claimed!</span>")
		return

	nameset = 1
	to_chat(user, "<span class='notice'>You claim the [src] as your own!</span>")
	name = "[user]'s signet ring"
	desc = "A signet ring belonging to [user], for when you're too sophisticated to sign letters."



//digital weaponry!



/obj/item/clothing/ring/HotshotDigital
	name = "Ring"
	desc = "A golden ring with a cutten ruby on it!."
	icon_state = "mariner-grad"
	var/can_toggle = 1

/obj/item/clothing/ring/HotshotDigital/verb/togglehotshot()
	set name = "Prepare Digital Weapon"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
	else
		to_chat(usr,"Your ring suddenly gets open and prepares to open fire on the enemy!")
		usr.put_in_hands(new /obj/item/gun/energy/las/laspistol/digit(usr))





/obj/item/gun/energy/las/laspistol/digit
	name = "Digital Weapon"
	desc = "Huh, interesting, a very small laspistol appears from the ring, ready to fire at your orders, commander."
	icon_state = "laspistol"
	item_state = "laspistol"
	slot_flags = SLOT_BELT|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	force = 0
	accuracy = -0.5
	move_delay = 0
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/energy/las/lasgun/hotshot
	charge_cost = 0
	armor_penetration = 0
	cell_type = /obj/item/cell/device
	ammoType = /obj/item/cell/device
	fire_delay = 60 //about 15 seconds
	sales_price = 0
	wielded_item_state = "none" //this needs to be replaced ASAP with actual inhands/wielded for a laspistol
	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=60, burst_accuracy=null, dispersion=null, automatic = 0, charge_cost=0),
		)
/obj/item/gun/energy/las/laspistol/digit/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)
	
/obj/item/clothing/ring/PowerBlade
	name = "Ring"
	desc = "A silver ring with a cutten emerald on it."
	icon_state = "seal-secgen"
	var/can_toggle = 1

/obj/item/clothing/ring/PowerBlade/verb/toggleblade()
	set name = "Prepare Digital Blade"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
	else
		to_chat(usr,"Your ring suddenly extends a small pointed iron stick, which suddenly begins glowing in blazing green energy!")
		usr.put_in_hands(new /obj/item/material/sword/PowerBlade(usr))
		
/obj/item/material/sword/PowerBlade
	name = "Power Blade"
	desc = "A weird glowing stick of green energy!"
	icon = 'icons/obj/weapons/melee/energy.dmi'
	icon_state = "blade"
	force = 40 //bit weaker than normal power sword
	weapon_speed_delay = 8 //2 secs or so
//	armor_penetration = 10 //add this if you want it to penetrate armor, ya nerds!
	block_chance = 35 //good at blocking
	edge = 0 //i don't want this to end badly
	w_class = ITEM_SIZE_HUGE //slow attacking
	atom_flags = ATOM_FLAG_NO_BLOOD
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

// omnissiah, delete this mfer!
/obj/item/material/sword/PowerBlade/dropped() 
	..()
	spawn(1) if(src) qdel(src)



/obj/item/clothing/ring/Lollipop
	name = "Ring"
	desc = "A golden ring with a cutten ruby on it!."
	icon_state = "mariner-grad"
	var/can_toggle = 1

/obj/item/clothing/ring/Lollipop/verb/togglelollipop()
	set name = "Prepare Digital Lollipop"
	set category = "Tools"
	set src in usr
	if(!usr.canmove || usr.stat || usr.restrained())
		return
	if(!can_toggle)
		to_chat(usr,"This tool cannot be toggled!")
	else
		to_chat(usr,"Your ring suddenly gets open and prepares to open fire on the enemy-- then, suddenly, a british lollipop jumps out of the ring")
		usr.put_in_hands(new /obj/item/reagent_containers/food/snacks/variable/sucker(usr))
