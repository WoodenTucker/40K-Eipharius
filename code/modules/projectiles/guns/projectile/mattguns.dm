//Shitty variant of the normal bolt action rifle.

// Accuracy Guide. Accuracy of -4 = Miss 1/3 shots on average. Accuracy of 0 = You never miss. Make sure weapon accuracy is never higher then -1 unless you want perfect accuracy.
// Skills ONLY effect weapon spread. If the skill of a character is below 6 they'll have a hard time hitting anything.

/obj/item/gun/projectile/shotgun/pump/boltaction
	name = "\improper Boscolet Pattern Stub Rifle"
	desc = "The stub rifle is a common weapon seen across the galaxy. Boscolet is a standard rifle pattern, firing large-bore rounds."
	icon_state = "boltaction"
	item_state = "boltaction"
	wielded_item_state = "boltaction-wielded"
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle
	empty_icon = "boltaction-e"
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	far_fire_sound = "sniper_fire"
	move_delay = 8
	one_hand_penalty = 25
	accuracy = 0
	fire_delay = 3
	force = 15
	sales_price = 10
	var/gping = TRUE

/obj/item/gun/projectile/shotgun/pump/boltaction/pump(mob/M as mob, silent = FALSE)
	if(is_jammed)
		if(M)
			M.visible_message("\The [M] begins to unjam [src].", "You begin to clear the jam of [src]")
		if(!do_after(M, 40, src))
			return
		is_jammed = 0
		playsound(src.loc, 'sound/effects/unjam.ogg', 50, 1)
		if(M)
			M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		return

	if(!chambered && !loaded.len)//If there's an empty icon then use it.
		pumpsound = null
		if (gping && !loaded.len)
			playsound(src, 'sound/effects/gping.ogg', 100, 1)
			to_chat(M, "<span class='warning'>Ping!</span>")
		if(M)
			to_chat(M, "<span class='warning'>It's empty.</span>")
		return

	if(chambered && loaded.len)
		pumpsound = initial(pumpsound)

	else if(!chambered && loaded.len)
		pumpsound = forwardsound

	if(chambered)//We have a shell in the chamber
		chambered.loc = get_turf(src)//Eject casing
		playsound(src, casingsound, 100, 1)
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	if(!chambered && !loaded.len)
		pumpsound = backsound

	update_icon()

	if(!silent)
		playsound(src, pumpsound, 45, 1)

	if(M)
		M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
/*
/obj/item/gun/projectile/shotgun/pump/boltaction/verb/scope_attach(mob/user)
		new /obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter (get_turf(src))
		playsound(loc, 'sound/items/Screwdriver.ogg', 70, 1)
		visible_message("[user] quickly attaches a scope to the [src] and adjusts it's firing mechanism.")
		qdel(src)
*/
/obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter
	name = "\improper Boscolet Pattern Stub Rifle"
	desc = "The stub rifle is a common weapon seen across the galaxy. Boscolet Frontiersman is a standard rifle firing large-bore rounds. This modification includes scope for sharpshooting and improved firing mechanism."
	icon_state = "boltactionsharp"
	item_state = "boltactionsharp"
	empty_icon = "boltactionsharp-e"
	wielded_item_state = "boltaction-wielded"
	loaded_icon = "boltactionsharp"
	unwielded_loaded_icon = "boltactionsharp"
	wielded_loaded_icon = "boltaction-wielded"
	unloaded_icon = "boltactionsharp-e"
	unwielded_unloaded_icon = "boltactionsharp"
	wielded_unloaded_icon = "boltaction-wielded"
	accuracy = 1.5
	sales_price = 20

/*
/obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter/verb/scope_detach(mob/user)
		qdel(src)
		new /obj/item/gun/projectile/shotgun/pump/boltaction/ (get_turf(src))
		playsound(loc, 'sound/items/Screwdriver.ogg', 70, 1)
		visible_message("[user] quickly detaches a scope from the [src] and adjusts it's firing mechanism.")
*/
/obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2)

/obj/item/gun/projectile/shotgun/pump/boltaction/sharpshooter/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()

//Paryying.

/obj/item/gun/projectile/shotgun/pump/boltaction/handle_shield(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_sword_parry(user, damage, damage_source, attacker, def_zone, attack_text))
		return 1
	return 0

// kroot

