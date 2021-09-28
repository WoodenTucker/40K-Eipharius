/obj/item/melee/whip
	name = "whip"
	desc = "A generic whip."
	icon_state = "chain"
	item_state = "chain"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 10
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
	desc = "A mace normally used by mek boys made of scrap."
	force = 30
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
	force = 45 //max hit with 60 strength and no equipment. Duel Arena no No forfeit - Snapshot
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")
	var/slan = 1


/obj/item/melee/whip/lashoftorment/pickup(var/mob/living/carbon/human/user)
	if(user.lust <= 7 )
		to_chat(user, "<span class='warning'>An overwhelming feeling of dread comes over you as you pick up the [src]. It would be wise to be rid of this quickly.</span>")
		user.make_dizzy(120)
		playsound(usr, 'sound/effects/whispers1.ogg', 100, 0, -1)

// KRIEG AXE 

/obj/item/melee/trench_axe
	name = "Trench Axe"
	desc = "Used mainly for murdering those on the enemy side."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "trenchaxe"
	item_state = "trenchaxe"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 30
	block_chance = 20
	sharp = TRUE
	edge = TRUE
	hitsound = "slash_sound"
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE

// CHAINSWORD 

/obj/item/melee/mercycs
	name = "Locke Pattern Double-Edged Chainsword"
	desc = "Nicknamed 'Mercy', This Chainsword is designed for a absolute lunatic, it comes with two ripping edges. Designed for maximum rip and tear."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mercychainsword"
	item_state = "mercychainsword"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 38
	block_chance = 15
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE

/obj/item/melee/inqcs
	name = "Drusian Pattern Chainsword"
	desc = "Nicknamed the 'Crusader', It's a common Chainsword pattern issued to Inquisitorial agents of the Inquisition in the Koronus Expanse, Designed solely to smite the filthy xenos."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "inqchainsword"
	item_state = "inqchainsword"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 30
	block_chance = 25
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE

/obj/item/melee/pcsword
	name = "Mark I Pattern Chainsword"
	desc = "The standard issued chainsword of the Adeptus Astartes since Millenias ago, Forged by the finest Warsmith, these Chainsword have seen the test of time."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "pcsword"
	item_state = "pcsword"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 35
	block_chance = 35
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE

/obj/item/melee/pcsword/eviscerator
	name = "Eviscerator Pattern Chainsword"
	desc = "Favoured by Ecclesiarchy Zealots and Ordo Hereticus Members, It's a absurdly large, two-handed chainsword, equipped with a crude disruption field found commonly on power weapon, Though extremely unwieldly, It is a powerful sword, And in the hands of an Astarte, it's truly shines on the Battlefield."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "eviscerator"
	item_state = "eviscerator"
	wielded_icon ="eviscerator"
	force = 15// it's unwieldy when you don't use two hands, baby sword.
	force_wielded = 45
	block_chance = 25
	sharp = 1
	edge = 1
	w_class = ITEM_SIZE_HUGE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	attack_verb = list("attacked", "sawed", "cleaved", "torn", "cut")
