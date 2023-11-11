#define SLASH 1
#define STAB 2
#define BASH 3


/obj/item/material/sword
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
	// force_divisor = 0.8 // Do not turn this back on.
	// thrown_force_divisor = 0.2 //
	sharp = 1 //sharp or blunt, blunt causes broken bones, sharp causes organ damage and extra bleeding.
	edge = 1 //edge or not edged, edged has a higher chance of cutting limbs off, no edge has more chance of breaking limb
	attack_verb = list("slashed", "sliced")
	hitsound = "slash_sound"
	var/atk_mode = SLASH
//	sharpness = TRUE  //???
	applies_material_colour = FALSE
	grab_sound_is_loud = TRUE
	grab_sound = 'sound/items/unholster_sword02.ogg'
	equipsound = 'sound/items/holster_sword1.ogg'
	sharpness = 25 //??????
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
	force = 35 //claymore but smaller and lighter
	force_wielded = 45
	block_chance = 40 //acceptable blocking
	weapon_speed_delay = 7
	icon = 'icons/obj/weapons/melee/misc.dmi'
	w_class = ITEM_SIZE_LARGE

/obj/item/material/scythe
	name = "scythe"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "scythe0"
	item_state = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force = 22
	force_wielded = 26
	block_chance = 25
	armor_penetration = 10
	weapon_speed_delay = 7
	sharp = 1
	throw_speed = 1
	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
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
	slot_flags = SLOT_BELT
	sales_price = 0
	weapon_speed_delay = 7
	armor_penetration = 45