/obj/item/gun/projectile/shotgun/pump/boltaction/krootrifle
	name = "\improper Kroot Rifle"
	desc = "A Kroot-issue rifle. Quite exotic looking. Fires a malformed slug sure to tear through the enemy. The end of the rifle is decorated with blades sharpened to tear flesh."
	icon_state = "krootrifle"
	item_state = "krootrifle"
	wielded_item_state = "krootrifle-wielded"
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	caliber = "640" //its basically a musket ball
	ammo_type = /obj/item/ammo_casing/krootbullet
	one_hand_penalty = 7
	empty_icon = "krootrifle"
	far_fire_sound = "sniper_fire"
	fire_delay = 6
	move_delay= 2.5
	one_hand_penalty = 10
	accuracy = 3
	force = 30
	sharp = 1
	screen_shake = 0.5
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"
	sales_price = 40

//AMMO

/obj/item/ammo_casing/brifle
	desc = "An old worn out looking bullet casing."
	caliber = "763"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/brifle
	icon_state = "brifle"
	spent_icon = "brifle-casing"
	ammo_stack = /obj/item/ammo_magazine/handful/brifle_handful/two
/*
/obj/item/ammo_casing/brifle/ap
	desc = "An old worn out looking AP bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762/brifle/ap
	ammo_stack = /obj/item/ammo_magazine/handful/brifle_handful/ap/two

/obj/item/ammo_casing/brifle/ms
	desc = "An old worn out looking MS bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/a762/brifle/ms
	ammo_stack = /obj/item/ammo_magazine/handful/brifle_handful/ms/two/
*/
/obj/item/projectile/bullet/rifle/a762/brifle
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	penetrating = TRUE
	damage = 65
	armor_penetration = 10

/obj/item/projectile/bullet/rifle/a762/brifle/ap
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	damage = 68
	armor_penetration = 20
	penetrating = TRUE

/obj/item/projectile/bullet/rifle/a762/brifle/ms
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	damage = 75
	armor_penetration = -10
	penetrating = TRUE

/obj/item/projectile/bullet/rifle/kroot
	fire_sound = 'sound/weapons/gunshot/auto5.ogg'
	penetrating = TRUE // fuck that shit penetrative rounds
	damage = 70
	armor_penetration = 20

/obj/item/ammo_magazine/brifle
	name = "Rifle Box"
	desc = "A box of rifle ammo"
	icon_state = "rbox"
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 20

/obj/item/ammo_magazine/kroot
	name = "Kroot Rifle Box"
	desc = "A box of Kroot rifle ammo"
	icon_state = "rbox"
	caliber = "640"
	ammo_type = /obj/item/ammo_casing/krootbullet
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 20

//Shitty shotgun

/obj/item/gun/projectile/shotgun/pump/voxlegis
	name = "Voxlegis"
	desc = "A shotgun favoured by the enforcers of the sector. Due to the possibility of quickly loading lethal or non-lethal shells."
	icon_state = "voxlegisnew"
	item_state = "voxlegisnew"
	wielded_item_state = "winchester-wielded"
	str_requirement = 8
	ammo_type = /obj/item/ammo_casing/shotgun
	empty_icon = "voxlegisnew-e"
	move_delay = 3
	one_hand_penalty = 4
	accuracy = 0.5
	fire_delay= 3
	sales_price = 30

/obj/item/gun/projectile/automatic/flamer
	name = "Scorcher"
	desc = "An incredibly dangerous hand-held flamethrower used often in infiltration or siege operations."
	icon_state = "flamer"
	item_state = "flamer"
	wielded_item_state = "flamer-wielded"
	caliber = "flamer"
	one_hand_penalty = 10
	str_requirement = 10
	fire_sound = 'sound/effects/fire01.ogg'
	slot_flags = SLOT_BACK|SLOT_S_STORE
	casingsound = null//No eject sound for you.
	firemodes = list()
	accuracy = 0
	automatic = 1
	fire_delay = 16
	move_delay = 6
	burst=1
	magazine_type = /obj/item/ammo_magazine/flamer
	allowed_magazines = /obj/item/ammo_magazine/flamer
	can_jam = FALSE

	loaded_icon = "flamer"
	unwielded_loaded_icon = "flamer"
	wielded_loaded_icon = "flamer-wielded"
	unloaded_icon = "flamer-e"
	unwielded_unloaded_icon = "flamer-e"
	wielded_unloaded_icon = "flamer-wielded-e"
	sales_price = 60

	gun_type = GUN_LMG //anyone can use this... just not anyone should.

