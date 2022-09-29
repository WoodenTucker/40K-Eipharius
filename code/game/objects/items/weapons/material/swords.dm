#define SLASH 1
#define STAB 2
#define BASH 3


/obj/item/material/sword
	name = "claymore"
	desc = "You use the sharp part on your foes. And the flat part on your lesser foes."
	icon_state = "claymore"
	item_state = "claymore"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_HUGE
	force = 35
	block_chance = 10
	// force_divisor = 0.8 // Do not turn this back on.
	// thrown_force_divisor = 0.2 //
	sharp = 1
	edge = 1
	attack_verb = list("slashed", "sliced")
	hitsound = "slash_sound"
	var/atk_mode = SLASH
	sharpness = TRUE
	block_chance = 35
	applies_material_colour = FALSE
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25
	weapon_speed_delay = 8
	parry_sounds = list('sound/weapons/bladeparry1.ogg', 'sound/weapons/bladeparry2.ogg', 'sound/weapons/bladeparry3.ogg', 'sound/weapons/bladeparry4.ogg')
	drop_sound = 'sound/items/drop_sword.ogg'
	unbreakable = TRUE
	sales_price = 0
	var/isblessed = 0


/obj/item/material/sword/handle_shield(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
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


/obj/item/material/sword/attack_self(mob/user)
	..()
	if(atk_mode == SLASH)
		switch_intent(user,STAB)
	else if(atk_mode == STAB)
		switch_intent(user,BASH)
	else if(atk_mode == BASH)
		switch_intent(user,SLASH)



/obj/item/material/sword/proc/switch_intent(mob/user,var/intent)
	switch(intent)
		if(STAB)
			atk_mode = STAB
			to_chat(user, "You will now stab.")
			edge = 1
			sharp = 1
			attack_verb = list("stabbed")
			hitsound = "stab_sound"
			return
		if(BASH)
			atk_mode = BASH
			to_chat(user, "You will now bash with the hilt.")
			edge = 0
			sharp = 0
			attack_verb = list("bashed", "smacked")
			hitsound = "swing_hit"
			return

		if(SLASH)
			atk_mode = SLASH
			to_chat(user, "You will now slash.")
			edge = TRUE
			sharp = TRUE
			attack_verb = list("slashed", "diced")
			hitsound = "slash_sound"
			return


/obj/item/material/sword/replica
	edge = 0
	sharp = 0
	force = 15
	block_chance = 30

/obj/item/material/sword/sabre
	name = "iron sabre"
	desc = "Like a claymore but for an officer."
	icon_state = "sabre"
	item_state = "sabre"
	force = 33
	force_wielded = 36
	block_chance = 15
	weapon_speed_delay = 7
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE

/obj/item/material/sword/cutro
	name = "cutro blade"
	desc = "A lightweight iron blade with near perfect balance."
	icon_state = "spatha"
	item_state = "spatha"
	force = 26
	force_wielded = 30
	armor_penetration = 15
	block_chance = 30
	weapon_speed_delay = 7
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_NORMAL

/obj/item/material/sword/cutro/adamantine
	name = "cutro blade"
	desc = "A lightweight adamantine blade with near perfect balance."
	color = "#848484"
	force = 28
	force_wielded = 32
	armor_penetration = 18
	block_chance = 34
	weapon_speed_delay = 6

/obj/item/material/sword/broadsword
	name = "heavy broadsword"
	desc = "A heavy iron broadsword."
	icon_state = "claymore"
	item_state = "claymore"
	force = 31
	force_wielded = 39
	armor_penetration = 10
	block_chance = 18
	weapon_speed_delay = 9
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_HUGE

/obj/item/material/sword/broadsword/adamantine
	name = "heavy broadsword"
	desc = "A heavy adamantine broadsword."
	color = "#848484"
	force = 33
	force_wielded = 41
	armor_penetration = 14
	block_chance = 22
	weapon_speed_delay = 8

/obj/item/material/sword/machete
	name = "iron machete"
	desc = "Both a vine removal tool, and a limb removal tool. Use it on vines, and also people who annoy you."
	icon_state = "machete"
	item_state = "machete"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	force = 25
	force_wielded = 29
	block_chance = 10
	weapon_speed_delay = 6

/obj/item/material/sword/machete/chopper
	name = "iron chopper"
	desc = "Both a vine removal tool, and a limb removal tool. Use it on vines, and also people who annoy you."
	icon_state = "machete_imp"
	item_state = "salvagedmachete"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	force = 25
	force_wielded = 32
	armor_penetration = 10
	block_chance = 15
	weapon_speed_delay = 7

/obj/item/material/sword/machete/chopper/heavy
	name = "heavy iron chopper"
	desc = "Both a vine removal tool, and a limb removal tool. Use it on vines, and also people who annoy you."
	icon_state = "scrapsabre"
	item_state = "salvagedmachete"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	force = 27
	force_wielded = 34
	armor_penetration = 10
	block_chance = 16
	weapon_speed_delay = 8

/obj/item/material/sword/demon
	name = "demon sword"
	desc = "A sword possessed by an entity of the warp. Once used by a great noble of imperium before it was corrupted. How far it has fallen..."
	icon_state = "Scorpion_CS"
	item_state = "Scorpion_CS"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 14
	force = 31
	force_wielded = 38
	armor_penetration = 10
	block_chance = 14
	sharpness = TRUE
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 7
	sales_price = 100

// NON MATERIAL WEAPONS //

/obj/item/melee/trench_axe
	name = "trench axe"
	desc = "Used mainly for murdering those on the enemy side."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "trenchaxe"
	item_state = "trenchaxe"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 25
	force_wielded = 35
	armor_penetration = 10
	throwforce = 18
	block_chance = 12
	sharp = TRUE
	hitsound = "slash_sound"
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 8
	w_class = ITEM_SIZE_HUGE
	edge = 1

/obj/item/melee/trench_axe/glaive 
	name = "saintie"
	desc = "A powerful warglave used for singular felling blows against armored opponents(pronounced san-tee)."
	icon_state = "glaive"
	item_state = "spear"
	wielded_icon = "spear-w"
	force = 25
	force_wielded = 38
	armor_penetration = 10
	throwforce = 18
	block_chance = 26
	weapon_speed_delay = 11
	w_class = ITEM_SIZE_HUGE

/obj/item/melee/trench_axe/glaive/adamantine
	name = "saintie"
	desc = "A powerful adamantine warglave used for singular felling blows against armored opponents(pronounced san-tee)."
	color = "#848484"
	force = 27
	force_wielded = 40
	armor_penetration = 14
	block_chance = 29
	weapon_speed_delay = 10

/obj/item/melee/trench_axe/bardiche
	name = "bardiche"
	desc = "A powerful polearm used for singular felling blows against armored opponents."
	icon_state = "bardiche"
	item_state = "savaxe"
	wielded_icon = "savaxe"
	force = 22
	force_wielded = 36
	armor_penetration = 10
	throwforce = 15
	block_chance = 12
	weapon_speed_delay = 8
	w_class = ITEM_SIZE_HUGE

/obj/item/melee/trench_axe/bspear
	name = "hunting spear"
	desc = "An incredibly lightweight and nimble spear used by hunters against large game animals."
	icon_state = "bone_spear"
	item_state = "bone_spear"
	wielded_icon = "bone_spear-w"
	force = 25
	force_wielded = 30
	armor_penetration = 10
	throwforce = 22
	block_chance = 22
	weapon_speed_delay = 6
	edge = 0
	w_class = ITEM_SIZE_LARGE

/obj/item/melee/trench_axe/lance
	name = "fuscina war spear"
	desc = "A heavy war spear used to strike from a distance."
	icon_state = "lance"
	item_state = "lance"
	wielded_icon = "lance-w"
	force = 21
	force_wielded = 41
	armor_penetration = 10
	block_chance = 24
	weapon_speed_delay = 11
	edge = 0
	w_class = ITEM_SIZE_HUGE

/obj/item/melee/trench_axe/lance/adamantine
	name = "fuscina war spear"
	desc = "A heavy adamantine war spear forged by a master smith of unknown origin."
	color = "#848484"
	force = 23
	force_wielded = 43
	armor_penetration = 14
	block_chance = 28
	weapon_speed_delay = 10

/obj/item/material/sword/commissword/sabre
	name = "Sabre"
	desc = "A masteredcrafted sabre of exceptional quality, it has a duelists grip."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "sabre"
	item_state = "sabre"
	block_chance = 16
	sales_price = 35
	armor_penetration = 5

/obj/item/material/sword/choppa
	name = "choppa"
	desc = "Fixed out of a rusted sheet of metal, this choppa looks too big to be a sword. More like a piece of iron."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	str_requirement = 13
	icon_state = "choppa"
	item_state = "choppa"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 26
	force_wielded = 36
	armor_penetration = 20
	block_chance = 5
	sharp = 1
	hitsound = "slash_sound"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 2
	weapon_speed_delay = 9

/obj/item/melee/classic_baton/daemonhammer
	name = "Daemonhammer"
	desc = "A power weapon of incredible legend and stature amongst the Ordos Malleus, this Daemonhammer has been used by countless Inquisitor's in their conflict against the unholy creatures of chaos."
	icon_state = "thunder_hammer"
	item_state = "thunder_hammer"
	wielded_icon = "thunder_hammer-w"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	str_requirement = 13
	force = 32
	force_wielded = 52
	armor_penetration = 10
	block_chance = 20
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 8
	sales_price = 0

// CHAINSWORDS

/obj/item/melee/chain/mercycs
	name = "Locke Pattern Double-Edged Chainsword"
	desc = "Nicknamed 'Mercy', This Chainsword is designed for a absolute lunatic, it comes with two ripping edges. Designed for maximum rip and tear."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mercychainsword"
	item_state = "mercychainsword"
	wielded_icon = "mercychainsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 13
	force = 37
	force_wielded = 44
	armor_penetration = 15
	block_chance = 10
	sharp = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 10
	sales_price = 50
	w_class = ITEM_SIZE_HUGE
	edge = 1

/obj/item/melee/chain/inqcs
	name = "Drusian Pattern Chainsword"
	desc = "Nicknamed the 'Crusader', It's a common Chainsword pattern issued to Inquisitorial agents of the Inquisition in the Koronus Expanse, Designed solely to smite the filthy xenos."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "inqchainsword"
	item_state = "inqchainsword"
	wielded_icon = "inqchainsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 11
	force_wielded = 41
	force = 35
	armor_penetration = 9
	block_chance = 15
	sharp = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 10
	sales_price = 45
	w_class = ITEM_SIZE_HUGE
	edge = 1

/obj/item/melee/chain/inqcs/guard // making them inqcs because it has the shittiest stats, dont want these to be strong
	name = "Imperial Guard chainsword" //add it to guard outfits later down the track
	desc = "A chainsword, likely belonging to an NCO or higher rank in the Astra Militarium. Under the golden eagle it reads 'For the Throne'"
	icon_state = "guardchains"
	item_state = "inqchainsword"
	sales_price = 40
	w_class = ITEM_SIZE_HUGE
	weapon_speed_delay = 10
	force_wielded = 39
	force = 33

/obj/item/melee/chain/inqcs/gold
	name = "Terra Pattern Chainsword" //add it to RT's vault
	desc = "A golden chainsword emblazened with over the top shine from it's expensive base metal. Almost as golden as a Custodes, you think."
	icon_state = "goldchains"
	item_state = "goldchains"
	sales_price = 0 //only RT has it. if made craftable, decrease value.
	w_class = ITEM_SIZE_HUGE

/obj/item/melee/chain/pcsword
	name = "Mark I Pattern Chainsword"
	desc = "The standard issued chainsword of the Adeptus Astartes since Millenias ago, Forged by the finest Warsmith, these Chainsword have seen the test of time."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "pcsword"
	item_state = "pcsword"
	wielded_icon = "pcsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 16
	force = 38
	force_wielded = 44
	armor_penetration = 25
	block_chance = 20
	sharp = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 9
	sales_price = 65
	w_class = ITEM_SIZE_HUGE
	edge = 1

/obj/item/melee/chain/pcsword/eviscerator
	name = "Eviscerator Pattern Chainsword"
	desc = "Favoured by Ecclesiarchy Zealots and Ordo Hereticus Members, It's a absurdly large, two-handed chainsword, equipped with a crude disruption field found commonly on power weapon, Though extremely unwieldly, It is a powerful sword, And in the hands of an Astarte, it's truly shines on the Battlefield."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "eviscerator"
	item_state = "eviscerator"
	wielded_icon ="eviscerator"
	str_requirement = 13
	force = 28// it's unwieldy when you don't use two hands, baby sword.
	force_wielded = 44
	armor_penetration = 30
	block_chance = 10
	sharp = TRUE
	w_class = ITEM_SIZE_HUGE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	attack_verb = list("attacked", "sawed", "cleaved", "torn", "cut")
	weapon_speed_delay = 12
	sales_price = 70
	edge = 1



// KNIVES AND SMALL WEAPONS //
// KNIVES AND SMALL WEAPONS //

/obj/item/material/sword/combat_knife
	name = "boot knife"
	desc = "For self defense, and self offense."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "combatknife"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed")
	force = 17
	force_wielded = 20
	block_chance = 20
	w_class = ITEM_SIZE_SMALL
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_knife.ogg'
	equipsound = 'sound/items/holster_knife.ogg'
	sharpness = TRUE//No cutting peoples heads off with a knife please.
	weapon_speed_delay = 6
	drop_sound = 'sound/items/knife_drop.ogg'
	swing_sound = "blunt_swing"

/obj/item/material/sword/combat_knife/rare
	name = "trench knife"
	desc = "For self defense, and self offense."
	icon_state = "knife_trench"
	force = 19
	force_wielded = 22
	block_chance = 25
	weapon_speed_delay = 5

/obj/item/material/sword/combat_knife/bowie
	name = "bowie knife"
	desc = "For self defense, and self offense."
	icon_state = "knife_bowie"
	force = 21
	force_wielded = 24
	block_chance = 28
	weapon_speed_delay = 5

/obj/item/material/sword/combat_knife/glaive
	name = "glaive chopper"
	desc = "A modified glaive head turned into a metal monstrosity."
	icon_state = "glaive-dagger"
	item_state = "salvagedmachete"
	force = 25
	force_wielded = 28
	armor_penetration = 10
	block_chance = 20
	weapon_speed_delay = 9

/obj/item/material/sword/combat_knife/catachan
	name = "catachan knife"
	desc = "The legendary blade of the catachan jungle fighters. The balance of the knife is near perfect."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "catachanfang"
	item_state = "EB-knife"//"knife"
	attack_verb = list("slashed")
	force = 25
	force_wielded = 28
	armor_penetration = 10
	block_chance = 38
	weapon_speed_delay = 5


/obj/item/material/sword/combat_knife/attack(mob/living/carbon/C as mob, mob/living/user as mob)
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




/obj/item/material/scythe
	name = "scythe"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "scythe0"
	item_state = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force = 22
	force_wielded = 26
	block_chance = 25
	armor_penetration = 0
	weapon_speed_delay = 7
	sharp = 1
	throw_speed = 1
	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/material/sword/commissword
	name = "commissar's sword"
	desc = "An orante officer's sword and the Commissar's prized possession. Used to cut down heretics and cowards alike"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "commissword"
	item_state = "commissword"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 33
	force_wielded = 37
	sharp = 1
	block_chance = 18
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 0
	weapon_speed_delay = 7

