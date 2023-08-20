/* Weapons
 * Contains:
 * Swords: Best at parrying and defense, mediocre armor penetration
 * Axes/clubs: Decent and AP, poor at parrying
 * Chainswords: Great damage, decent AP, mediocre parry
 * Knives: Small and fast, but not the heaviest hitters
 * Polearms: Don't exist yet, bug someone to code in reach mechanics.
 */

/obj/item/melee/sword
	name = "claymore"
	desc = "You use the sharp part on your foes. And the flat part on your lesser foes."
	icon_state = "claymore"
	item_state = "claymore"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_LARGE //Weight class, Normal is that of a box. Anyway, this makes swords weaker and slower at attacking, if you set it too high, it will become useless, scale damage with WEIGHT CLASS
	force = 30
	force_wielded = 40
	block_chance = 35
	armor_penetration = 15
	sharp = 1 //sharp or blunt, blunt causes broken bones, sharp causes organ damage and extra bleeding.
	edge = 1 //edge or not edged, edged has a higher chance of cutting limbs off, no edge has more chance of breaking limb
	attack_verb = list("slashed", "sliced")
	hitsound = "slash_sound"
//	sharpness = TRUE  //???
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25 //I think this is used when determining if limbs, arteries, and tendons are cut. Check human_defense.dm for more information on that. No idea what it has to do with the other sharpness marked TRUE.
	weapon_speed_delay = 8
	parry_sounds = list('sound/weapons/bladeparry1.ogg', 'sound/weapons/bladeparry2.ogg', 'sound/weapons/bladeparry3.ogg', 'sound/weapons/bladeparry4.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'
	sales_price = 0
	var/isblessed = 0

/obj/item/melee/sword/handle_shield(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_sword_parry(user, damage, damage_source, attacker, def_zone, attack_text))
		return 1

	return 0

/obj/item/proc/default_sword_parry(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	//Ok this if looks like a bit of a mess, and it is. Basically you need to have the sword in your active hand, and pass the default parry check
	//and also pass the prob which is your melee skill divided by two + the swords block chance. Complicated, I know, but hopefully it'll balance out.

	var/actual_block_chance = prob(block_chance + ((user.SKILL_LEVEL(melee) * 10) / 2))//Skills aren't base 100 anymore they're based 10 so I'm multiplying 100

	if(user.atk_intent == I_DEFENSE)
		actual_block_chance += 50

	if(default_parry_check(user, attacker, damage_source) && actual_block_chance && (user.get_active_hand() == src))//You gotta be holding onto that sheesh bro.
		user.visible_message("<span class='combat_success'>\The [user] parries [attack_text] with \the [src]!</span>")
		if(parry_sounds.len)
			playsound(user.loc, pick(parry_sounds), 50, 1)
		user.adjustStaminaLoss(4)
		health -= 0.5
		if(!prob((user.SKILL_LEVEL(melee) * 10) + 15) || user.staminaloss >= user.staminaexhaust)//If you're out of stamina you will immediately be disarmed.
			disarm(user)//Moved the disarm affect to it's own proc in case we want to call it elsewhere.
		else if(user.atk_intent == I_GUARD)//If they're on gaurd intent then attack back immediately.
			if(istype(src, /obj/item/gun))//If they're using a gun I don't want them shooting like it's fucking gun kaka.
				if(user.a_intent != I_HURT)
					visible_message("<span class='combat_success'>[user] ripostes!</span>")
					src.attack(attacker, user, def_zone)
					user.adjustStaminaLoss(2)
			else
				visible_message("<span class='combat_success'>[user] ripostes!</span>")
				src.attack(attacker, user, def_zone)
				user.adjustStaminaLoss(2)
		return 1

/obj/item/proc/disarm(mob/living/user)
	user.visible_message("<span class='danger'>\The [src] flies out of \the [user]'s hand!</span>")
	user.drop_from_inventory(src)
	throw_at(get_edge_target_turf(src, pick(GLOB.alldirs)), rand(1,3), throw_speed)//Throw that sheesh away

/mob/proc/item_disarm()
	var/obj/item/I = get_active_hand()
	if(I)
		I.disarm(src)

///////////
//SWORDS///
///////////

/obj/item/melee/sword/replica
	edge = 0
	sharp = 0
	force = 15
	block_chance = 30

/obj/item/melee/sword/sabre
	name = "iron sabre"
	desc = "Like a claymore but for an officer."
	icon_state = "sabre"
	item_state = "sabre"
	force = 35 //claymore but smaller and lighter
	force_wielded = 40
	block_chance = 50 //acceptable blocking
	weapon_speed_delay = 7
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE

/obj/item/melee/sword/shortsword
	name = "shortsword"
	desc = "A small, well balanced blade. Useful in a pinch, but it's small size can leave one at a disadvantage."
	icon_state = "spatha"
	item_state = "spatha"
	force = 30
	force_wielded = 35
	armor_penetration = 10
	block_chance = 35 //It's short length does it no favors in this regard
	weapon_speed_delay = 7
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_NORMAL

/obj/item/melee/sword/commissword //The commissar gets the best aspects of all swords
	name = "commissar's sword"
	desc = "An orante officer's sword and the Commissar's prized possession. Used to cut down heretics and cowards alike"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "commissword"
	item_state = "commissword"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 40
	force_wielded = 45
	sharp = 1
	block_chance = 55
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 0
	weapon_speed_delay = 7

//////////////
//AXES/CLUBS//
/////////////

/obj/item/melee/trench_axe
	name = "trench axe"
	desc = "Used mainly for murdering those on the enemy side."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "trenchaxe"
	item_state = "trenchaxe"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 31
	armor_penetration = 10
	throwforce = 18
	block_chance = 30
	sharp = TRUE
	hitsound = "slash_sound"
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 8
	w_class = ITEM_SIZE_HUGE

/obj/item/melee/sword/commissword/sabre
	name = "Sabre"
	desc = "A masteredcrafted sabre of exceptional quality, it has a duelists grip."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "sabre"
	item_state = "sabre"
	block_chance = 65
	sales_price = 0
	armor_penetration = 5

/obj/item/melee/sword/choppa
	name = "choppa"
	desc = "Fixed out of a rusted sheet of metal, this choppa looks too big to be a sword. More like a piece of iron."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	str_requirement = 13
	icon_state = "choppa"
	item_state = "choppa"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 33
	armor_penetration = 20
	block_chance = 35
	sharp = 1
	hitsound = "slash_sound"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 0
	weapon_speed_delay = 9

///////////////
//CHAINSWORDS//
//////////////

/obj/item/melee/chain
	name = "Messina Pattern Chainsword"
	desc = "A basic chainsword constructed in the small scale forges of Eipharius itself. Cheaped out on quality, at least its still a chainsword!"
	icon_state = "mercychainsword"
	item_state = "mercychainsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 12
	force = 31
	force_wielded = 36
	armor_penetration = 10
	block_chance = 15
	sharp = 1
	edge = 1
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 9
	sales_price = 40
	w_class = ITEM_SIZE_NORMAL

/obj/item/melee/chain/guard
	name = "Imperial Guard chainsword"
	desc = "A chainsword, likely belonging to an NCO or higher rank in the Astra Militarium. Under the golden eagle it reads 'For the Throne'"
	icon_state = "gchain" // doesnt work
	item_state = "inqchainsword"
	w_class = ITEM_SIZE_LARGE
	weapon_speed_delay = 9
	force = 33
	force_wielded = 38
	str_requirement = 13
	armor_penetration = 15
	block_chance = 20

/obj/item/melee/chain/gold
	name = "Terra Pattern Chainsword" // this is mostly an ornamental chainsword. Make it low tier. its mostly drip.
	desc = "A golden ornamental chainsword, overburdened with it's expensive metal. It is cumbersome and ornamental. At least it's almost as shiny as a Custodes."
	icon_state = "ggchain" // doesnt work
	item_state = "inqchainsword"
	sales_price = 60 //only RT has it. if made craftable, decrease value.
	weapon_speed_delay = 11
	force = 29
	force_wielded = 35
	str_requirement = 13
	armor_penetration = 10

/obj/item/melee/chain/mercycs
	name = "Locke Pattern Double-Edged Chainsword"
	desc = "Nicknamed 'Mercy', This Chainsword is designed for an absolute lunatic. With two ripping edges for maximum carnage. Intended for two handed use. "
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mercychainsword"
	item_state = "mercychainsword"
	wielded_icon = "mercychainsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 13
	force = 37
	force_wielded = 42
	armor_penetration = 25
	block_chance = 12
	weapon_speed_delay = 10
	sharp = 1
	edge = 1
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	sales_price = 45
	w_class = ITEM_SIZE_LARGE

/obj/item/melee/chain/inqcs
	name = "Drusian Pattern Chainsword"
	desc = "Nicknamed the 'Crusader', It's a common Chainsword pattern issued to Inquisitorial agents of the Inquisition in the Koronus Expanse, Designed solely to smite the filthy xenos."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "inqchainsword"
	item_state = "inqchainsword"
	wielded_icon = "inqchainsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 12
	force_wielded = 38
	force = 33
	armor_penetration = 20
	weapon_speed_delay = 8
	block_chance = 20
	sharp = 1
	edge = 1
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	sales_price = 50
	w_class = ITEM_SIZE_LARGE

/obj/item/melee/chain/pcsword
	name = "Mark I Pattern Chainsword"
	desc = "The standard issued chainsword of the Adeptus Astartes since Millenias ago, Forged by the finest Warsmith, these Chainsword have seen the test of time."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "pcsword"
	item_state = "pcsword"
	wielded_icon = "pcsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 18
	force = 38
	force_wielded = 44
	armor_penetration = 25
	sharp = 1
	edge = 1
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 8
	sales_price = 100 //not common at all
	w_class = ITEM_SIZE_HUGE //slow


/obj/item/melee/chain/pcsword/eviscerator
	name = "Eviscerator Pattern Chainsword"
	desc = "Favoured by Ecclesiarchy Zealots and Ordo Hereticus Members, It's a absurdly large, two-handed chainsword. Almost useless one handed."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "eviscerator"
	item_state = "eviscerator"
	wielded_icon ="eviscerator"
	str_requirement = 14 // It's downsides of size are represented in it's one handed damage.
	force = 28 // Physically impossible to wield effectively one handed unless Astartes/Ork.
	force_wielded = 45
	armor_penetration = 20
	block_chance = 25
	sharp = 1
	edge = 1
	w_class = ITEM_SIZE_HUGE //slow
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	attack_verb = list("attacked", "sawed", "cleaved", "torn", "cut")
	weapon_speed_delay = 13
	sales_price = 60

/obj/item/melee/chain/pcsword/klaw
	name = "Power Klaw"
	desc = "Da bestest maylay weapon for any self respektin Nob boy. Da Mekboys made sure it pakz a big punch! Uz yer other hand to lift et, its supa big!"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "pklaw"
	item_state = "pklaw"
	wielded_icon = "pklaw"
	str_requirement = 16
	force = 36
	force_wielded = 43
	armor_penetration = 30
	block_chance = 10
	sharp = 1
	edge = 1
	w_class = ITEM_SIZE_HUGE //slow
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = null // change when no longer using backpack to spawn i
	attack_verb = list("klaw'd", "sawed", "cleaved", "zog'd", "cut")
	weapon_speed_delay = 12 // its zogging huge
	sales_price = 0

/obj/item/melee/chain/pcsword/klaw/dropped() // only way to get it is the backpack currently. And power sword augment. This should be replaced.
	..()
	spawn(1) if(src) qdel(src)

// KNIVES AND SMALL WEAPONS //
// KNIVES AND SMALL WEAPONS //

/obj/item/melee/sword/sabre
	name = "iron sabre"
	desc = "A fine imperial sabre."
	icon_state = "sabre"
	item_state = "sabre"
	force = 31
	force_wielded = 35
	block_chance = 33
	weapon_speed_delay = 7
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE

/obj/item/melee/sword/cutro
	name = "cutro blade"
	desc = "A lightweight iron blade with near perfect balance."
	icon_state = "spatha"
	item_state = "spatha"
	force = 27
	force_wielded = 29
	armor_penetration = 15
	block_chance = 35
	weapon_speed_delay = 6
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_NORMAL

/obj/item/melee/sword/cutro/adamantine
	name = "adamantium cutro"
	desc = "A lightweight adamantium blade with near perfect balance."
	color = "#848484"
	force = 29
	force_wielded = 31
	armor_penetration = 20
	block_chance = 37
	weapon_speed_delay = 6
	sales_price = 0

/obj/item/melee/sword/broadsword
	name = "heavy broadsword"
	desc = "A heavy iron broadsword."
	icon_state = "claymore"
	item_state = "claymore"
	force = 28
	force_wielded = 38
	armor_penetration = 10
	block_chance = 20
	weapon_speed_delay = 8
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE

/obj/item/melee/sword/broadsword/adamantine
	name = "adamantium heavy broadsword"
	desc = "A heavy adamantium broadsword."
	color = "#848484"
	force = 30
	force_wielded = 41
	armor_penetration = 15
	block_chance = 25 
	weapon_speed_delay = 8
	sales_price = 0

/obj/item/melee/sword/machete
	name = "iron machete"
	desc = "Both a vine removal tool, and a limb removal tool. Use it on vines, and also people who annoy you."
	icon_state = "machete"
	item_state = "machete"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	force = 25
	force_wielded = 29
	block_chance = 31 //quicker
	weapon_speed_delay = 6

/obj/item/melee/sword/machete/chopper
	name = "iron chopper"
	desc = "A light primitive blade made of scrap iron, a common sight in the underhives of imperial worlds."
	icon_state = "machete_imp"
	item_state = "salvagedmachete"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	force = 25
	force_wielded = 32
	armor_penetration = 10
	block_chance = 30
	weapon_speed_delay = 7

/obj/item/melee/sword/machete/chopper/skinless
	name = "diseased chopper"
	desc = "A light primitive blade made of scrap iron, a common sight in the underhives of imperial worlds."
	w_class = ITEM_SIZE_HUGE
	slot_flags = null
	force = 35
	force_wielded = 10
	armor_penetration = 40
	block_chance = 0
	weapon_speed_delay = 10

/obj/item/melee/sword/machete/chopper/heavy
	name = "heavy iron chopper"
	desc = "A heavy primitive blade made of scrap iron, a common sight in the underhives of imperial worlds."
	icon_state = "scrapsabre"
	item_state = "salvagedmachete"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE //if its heavy, its slow!
	slot_flags = SLOT_BELT
	force = 27
	force_wielded = 34
	armor_penetration = 10
	block_chance = 25
	weapon_speed_delay = 8


/obj/item/melee/sword/machete/chopper/heavy/adamantine
	name = "heavy iron chopper"
	desc = "A heavy primitive blade made of adamanantine, a common sight in the underhives of imperial worlds."
	icon_state = "scrapsabre"
	item_state = "salvagedmachete"
	color = "#848484"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE //if its heavy, its slow!
	slot_flags = SLOT_BELT
	force = 31
	force_wielded = 37
	armor_penetration = 15
	block_chance = 30
	weapon_speed_delay = 8

/obj/item/melee/sword/machete/chopper/heavy/slayer
	name = "heavy blessed chopper"
	desc = "A heavy blessed blade made of xenos alloy, it seems unnaturally heavy."
	icon_state = "scrapsabre"
	item_state = "salvagedmachete"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE //if its heavy, its slow!
	slot_flags = SLOT_BELT
	str_requirement = 18
	force = 32
	force_wielded = 39
	armor_penetration = 15
	block_chance = 35
	weapon_speed_delay = 8

/obj/item/melee/sword/demon
	name = "demon sword"
	desc = "The very sight of this blade makes you sick to your stomach."
	icon_state = "Scorpion_CS"
	item_state = "Scorpion_CS"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 14
	force = 36
	force_wielded = 44 //warpsword
	armor_penetration = 25
	block_chance = 30
	sharpness = TRUE
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 8
	sales_price = 100

// NON MATERIAL WEAPONS //

/obj/item/melee/trench_axe
	name = "trench axe"
	desc = "A lightweight fighting axe that doubles as a tool for the cunning guardsman."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "trenchaxe"
	item_state = "trenchaxe"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 25
	force_wielded = 36
	armor_penetration = 12
	throwforce = 18
	block_chance = 12
	sharp = 1
	edge = 1
	hitsound = "slash_sound"
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 9
	w_class = ITEM_SIZE_LARGE


/obj/item/melee/trench_axe/glaive
	name = "steel saintie"
	desc = "A powerful glaive used for singular felling blows against armored opponents(pronounced san-tee)."
	icon_state = "glaive"
	item_state = "spear"
	wielded_icon = "spear-w"
	force = 25
	force_wielded = 39
	armor_penetration = 40
	throwforce = 40
	block_chance = 35
	weapon_speed_delay = 10
	w_class = ITEM_SIZE_HUGE

/obj/item/melee/trench_axe/glaive/adamantine
	name = "adamantium saintie"
	desc = "A heavy adamantine glaive used for singular felling blows against armored opponents(pronounced san-tee)."
	color = "#848484"
	force = 27
	force_wielded = 41
	armor_penetration = 45
	sales_price = 0

/obj/item/melee/trench_axe/bardiche
	name = "bardiche"
	desc = "A gigantic, powerful, two handed, sharp polearm used for singular felling blows against armored opponents."
	icon_state = "bardiche"
	item_state = "savaxe"
	wielded_icon = "savaxe"
	force = 27
	force_wielded = 41
	armor_penetration = 15
	throwforce = 15
	block_chance = 20
	weapon_speed_delay = 9
	w_class = ITEM_SIZE_LARGE 

/obj/item/melee/trench_axe/bardiche/beast
	name = "beastly axe"
	desc = "A gigantic, powerful, two handed, sharp polearm used for singular felling blows against armored opponents."
	force = 30
	force_wielded = 44
	armor_penetration = 15
	throwforce = 22
	block_chance = 24
	weapon_speed_delay = 8
	w_class = ITEM_SIZE_LARGE 

/obj/item/melee/trench_axe/bspear
	name = "hunting spear"
	desc = "An incredibly lightweight and nimble spear used by hunters against large game animals."
	icon_state = "bone_spear"
	item_state = "bone_spear"
	wielded_icon = "bone_spear-w"
	force = 27
	force_wielded = 31
	armor_penetration = 20
	throwforce = 25
	block_chance = 22
	weapon_speed_delay = 8
	edge = 0
	w_class = ITEM_SIZE_LARGE 

/obj/item/melee/trench_axe/bspear/hunter
	name = "fine hunting spear"
	desc = "An incredibly lightweight and nimble spear used by hunters against large game animals."
	force = 29
	force_wielded = 33
	armor_penetration = 22
	throwforce = 27
	block_chance = 25
	weapon_speed_delay = 7

/obj/item/melee/trench_axe/lance
	name = "fuscina war spear"
	desc = "A heavy war spear used to strike from a distance."
	icon_state = "lance"
	item_state = "lance"
	wielded_icon = "lance-w"
	force = 24
	force_wielded = 37
	armor_penetration = 20
	block_chance = 24
	weapon_speed_delay = 10
	edge = 0
	w_class = ITEM_SIZE_LARGE 

/obj/item/melee/trench_axe/lance/adamantine
	name = "adamantine fuscina"
	desc = "A heavy adamantine war spear forged by a master smith of unknown origin."
	color = "#848484"
	force = 26
	force_wielded = 39
	armor_penetration = 25
	sales_price = 0

/obj/item/melee/sword/commissword/sabre
	name = "Sabre"
	desc = "A masteredcrafted sabre of exceptional quality, it has a duelists grip."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "sabre"
	item_state = "sabre"
	block_chance = 22
	sales_price = 0

/obj/item/melee/sword/choppa
	name = "choppa"
	desc = "Fixed out of a rusted sheet of metal, this choppa looks too big to be a sword. More like a piece of iron."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	str_requirement = 13
	icon_state = "choppa"
	item_state = "choppa"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 35
	force_wielded = 39
	armor_penetration = 20
	block_chance = 25
	sharp = 1
	edge = 1
	hitsound = "slash_sound"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 0
	weapon_speed_delay = 8

/obj/item/melee/classic_baton/daemonhammer
	name = "Daemonhammer"
	desc = "A power weapon of incredible legend and stature amongst the Ordos Malleus, this Daemonhammer has been used by countless Inquisitor's in their conflict against the unholy creatures of chaos."
	icon_state = "thunder_hammer"
	item_state = "thunder_hammer"
	wielded_icon = "thunder_hammer-w"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	str_requirement = 13
	force_wielded = 32
	force = 45
	armor_penetration = 20
	block_chance = 40
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 8
	edge = TRUE
	sales_price = 0

// KNIVES AND SMALL WEAPONS //
// KNIVES AND SMALL WEAPONS //

/obj/item/melee/sword/combat_knife
	name = "boot knife"
	desc = "For self defense, and self offense."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "combatknife"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed")
	force = 15
	force_wielded = 16
	block_chance = 25
	throw_speed = 5
	w_class = ITEM_SIZE_SMALL
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_knife.ogg'
	equipsound = 'sound/items/holster_knife.ogg'
	sharpness = TRUE//No cutting peoples heads off with a knife please.
	weapon_speed_delay = 6
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"
	armor_penetration = 8

/obj/item/melee/sword/combat_knife/attack(mob/living/carbon/C as mob, mob/living/user as mob)
	if(user.a_intent == I_HELP && (C.handcuffed) && (istype(C.handcuffed, /obj/item/handcuffs/cable)))
		usr.visible_message("\The [usr] cuts \the [C]'s restraints with \the [src]!",\
		"You cut \the [C]'s restraints with \the [src]!",\
		"You hear cable being cut.")
		C.handcuffed = null
		if(C.buckled && C.buckled.buckle_require_restraints)
			C.buckled.unbuckle_mob()
		C.update_inv_handcuffed()
		return

	if(user.a_intent == I_HELP)
		remove_shrapnel(C, user)
	else
		..()


/obj/item/melee/sword/combat_knife/rare
	name = "trench knife"
	desc = "For self defense, and self offense."
	icon_state = "knife_trench"
	force = 16
	force_wielded = 17
	block_chance = 30
	weapon_speed_delay = 5

/obj/item/melee/sword/combat_knife/bowie
	name = "bowie knife"
	desc = "For self defense, and self offense."
	icon_state = "knife_bowie"
	force = 19
	force_wielded = 20
	block_chance = 25
	weapon_speed_delay = 5

/obj/item/melee/sword/combat_knife/glaive
	name = "glaive chopper"
	desc = "A modified glaive head turned into a metal monstrosity."
	icon_state = "glaive-dagger"
	item_state = "salvagedmachete"
	force = 19
	force_wielded = 22
	block_chance = 20
	weapon_speed_delay = 7

/obj/item/melee/sword/combat_knife/glaive/holy
	name = "ritual dagger"
	desc = "A gigantic ritual dagger used in combat by the frateris."
	icon_state = "glaive-dagger"
	item_state = "salvagedmachete"
	color = "#5a611e"
	force = 22
	force_wielded = 25
	block_chance = 25

/obj/item/melee/sword/combat_knife/catachan
	name = "catachan knife"
	desc = "The legendary blade of the catachan jungle fighters. The balance of the knife is near perfect."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "catachanfang"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed")
	force = 25
	force_wielded = 28
	armor_penetration = 20
	block_chance = 35
	str_requirement = 12 //i don't want to hear it, anyone below 12 str is supposed to be a child or a old man.
	weapon_speed_delay = 7


//knife for astartes/ogryn
/obj/item/melee/sword/combat_knife/catachan/giant
	name = "Bull Butcher Mk III Cleaver"
	desc = "This knife is really big, its so big that its probably meant for a ogryn."
	force = 30
	force_wielded = 35
	edge = 1
	str_requirement = 18 //you really shouldn't be using it if you are below 18


/obj/item/material/scythe
	name = "scythe"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "scythe0"
	item_state = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force = 15
	force_wielded = 22
	block_chance = 25
	armor_penetration = 10
	weapon_speed_delay = 7
	sharp = 1
	throw_speed = 1
	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/melee/sword/commissword
	name = "commissar's sword"
	desc = "An orante officer's sword and the Commissar's prized possession. Used to cut down heretics and cowards alike"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "commissword"
	item_state = "commissword"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 31
	force_wielded = 36
	sharp = 1
	block_chance = 22
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 0
	weapon_speed_delay = 7
	armor_penetration = 45


//knife for astartes/ogryn
/obj/item/melee/sword/combat_knife/catachan/giant
	name = "Bull Butcher Mk III Cleaver"
	desc = "This knife is really big, its so big that its probably meant for a ogryn."
	force = 30
	force_wielded = 35
	edge = 1
	str_requirement = 18 //you really shouldn't be using it if you are below 18


/obj/item/melee/scythe
	name = "scythe"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "scythe0"
	item_state = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force = 15
	force_wielded = 22
	block_chance = 25
	armor_penetration = 10
	weapon_speed_delay = 7
	sharp = 1
	throw_speed = 1
	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	attack_verb = list("chopped", "sliced", "cut", "reaped")