/obj/item/gun/projectile/automatic/flamer/pistol
	name = "Handheld Scorcher"
	desc = "The handheld, pistol varient of the flamer. It shoots slower than it's larger brother and is more difficult to hold in your single hand."
	icon_state = "flamerp"
	item_state = "flamerp"
	wielded_item_state = "flamer-wielded"
	caliber = "flamer"
	one_hand_penalty = 5
	str_requirement = 16
	fire_sound = 'sound/effects/fire01.ogg'
	slot_flags = SLOT_BACK|SLOT_S_STORE
	casingsound = null//No eject sound for you.
	firemodes = list()
	accuracy = 0
	automatic = 1
	fire_delay = 22
	move_delay = 6
	burst=1
	magazine_type = /obj/item/ammo_magazine/flamer
	allowed_magazines = /obj/item/ammo_magazine/flamer
	can_jam = FALSE

	loaded_icon = "flamerp"
	unwielded_loaded_icon = "flamerp"
	wielded_loaded_icon = "flamer-wielded"
	unloaded_icon = "flamerp-e"
	unwielded_unloaded_icon = "flamerp-e"
	wielded_unloaded_icon = "flamer-wielded-e"
	sales_price = 60

	gun_type = GUN_LMG //anyone can use this... just not anyone should.

// Stubber //

/obj/item/gun/projectile/automatic/heavystubber
	name = "Agripinaa Pattern Heavy Stubber"
	desc = "Belt-fed and with a bipod for stable firing from the prone position, the weapon was fitted with both backsight and foresight, carrying handle, and perforated outer barrel to aid in cooling. Chambered in 5.56"
	icon_state = "hmg"
	item_state = "hmg"
	str_requirement = 13
	w_class = ITEM_SIZE_HUGE
	force = 17
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 50
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/a556
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/a556/mg08
	allowed_magazines = /obj/item/ammo_magazine/box/a556/mg08
	wielded_item_state = "hmg-wielded"
	fire_sound = 'sound/weapons/gunshot/auto2.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "hmg"
	unwielded_loaded_icon = "hmg"
	wielded_loaded_icon = "hmg-wielded"
	unloaded_icon = "hmg-e"
	unwielded_unloaded_icon = "hmg-e"
	wielded_unloaded_icon = "hmg-wielded-e"
	burst = 1
	firemodes = list()
	gun_type = GUN_LMG
	move_delay= 5
	one_hand_penalty = 8 //it is a HMG, but its also not a bolter, this is probably enough penalty
	accuracy = 0
	fire_delay = 1.6
	sales_price = 31

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=1.6, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="4-round bursts", burst=4, fire_delay=4.3, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)



// adeptus mechanicus adamantium LMG
//icon = 'icons/obj/weapons/gun/projectile.dmi'

/obj/item/gun/projectile/automatic/heavystubber/cognis
	name = "Cognis Pattern Heavy Stubber"
	desc = "A heavy stubber forged by the worlds of the Omnissiah's will. Particular in maintenance and appearance, it is the proud work of any tech priest. Uses standard stubber ammo"
	icon_state = "cognisLMG"
	item_state = "cognisLMG"
	str_requirement = 13 //change as SOON as skitarii stats are buffed and working!!!
	loaded_icon = "cognisLMG"
	unwielded_loaded_icon = "cognisLMG"
	wielded_loaded_icon = "hmg-wielded"
	unloaded_icon = "cognisLMG-e"
	unwielded_unloaded_icon = "cognisLMG-e"
	wielded_unloaded_icon = "hmg-wielded-e"
	burst = 1
	fire_delay = 1.4
	one_hand_penalty = 9 //by the omnissiah you MUST hold the machine spirit properly
	sales_price = 0

	firemodes = list(
		list(mode_name="semi-automatic",       burst=1, fire_delay=1.4, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="4-round bursts", burst=4, fire_delay=4, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)

/obj/item/gun/projectile/automatic/heavystubber/villiers
	name = "Villiers Heavy Stubber"
	desc = "A rugged belt-fed stubber that is long out of service. This one seems to have been diligently maintained over the years."
	move_delay= 4.5
	one_hand_penalty = 7
	accuracy = 0.5
	fire_delay = 1.7
	sales_price = 32

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=1.7, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="2-round bursts", burst=2, fire_delay=3, burst_accuracy=list(0,-1,-1), dispersion=null, automatic = 0),
		)

// stub rifles, mag fed

/obj/item/gun/projectile/automatic/agripinaaii
	name = "Agripinaa Pattern Stub rifle MK II"
	desc = "A rugged stub rifle of Agripinaa design, The MK II is semi automatic and highly damaging with it's 7.62 rounds. "
	icon_state = "agripinaa" // Object Icon
	item_state = "agripinaa" // On-Mob
	unloaded_icon = "agripinaa_e" // Object Icon
	loaded_icon = "agripinaa" // Object Icon
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	fire_sound = 'sound/weapons/gunshot/auto2.ogg'
	move_delay = 2.3
	one_hand_penalty = 20
	accuracy = 0
	automatic = 0
	fire_delay = 4
	sales_price = 30


	magazine_type = /obj/item/ammo_magazine/a762
	allowed_magazines = /obj/item/ammo_magazine/a762

	gun_type = GUN_SEMIAUTO

	wielded_item_state = "agripinaa"
	unwielded_loaded_icon = "agripinaa"
	wielded_loaded_icon = "agripinaa"
	unwielded_unloaded_icon = "agripinaa_e"
	wielded_unloaded_icon = "agripinaa_e"

	firemodes = null

/obj/item/gun/projectile/automatic/messina
	name = "Messina Pattern Autogun"
	desc = "A locally produced pattern, chambered in 5.56 and not the highest quality material, to say the least..."
	icon_state = "autogun_agrip" // Object Icon
	item_state = "autorifle" // On-Mob
	unloaded_icon = "autogun_agrip-e" // Object Icon
	loaded_icon = "autogun_agrip" // Object Icon
	caliber = "a556"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	fire_sound = 'sound/weapons/gunshot/auto2.ogg'
	move_delay = 7
	one_hand_penalty = 15
	accuracy = -2
	automatic = 1
	fire_delay = 3
	sales_price = 25

	magazine_type = /obj/item/ammo_magazine/c556
	allowed_magazines = /obj/item/ammo_magazine/c556

	gun_type = GUN_SEMIAUTO

	wielded_item_state = "autorifle-wielded"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"

	firemodes = null

// Boltgun
/obj/item/gun/projectile/boltrifle //boltus
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XIIIth Chapter Ultramarines's colour scheme."
	icon_state = "ultrabolter"
	str_requirement = 18 //IS12 has a 20 str cap so dont go over it
	w_class = ITEM_SIZE_HUGE
	force = 30
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 30
	caliber = ".75"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/bolter
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_rifle_magazine
	allowed_magazines = list(/obj/item/ammo_magazine/bolt_rifle_magazine)
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "ultrabolter-30"
	unloaded_icon = "ultrabolter-e"
	wielded_item_state = "hbolter" // Do not remove this. We do not have any sprites for Bolters on-mob beyond this, it is perfect.
	unwielded_loaded_icon = "hbolter"
	wielded_loaded_icon = "hbolter"
	unwielded_unloaded_icon = "hbolter-e"
	wielded_unloaded_icon = "hbolter-e"
	fire_delay = 2
	burst = 1
	move_delay = 3
	one_hand_penalty = 10
	firemodes = list()
	gun_type = GUN_AUTOMATIC
	accuracy = 2
	sales_price = 100

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=4, burst_accuracy=list(0,0,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)

/obj/item/gun/projectile/boltrifle/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ultrabolter-30"
	else
		icon_state = "ultrabolter-e"

/obj/item/gun/projectile/boltrifle/raven
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XIXth Chapter Raven Guards's colour scheme."
	icon_state = "ravenbolter"
	loaded_icon = "ravenbolter-30"
	unloaded_icon = "ravenbolter-e"

/obj/item/gun/projectile/boltrifle/ravenbolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ravenbolter-30"
	else
		icon_state = "ravenbolter-e"

/obj/item/gun/projectile/boltrifle/sally
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XVIIIth Chapter Salamanders's colour scheme."
	icon_state = "sallybolter"
	loaded_icon = "sallybolter-30"
	unloaded_icon = "sallybolter-e"

/obj/item/gun/projectile/boltrifle/sally/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sallybolter-30"
	else
		icon_state = "sallybolter-e"

/obj/item/gun/projectile/boltrifle/bang
	name = "Baal Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in IXth Chapter Blood Angels's colour scheme."
	icon_state = "bangbolter"
	loaded_icon = "bangbolter-30"
	unloaded_icon = "bangbolter-e"

/obj/item/gun/projectile/boltrifle/bang/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "bangbolter-30"
	else
		icon_state = "bangbolter-e"

/obj/item/gun/projectile/boltrifle/lockebolter //needs lots of work and love, ok standin for now
	name = "Locke Pattern bolter"
	desc = "The Locke Pattern Bolter, designed for Adeptus Arbites personnel when heavier firepower are required. Can also be found in hands of Astra Militarum officers, veterans and Commissar, Though relatively uncommon. It is a human-sized Bolter, Thus it's very popular among the troops and the lucky ones who get their hands on one of these bad boy."
	icon_state = "lockebolter"
	str_requirement = 10
	w_class = ITEM_SIZE_HUGE
	force = 15
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 30
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	load_method = MAGAZINE
	one_hand_penalty = 10 //its a bolter not a toy gun
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "lockebolter-30"
	unloaded_icon = "lockebolter-e"
	wielded_item_state = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	fire_delay = 2.4
	burst = 1
	move_delay = 3
	firemodes = list()
	gun_type = GUN_AUTOMATIC
	accuracy = -0.5
	sales_price = 0

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=2.4, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=4.6, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		)

/obj/item/gun/projectile/boltrifle/lockebolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "lockebolter-30"
	else
		icon_state = "lockebolter-e"

/obj/item/gun/projectile/boltrifle/lockebolter/infernobolter
	name = "Inferno Bolter"
	desc = "Corrupted by the warp, this bolter once was owned by a Heretic Astartes. The chaos infused into it made it capable of being fired by a human. But it's capabilities have suffered. Just as planned."
	icon_state = "1kbolter"
	loaded_icon = "1kbolter-30"
	unloaded_icon = "1kbolter-e"
	accuracy = 1
/obj/item/gun/projectile/boltrifle/lockebolter/infernobolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "1kbolter-30"
	else
		icon_state = "1kbolter-e"

/obj/item/gun/projectile/boltrifle/sisterbolter
	name = "Godwyn-De'az Pattern Bolter Rifle"
	desc = "A modified bolter rifle, developed specifically for the Adepta Sororitas. This rifle is almost more scripture than weapon, and is clearly wielded by a devout woman. A large Sarissa is attached to the end of it, useful for carving the Emperor's Mercy from the flesh of those who defy him. <i>She was an angel, pure as righteous destruction. She laid low the twisted and lifted the hearts of the righteous. At her passing, a million voices cried out her name. Shall we ever again see her like? No, not now, nor ever again...</i>"
	force = 20 //what even is this description?
	sharp = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"
	str_requirement = 14
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 30
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	one_hand_penalty = 10 //its still a bolter bro...
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "sisterbolter-30"
	unloaded_icon = "sisterbolter-30-e"
	wielded_item_state = "autoshotty"
	loaded_icon = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	fire_delay = 1.9
	burst = 1
	move_delay = 3
	firemodes = list()
	accuracy = 2.2 //only one gun per round so yeah
	gun_type = GUN_AUTOMATIC
	sales_price = 130

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=1.9, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=3.8, burst_accuracy=list(0,-1,-1), dispersion=null, automatic = 0),
		)

/obj/item/gun/projectile/boltrifle/sisterbolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sisterbolter-30"
	else
		icon_state = "sisterbolter-30-e"

//ORKA

// NEEDS BALANCING ! //

/obj/item/gun/projectile/ork/automatic/shoota
	name = "Shoota"
	desc = "A tree borst shoota. Da mekboyz even added dem coolin holes fer de barrel for ya, be grateful ya git! Load'd wid da .75 caliba boolets innit."
	icon_state = "shoota"
	item_state = "shoota"
	w_class = ITEM_SIZE_LARGE
	force = 25
	max_shells = 30
	caliber = ".75"
	can_jam = TRUE
	move_delay = 5
	one_hand_penalty = 5
	accuracy = -5
	ammo_type = /obj/item/ammo_casing/ork/shoota
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/ork/shoota
	allowed_magazines = list(/obj/item/ammo_magazine/ork/shoota)
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	gun_type = GUN_AUTOMATIC
	fire_delay = 3
	burst = 3
	sales_price = 15

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="4-round bursts", burst=4, fire_delay=6, burst_accuracy=list(-1,-1,-1), dispersion=list(0.2, 0.4, 0.3), automatic = 0),
		)



/obj/item/gun/projectile/ork/automatic/shoota/bladed
	name = "Bladed Shoota"
	desc = "A tree borst Shoota. Da mekboyz even added dem coolin holes fer de barrel for ya, be grateful ya git! Dey added a STABBY on the end, too! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootabayo"
	item_state = "shootabayo"
	w_class = ITEM_SIZE_LARGE
	force = 33
	max_shells = 30
	caliber = ".75"
	one_hand_penalty = 7
	sales_price = 20

/obj/item/gun/projectile/ork/automatic/shoota/kustom
	name = "Kustom Shoota"
	desc = "Da fancy pants kustom shoota for a 'eal smarty boy! Ya move fast and shoot even fasta! CAUSE IT'S RED! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootakustom"
	item_state = "shootakustom"
	force = 20
	move_delay = 1 // smg
	one_hand_penalty = 2
	accuracy = -4
	sales_price = 25

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="6-round bursts", burst=6, fire_delay=7, burst_accuracy=list(-1,-1,-1), dispersion=list(0.2, 0.4, 0.5), automatic = 0),
		)

/obj/item/gun/projectile/ork/automatic/shoota/big
	name = "Big Shoota"
	desc = "Da biggest shoota, a shoota boy can get! Just holdin' dis 'ere gun makez ya wanna neva let go of da trigga, dat wood be very UNORKY! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootabig"
	item_state = "shootabig"
	w_class = ITEM_SIZE_LARGE
	force = 15 // heffy and slow to hit wid innit
	max_shells = 50
	caliber = ".75"
	can_jam = TRUE
	move_delay = 10
	one_hand_penalty = 15
	accuracy = -6
	gun_type = GUN_AUTOMATIC
	fire_delay = 8
	burst = 5
	automatic = 0.6
	firemodes = list(
		list(mode_name="'ORMAL AUTO'", burst=4, fire_delay=4, burst_accuracy=list(-3,-5,-6), dispersion=list(0.4, 0.5, 0.6), automatic = 0.5),
		list(mode_name="FULLA AUTO", burst=6, fire_delay=5.5, burst_accuracy=list(-6,-5,-8), dispersion=list(0.7, 0.6, 0.5), automatic = 0.7),

	)
	sales_price = 30

/obj/item/gun/projectile/ork/automatic/shoota/furtha
	name = "Furtha Shoota"
	desc = "Fur em gitz dat like to shoot from afar! Da scope is busted, blame da gretchin! Load'd wid da .75 caliba boolets innit."
	icon_state = "shootafurtha"
	item_state = "shootafurtha"
	force = 15
	move_delay = 8
	one_hand_penalty = 15
	accuracy = -3.5
	gun_type = GUN_SNIPER
	sales_price = 50

	firemodes = list(
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="semi-automatic", burst=1, fire_delay=3, burst_accuracy=null, dispersion=null, automatic = 0),
		)


//Eldar

/obj/item/gun/projectile/eldar/scatapult
	name = "Shuriken Catapult"
	desc = "A large shuriken-firing ballistic weapon that is the standard and most common armament found amongst Craftworld Aeldari warriors."
	icon_state = "scatapult"
	str_requirement = 12
	w_class = ITEM_SIZE_LARGE
	force = 15
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 1000 //Lots of ammo
	caliber = "shuriken"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5, TECH_ILLEGAL = 3)
	ammo_type = /obj/item/ammo_casing/shuriken
	load_method = MAGAZINE
	one_hand_penalty = 1 //Eldar magic
	magazine_type = /obj/item/ammo_magazine/catapult_magazine
	allowed_magazines = /obj/item/ammo_magazine/catapult_magazine
	handle_casings = CLEAR_CASINGS
	auto_eject = 1
	fire_sound = 'sound/weapons/guns/fire/needler_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "scatapult"
	unloaded_icon = "scatapult-e"
	fire_delay = 3
	burst = 1
	move_delay = 0
	automatic = 1
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0.5, one_hand_penalty=1, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",   	 burst=5, fire_delay=1.5, one_hand_penalty=2, burst_accuracy=list(0,1,1), dispersion=list(0.0, 0.1, 0.2), automatic = 2)
		)
	gun_type = GUN_AUTOMATIC
	accuracy = 1

/obj/item/gun/projectile/eldar/scatapult/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "scatapult"
	else
		icon_state = "scatapult-e"

/obj/item/gun/projectile/automatic/galvanic/rifle
	name = "Mark IV Arkhan Pattern Galvanic Rifle"
	desc = "A semi automatic rifle, modelled after the flintlock weapons of the past. Favoured by Skitarii rangers, this weapon is incredibly dangerous."
	icon_state = "galvrifle" // OBJ (Make sure when adding any projectile gun to include an icon version with -0 at the end. e.g. snipermusket-0 or it will break)
	item_state = "musket" // ON MOB (This uses a different on-mob to wielded due to sniper musket not having a one handed icon)
	loaded_icon = "galvrifle" // OBJ
	unloaded_icon = "galvrifle" // OBJ
	fire_sound = 'sound/weapons/gunshot/loudbolt.ogg'
	wielded_item_state = "las_musket"
	unwielded_loaded_icon = "musket"
	wielded_loaded_icon = "las_musket"
	unwielded_unloaded_icon = "musket"
	wielded_unloaded_icon = "las_musket"
	caliber = "galvanic"
	max_shells = 7
	str_requirement = 13
	move_delay = 4
	one_hand_penalty = 7
	accuracy = 0
	fire_delay = 4.9
	slot_flags = SLOT_BACK|SLOT_S_STORE
	magazine_type = /obj/item/ammo_magazine/galvanic
	allowed_magazines = list(/obj/item/ammo_magazine/galvanic, /obj/item/ammo_magazine/galvanic/fire)
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO


/obj/item/gun/projectile/automatic/radcarbine
	name = "Radium Carbine"
	desc = "A deadly and highly dangerous personal weapon that are used exclusively by the forces of the Skitarii Legions of the Adeptus Mechanicus. It fires highly radioactive rounds."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "emitter_carbine"
	loaded_icon = "emitter_carbine"
	unloaded_icon = "emitter_carbine_e"
	item_state = "emitter_carbine"
	wielded_item_state = "laer"
	fire_sound = 'sound/weapons/gunshot/shotgun3.ogg'
	unwielded_loaded_icon = "emitter_carbine"
	wielded_loaded_icon = "laer"
	unwielded_unloaded_icon = "emitter_carbine_e"
	wielded_unloaded_icon = "laer"
	caliber = "rad"
	max_shells = 30
	str_requirement = 11
	move_delay= 4
	one_hand_penalty = 4
	accuracy = 0.5 //Good gun, well maintained by the Mechanicus
	fire_delay = 3.5
	slot_flags = SLOT_BACK|SLOT_S_STORE
	magazine_type = /obj/item/ammo_magazine/radcarbine
	allowed_magazines = list(/obj/item/ammo_magazine/radcarbine)
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO

/obj/item/gun/projectile/automatic/radcarbine/radpistol
	name = "Radium Pistol"
	desc = "A sidearm favoured by Skitarii Vanguards and Ranger Alphas."
	icon = 'icons/obj/weapons/gun/energy.dmi'
	icon_state = "teslar"
	item_state = "pulse_pistol"
	wielded_item_state = "pulse_pistol"
	fire_sound = 'sound/weapons/gunshot/shotgun3.ogg'
	loaded_icon = "teslar"
	unwielded_loaded_icon = "pulse_pistol"
	wielded_loaded_icon = "pulse_pistol"
	unloaded_icon = "teslar0"
	unwielded_unloaded_icon = "pulse_pistol0"
	wielded_unloaded_icon = "pulse_pistol0"
	caliber = "rad"
	max_shells = 10
	str_requirement = 11
	move_delay= 2
	one_hand_penalty = 1
	accuracy = 0.6 //Good gun, well maintained by the Mechanicus
	fire_delay = 2.5
	slot_flags = SLOT_BELT|SLOT_S_STORE
	magazine_type = /obj/item/ammo_magazine/radcarbine/radpistol
	allowed_magazines = list(/obj/item/ammo_magazine/radcarbine/radpistol)
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO
