//Shitty variant of the normal bolt action rifle.

// Accuracy Guide. Accuracy of -4 = Miss 1/3 shots on average. Accuracy of 0 = You never miss. Make sure weapon accuracy is never higher then -1 unless you want perfect accuracy.
// Skills ONLY effect weapon spread. If the skill of a character is below 6 they'll have a hard time hitting anything.

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty
	name = "\improper Boscolet Pattern Stub Rifle"
	desc = "The stub rifle is a common weapon seen across the galaxy. Boscolet is a standard rifle pattern, firing large-bore rounds."
	icon_state = "boltaction"
	item_state = "boltaction"
	wielded_item_state = "boltaction-wielded"
	fire_sound = "brifle"
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle
	one_hand_penalty = 10
	empty_icon = "boltaction-e"
	far_fire_sound = "sniper_fire"
	move_delay = 3
	one_hand_penalty = 3
	accuracy = -2
	fire_delay = 3
	force = 15
	var/gping = TRUE

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/pump(mob/M as mob, silent = FALSE)
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

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/verb/scope_attach(mob/user)
		new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter (get_turf(src))
		playsound(loc, 'sound/items/Screwdriver.ogg', 70, 1)
		visible_message("[user] quickly attaches a scope to the [src] and adjusts it's firing mechanism.")
		qdel(src)

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter
	name = "\improper Boscolet Pattern Stub Rifle"
	desc = "The stub rifle is a common weapon seen across the galaxy. Boscolet Frontiersman is a standard rifle firing large-bore rounds. This modification includes scope for sharpshooting and improved firing mechanism."
	icon_state = "boltactionsharp"
	item_state = "boltactionsharp"
	empty_icon = "boltactionsharp-e"
	accuracy = -2.5

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter/verb/scope_detach(mob/user)
		qdel(src)
		new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty (get_turf(src))
		playsound(loc, 'sound/items/Screwdriver.ogg', 70, 1)
		visible_message("[user] quickly detaches a scope from the [src] and adjusts it's firing mechanism.")

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2)

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()

// adeptus mech galv rifle. no scope yet.

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/sharpshooter/galvrifle
	name = "Galvonic Rifle"
	desc = "A rifle from the Skitarii legions of the Adeptus Mechanicus. It may look primitive, compared to energy weapons and the like, but the bullets have certainly kept up with modern technological breakthroughs. Uses .338"
	icon_state = "galvrifle"
	item_state = "galvrifle"
	empty_icon = "galvrifle-e"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	caliber = ".338"
	screen_shake = 0.4
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/lp338
	accuracy = -2.0
	one_hand_penalty = 20 // big rifle
	fire_delay = 12



/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338
	name = "Mark IV .338 Stub Rifle"
	desc = "Powerful sniper rifle, chambered in .338 for long-range assasinations."
	icon_state = "needler"
	item_state = "needler"
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	caliber = ".338"
	screen_shake = 1.2 //extra kickback
	max_shells = 10
	ammo_type = /obj/item/ammo_casing/lp338
	one_hand_penalty = 50
	accuracy = -2.3
	gun_type = GUN_SNIPER
	far_fire_sound = "sniper_fire"
	gping = FALSE

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2.5)

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/lp338/needler
	name = "Mark IVb Needler Sniper Rifle"
	desc = "Powerful needler rifle, chambered in .338 and issued to the Adeptus Astartes for long-range assasinations."
	fire_sound = 'sound/weapons/guns/fire/needler_fire.ogg'
	far_fire_sound = "needler_fire"

/obj/item/ammo_magazine/lp338
	name = "magazine (.338 Lapua Magnum)"
	icon_state = "needler"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".338"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/lp338
	max_ammo = 10
	multiple_sprites = 0

/obj/item/ammo_magazine/lp338/jhp
	name = "magazine (.338 Lapua Magnum JHP)"
	ammo_type = /obj/item/ammo_casing/lp338/jhp

/obj/item/ammo_magazine/lp338/jhp/empty
	ammo_type = /obj/item/ammo_casing/lp338/jhp
	initial_ammo = 0

/obj/item/ammo_magazine/lp338/empty
	initial_ammo = 0

/obj/item/ammo_magazine/lp338/needler
	name = "magazine (.338 Needler Rifle)"
	desc = "Toxin-coated needles, when you need to deal with some extradimensional baddies to not ruin the reality. Or to just kill an enemy leader with style."
	ammo_type = /obj/item/ammo_casing/lp338/needler
	max_ammo = 5

/obj/item/ammo_magazine/lp338/needler/empty
	ammo_type = /obj/item/ammo_casing/lp338/needler
	initial_ammo = 0



/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered
	name = "\improper Triangong 4-46"
	desc = "The stub rifle is a common sight across the galaxy, a hunting rifle firing large-bore rounds. This one is made of quality materials and has been laboured over extensively by expert hands."
	move_delay = 2.5
	one_hand_penalty = 3
	accuracy = -2
	fire_delay = 4

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2.5)

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/tinkered/equipped(mob/user)
	..()
	if(user.zoomed)
		user.do_zoom()

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/bayonet
	name = "\improper Stub Rifle"
	desc = "The stub rifle is a common sight across the galaxy, a hunting rifle firing large-bore rounds. This one has a bayonet attached."
	force = 20
	sharp = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/bayonet/New()
	..()
	add_bayonet()
	desc += " This one has a bayonet."

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/leverchester
	name = "\improper Snapper Pattern Stub Rifle"
	desc = "The lever action version of the Stub Rifle. Has all the same benefits and issues."
	icon_state = "leverchester"
	item_state = "leverchester"
	wielded_item_state = "leverchester-wielded"
	fire_sound = 'sound/weapons/guns/fire/la_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/la_insert.ogg'
	pumpsound = 'sound/weapons/guns/interact/la_cock.ogg'
	backsound = 'sound/weapons/guns/interact/la_back.ogg'
	forwardsound = 'sound/weapons/guns/interact/la_forward.ogg'
	empty_icon = "leverchester-e"
	fire_delay = 4
	move_delay = 2.5
	gping = FALSE

//Paryying.

/obj/item/gun/projectile/shotgun/pump/boltaction/handle_shield(mob/living/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_sword_parry(user, damage, damage_source, attacker, def_zone, attack_text))
		return 1
	return 0

//AMMO

/obj/item/ammo_casing/brifle
	desc = "An old worn out looking bullet casing."
	caliber = "763"
	projectile_type = /obj/item/projectile/bullet/rifle/a762/brifle
	icon_state = "brifle"
	spent_icon = "brifle-casing"
	ammo_stack = /obj/item/ammo_magazine/handful/brifle_handful/two

/obj/item/projectile/bullet/rifle/a762/brifle
	fire_sound = "brifle"
	penetrating = FALSE
	damage = 50

/obj/item/projectile/bullet/rifle/kroot
	fire_sound = "brifle"
	penetrating = TRUE // fuck that shit penetrative rounds
	damage = 65
	armor_penetration = 30


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
/obj/item/ammo_casing/krootbullet
	name = "kroot slug"
	desc = "An old worn out looking bullet casing."
	caliber = "640"
	projectile_type = /obj/item/projectile/bullet/rifle/kroot
	icon_state = "kroot"
	spent_icon = "krootcasing"
	ammo_stack = /obj/item/ammo_magazine/handful/kroot_handful/two

//Shitty shotgun

/obj/item/gun/projectile/shotgun/pump/shitty
	name = "\improper Voxlegis"
	desc = "A common shotgun used for hunting and law enforcement. It's cheap and reliable nature is the very model of imperial culture."
	icon_state = "voxlegisnew"
	item_state = "voxlegisnew"
	wielded_item_state = "winchester-wielded"
	str_requirement = 8
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	empty_icon = "voxlegisnew-e"
	move_delay = 3
	one_hand_penalty = 4
	accuracy = -1.5
	fire_delay= 3

	ammo_type = list(
		/obj/item/ammo_casing/shotgun/pellet,
		/obj/item/ammo_casing/shotgun/beanbag)

/obj/item/gun/projectile/shotgun/pump/shitty/magrave
	name = "\improper WTX Belle Magrave"
	desc = "A rare specialty Magrave shotgun long out of production - this retired veteran has been well maintained over the years by it's previous owners."
	move_delay= 2.5
	one_hand_penalty = 3.5
	accuracy = -1
	fire_delay = 2

/obj/item/gun/projectile/shotgun/pump/shitty/sawn
	name = "\improper Sawn Off WTX Frontier Special"
	desc = "A sawn off version of a common shotgun used in the trenches. It's not the best made and is prone to jamming."
	icon_state = "sawnchester"
	item_state = "sawnchester"
	wielded_item_state = "sawnchester-wielded"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_NORMAL
	max_shells = 4
	empty_icon = "sawnchester-e"
	one_hand_penalty = 1
	fire_delay = 2
	accuracy = -2
	armor_penetration = 0

/obj/item/gun/projectile/shotgun/pump/shitty/sawn/smallshotty
	name = "\improper WTX Reckoning"
	desc = "Small looking shotgun that fires a powerful shot."
	icon_state = "smallshotty"
	item_state = "smallshotty"
	wielded_item_state = "smallshotty-wielded"
	empty_icon = "smallshotty-e"
	one_hand_penalty = 2.5
	armor_penetration = 2

/obj/item/gun/projectile/shotgun/pump/shitty/bayonet
	force = 20
	sharp = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"

/obj/item/gun/projectile/shotgun/pump/shitty/bayonet/New()
	..()
	add_bayonet()
	desc += " This one has a bayonet."


/obj/item/gun/projectile/automatic/m22/warmonger
	name = "Mk.3 Warmonger"
	desc = "A semi automatic battle rifle. Fires faster, and more reliably than most of the shitty bolt action rifles the grunts get."
	icon_state = "autorifle"
	item_state = "autorifle"
	wielded_item_state = "autorifle-wielded"
	fire_sound = 'sound/weapons/gunshot/gunshot_arifle.ogg'
	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -0.5
	fire_delay = 3.5

	magazine_type = /obj/item/ammo_magazine/c45rifle/akarabiner
	allowed_magazines = /obj/item/ammo_magazine/c45rifle/akarabiner
	fire_delay = 0
	firemodes = list()
	w_class = ITEM_SIZE_HUGE
	gun_type = GUN_SEMIAUTO

/obj/item/gun/projectile/automatic/m22/warmonger/fully_auto
	name = "Mk.5 Warmonger"
	desc = "A fully automatic stubber. Fires faster, and more reliably than the old shitty bolt-action stubbers from agriworlds."
	icon_state = "autorifle"
	item_state = "autorifle"
	wielded_item_state = "autorifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/ak_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/ak_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ak_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/ak_cock.ogg'

	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"

	gun_type = GUN_AUTOMATIC

/obj/item/gun/projectile/automatic/m22/warmonger/fully_auto/nemesis
	name = "Mk.1 Nemesis"
	desc = "God, it's fucking ugly, but it does at least kill. Takes Warmonger magazines."
	icon_state = "bar"
	item_state = "bar"
	wielded_item_state = "bar-wielded"
	fire_sound = 'sound/weapons/guns/fire/bar_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/bar_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/bar_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/bar_cock.ogg'

	loaded_icon = "bar"
	unwielded_loaded_icon = "bar"
	wielded_loaded_icon = "bar-wielded"
	unloaded_icon = "bar-e"
	unwielded_unloaded_icon = "bar-e"
	wielded_unloaded_icon = "bar-wielded-e"
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -1.5
	fire_delay = 2.5

/obj/item/gun/projectile/automatic/m22/warmonger/m14
	name = "M41 Eclipse"
	desc = "A semi-automatic stubber. It's made out of the leftover scraps, mostly for agriworld purposes. Fires a powerful round, but only one at a time."
	icon_state = "semirifle"
	item_state = "semirifle"
	wielded_item_state = "semirifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/m14_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/fal_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/fal_magin.ogg'
	caliber = "a762"
	loaded_icon = "semirifle"
	unwielded_loaded_icon = "semirifle"
	wielded_loaded_icon = "semirifle-wielded"
	unloaded_icon = "semirifle-e"
	unwielded_unloaded_icon = "semirifle-e"
	wielded_unloaded_icon = "battlerifle-wielded-e"

	magazine_type = /obj/item/ammo_magazine/a762/m14
	allowed_magazines = /obj/item/ammo_magazine/a762/m14

/obj/item/ammo_magazine/a762/m14
	name = "M41 magazine"
	desc = "Found either in your stubber, in your satchel, or on the ground empty."
	max_ammo = 20
	icon_state = "autorifle"

/obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle
	name = "Mk.1 Armageddon"
	desc = "A very powerful semi-automatic stubber. Much nicer than whatever scrap those medics are using."
	icon_state = "battlerifle"
	item_state = "battlerifle"
	wielded_item_state = "battlerifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/arm_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/arm_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/arm_cock.ogg'
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -0.5
	fire_delay = 3.5

	magazine_type = /obj/item/ammo_magazine/a762/m14/battlerifle_mag
	allowed_magazines = list(/obj/item/ammo_magazine/a762/m14/battlerifle_mag, /obj/item/ammo_magazine/c45rifle/akarabiner)

	loaded_icon = "battlerifle"
	unwielded_loaded_icon = "battlerifle"
	wielded_loaded_icon = "battlerifle-wielded"
	unloaded_icon = "battlerifle-e"
	unwielded_unloaded_icon = "battlerifle-e"
	wielded_unloaded_icon = "battlerifle-wielded-e"

/obj/item/ammo_magazine/a762/m14/battlerifle_mag
	name = "Armageddon Pattern magazine"

/obj/item/gun/projectile/automatic/m22/warmonger/m14/battlerifle/rsc
	name = "Mk.1 Armageddon Pattern Stubber"
	icon_state = "rsc"
	item_state = "rsc"
	wielded_item_state = "rsc-wielded"

	magazine_type = /obj/item/ammo_magazine/a762/rsc
	allowed_magazines = /obj/item/ammo_magazine/a762/rsc

	caliber = "763"

	loaded_icon = "rsc"
	unwielded_loaded_icon = "rsc"
	wielded_loaded_icon = "rsc-wielded"
	unloaded_icon = "rsc-e"
	unwielded_unloaded_icon = "rsc-e"
	wielded_unloaded_icon = "rsc-wielded-e"

/obj/item/ammo_magazine/a762/rsc
	icon_state = "rsc"
	name = "Armageddon Pattern clip"
	max_ammo = 5
	caliber = "763"
	ammo_type = /obj/item/ammo_casing/brifle

/obj/item/gun/projectile/automatic/m22/combatrifle
	name = "Mk. 2 Nightfall"
	desc = "An advanced stubber of unknown pattern, this one has different fire modes and relative accuracy!"
	icon_state = "combatrifle"
	item_state ="combatrifle"
	magazine_type = /obj/item/ammo_magazine/c45rifle/combatrifle
	allowed_magazines = /obj/item/ammo_magazine/c45rifle/combatrifle
	one_hand_penalty = 5
	wielded_item_state = "combatrifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/combatrifle_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/combatrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/combatrifle_magin.ogg'
	cock_sound = 'sound/weapons/guns/interact/combatrifle_cock.ogg'
	move_delay= 2
	one_hand_penalty = 3
	accuracy = -0.5
	fire_delay = 3.5

	loaded_icon = "combatrifle"
	unwielded_loaded_icon = "combatrifle"
	wielded_loaded_icon = "combatrifle-wielded"
	unloaded_icon = "combatrifle-e"
	unwielded_unloaded_icon = "combatrifle-e"
	wielded_unloaded_icon = "combatrifle-wielded-e"

	gun_type = GUN_AUTOMATIC

	w_class = ITEM_SIZE_HUGE

	//Assault rifle, burst fire degrades quicker than SMG, worse one-handing penalty, slightly increased move delay
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=2.5,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",   	 burst=1, fire_delay=3.5,  move_delay=0, one_hand_penalty=6, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.1), automatic = 2)
		)

/obj/item/gun/projectile/automatic/mg08
	name = "LMG Harbinger"
	desc = "Named for the death it brings."
	//icon = 'icons/obj/gunx35.dmi'
	icon_state = "hmg"
	item_state = "hmg"
	str_requirement = 18
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 50
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/a556
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/a556/mg08
	allowed_magazines = /obj/item/ammo_magazine/box/a556/mg08
	one_hand_penalty = 50
	wielded_item_state = "hmg-wielded"
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "hmg"
	unwielded_loaded_icon = "hmg"
	wielded_loaded_icon = "hmg-wielded"
	unloaded_icon = "hmg-e"
	unwielded_unloaded_icon = "hmg-e"
	wielded_unloaded_icon = "hmg-wielded-e"
	fire_delay=2.2
	burst=1
	move_delay=5
	one_hand_penalty=7
	automatic = 2
	firemodes = list()
	gun_type = GUN_LMG

/obj/item/gun/projectile/automatic/gpmg
	name = "GPMG Requiem"
	desc = "A coveted LMG. Lighter than the Harbingers of the old war, but still just as deadly!"
	icon_state = "lmg"
	item_state = "lmg"
	wielded_item_state = "lmg-wielded"
	loaded_icon = "lmg"
	unwielded_loaded_icon = "lmg"
	wielded_loaded_icon = "lmg-wielded"
	unloaded_icon = "lmg-e"
	unwielded_unloaded_icon = "lmg-e"
	wielded_unloaded_icon = "lmg-wielded-e"
	str_requirement = 16
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 50
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/a556
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/a556/mg08
	allowed_magazines = /obj/item/ammo_magazine/box/a556/mg08
	one_hand_penalty = 7
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	fire_delay=2.2
	burst=1
	can_jam = FALSE
	one_hand_penalty=7
	burst_accuracy=list(0,-1,-1)
	dispersion=list(0.0, 0.1, 0.1)
	automatic = 2
	firemodes = list()
	gun_type = GUN_LMG
	move_delay = 5

/obj/item/gun/projectile/automatic/machinepistol
	name = "Mk.22 Autogun"
	desc = "A mass-produced autogun local to the frontier, often used by pirates and revolutionaries."
	icon_state = "machinepistol"
	item_state = "machinepistol"
	wielded_item_state = "machinepistol-wielded"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	move_delay = 2.2
	one_hand_penalty = 4
	accuracy = -4
	fire_delay = 1.7
	automatic = 0.9

	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'

	magazine_type = /obj/item/ammo_magazine/mc9mmt/machinepistol
	allowed_magazines = /obj/item/ammo_magazine/mc9mmt/machinepistol

	loaded_icon = "machinepistol"
	unwielded_loaded_icon = "machinepistol"
	wielded_loaded_icon = "machinepistol-wielded"
	unloaded_icon = "machinepistol-e"
	unwielded_unloaded_icon = "machinepistol-e"
	wielded_unloaded_icon = "machinepistol-e"

	gun_type = GUN_SMG

/obj/item/gun/projectile/automatic/machinepistol/a80
	name = "Nachtwey A80 Autogun"
	desc = "A specialty autogun made by frontier gunsmiths - an improved version of the Mk.22 Autogun with a more stable firing platform."
	icon_state = "autorifle"
	item_state = "autorifle"
	move_delay = 2
	one_hand_penalty = 3
	accuracy = -3.5
	fire_delay = 1.6
	automatic = 0.9

	wielded_item_state = "autorifle-wielded"
	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"

/obj/item/gun/projectile/automatic/autogrim
	name = "Grim Pattern Autogun"
	desc = "A rugged autogun of Valhallan design, it has a moderate rate of fire and excellent stopping power."
	icon_state = "autorifle"
	item_state = "autorifle"
	caliber = "a556"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	unloaded_icon = "auto_grim-e"
	loaded_icon = "auto_grim"
	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'
	move_delay = 2.5
	one_hand_penalty = 4
	accuracy = -3
	fire_delay = 1.5
	automatic = 0.8

	magazine_type = /obj/item/ammo_magazine/mc9mmt/machinepistol
	allowed_magazines = /obj/item/ammo_magazine/mc9mmt/machinepistol

	gun_type = GUN_SMG

	wielded_item_state = "autorifle-wielded"
	loaded_icon = "autorifle"
	unwielded_loaded_icon = "autorifle"
	wielded_loaded_icon = "autorifle-wielded"
	unloaded_icon = "autorifle-e"
	unwielded_unloaded_icon = "autorifle-e"
	wielded_unloaded_icon = "autorifle-wielded-e"

/obj/item/gun/projectile/automatic/machinepistol/wooden
	name = "Mk.23 Soulburn Pattern Autogun"
	desc = "A mass-produced autogun local to the frontier, often used by pirates and revolutionaries."
	icon_state = "schmeiser"
	item_state = "schmeiser"
	wielded_item_state = "schmeiser-wielded"

	loaded_icon = "schmeiser"
	unwielded_loaded_icon = "schmeiser"
	wielded_loaded_icon = "schmeiser-wielded"
	unloaded_icon = "schmeiser-e"
	unwielded_unloaded_icon = "schmeiser-e"
	wielded_unloaded_icon = "schmeiser-e"

/obj/item/gun/projectile/automatic/flamer
	name = "Mk.1 Scorcher"
	desc = "An incredibly dangerous hand-held flamethrower used often in infiltration or siege operations."
	icon_state = "flamer"
	item_state = "flamer"
	wielded_item_state = "flamer-wielded"
	caliber = "flamer"
	one_hand_penalty = 0
	str_requirement = 10
	fire_sound = 'sound/effects/fire01.ogg'
	casingsound = null//No eject sound for you.
	firemodes = list()
	accuracy = 0
	automatic = 1
	fire_delay = 8
	move_delay = 5
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

	gun_type = GUN_LMG //anyone can use this... just not anyone should.

/obj/item/gun/projectile/automatic/autoshotty
	name = "Astartes Shotgun"
	desc = "A shotgun made for the Adeptus Astartes."
	icon_state = "autoshotty"
	item_state = "autoshotty"
	wielded_item_state = "autoshotty"
	magazine_type = /obj/item/ammo_magazine/autoshotty
	allowed_magazines = /obj/item/ammo_magazine/autoshotty
	caliber = "shotgun"
	fire_sound = 'sound/weapons/guns/fire/autoshotty_fire.ogg'
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	reload_sound = 'sound/weapons/guns/interact/autoshotty_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/autoshotty_magout.ogg'
	cock_sound = 'sound/weapons/guns/interact/autoshotty_cock.ogg'
	slot_flags = SLOT_BACK|SLOT_S_STORE
	loaded_icon = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	burst=1
	fire_delay = 3.1
	one_hand_penalty=5
	move_delay= 2
	accuracy = -1
	dispersion=list(0.0, 0.8, 1.5)
	automatic = 2.4
	firemodes = list()

	gun_type = GUN_SHOTGUN

/obj/item/ammo_magazine/autoshotty
	name = "Astartes Shotgun"
	desc = "Just looking at it makes you bloodthirsty."
	icon_state = "autoshotty"
	caliber = "shotgun"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	max_ammo = 6
	multiple_sprites = 1
	force = 8

/obj/item/gun/projectile/warfare
	name = "Villiers Pistol"
	icon_state = "handgun"
	item_state = "handgun"
	fire_sound = "gunshot"//Pistol sounds.
	desc = "A mass-produced slug pistol common in the frontier."
	magazine_type = /obj/item/ammo_magazine/c45m/warfare
	allowed_magazines = /obj/item/ammo_magazine/c45m/warfare
	caliber = ".45"
	load_method = MAGAZINE
	move_delay = 1.5
	one_hand_penalty = 1
	accuracy = -3
	fire_delay = 1.7
	force = 8

/obj/item/gun/projectile/warfare/update_icon()//We gotta snowflake this a bit.
	..()
	if(ammo_magazine)
		if(ammo_magazine.stored_ammo.len)
			icon_state = "[initial(icon_state)][ammo_magazine.stored_ammo.len]"
		else
			icon_state = "[initial(icon_state)]0"
	else
		icon_state = "handgun-e"

/obj/item/gun/projectile/warfare/kieji
	name = "Kieji Pistol"
	icon_state = "handgun"
	item_state = "handgun" // Need to get icons for pistols later.
	desc = "A rare slug pistol of excellent quality and design."
	move_delay = 1.5
	one_hand_penalty = 0.7
	accuracy = -2
	fire_delay = 1.2

/obj/item/ammo_magazine/c45m/warfare
	name = "Reckoning magazine (.45)"
	icon_state = "handgunmag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

// Stubber //

/obj/item/gun/projectile/automatic/stubber
	name = "Vraks Pattern Heavy Stubber"
	desc = "Belt-fed and with a bipod for stable firing from the prone position, the weapon was fitted with both backsight and foresight, carrying handle, and perforated outer barrel to aid in cooling."
	icon_state = "hmg"
	item_state = "hmg"
	str_requirement = 16
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
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
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
	automatic = 0.8
	firemodes = list()
	gun_type = GUN_LMG
	move_delay= 5
	one_hand_penalty = 8 //it is a HMG, but its also not a bolter, this is probably enough penalty
	accuracy = -3
	fire_delay = 1.6




// adeptus mechanicus adamantium LMG
//icon = 'icons/obj/weapons/gun/projectile.dmi'

/obj/item/gun/projectile/automatic/stubber/cognis
	name = "Cognis Pattern Heavy Stubber"
	desc = "A heavy stubber forged by the worlds of the Omnissiah's will. Particular in maintenance and appearance, it is the proud work of any tech priest. Uses standard stubber ammo"
	icon_state = "cognisLMG"
	item_state = "cognisLMG"
	str_requirement = 10 //change as SOON as skitarii stats are buffed and working!!!
	loaded_icon = "cognisLMG"
	unwielded_loaded_icon = "cognisLMG"
	wielded_loaded_icon = "hmg-wielded"
	unloaded_icon = "cognisLMG"
	unwielded_unloaded_icon = "cognisLMG-e"
	wielded_unloaded_icon = "hmg-wielded-e"
	automatic = 1.2
	burst = 3
	fire_delay = 3.4
	one_hand_penalty = 14 //by the omnissiah you MUST hold the machine spirit properly


/obj/item/gun/projectile/automatic/stubber/villiers
	name = "Villiers Heavy Stubber"
	desc = "A rugged belt-fed stubber that is long out of service. This one seems to have been diligently maintained over the years."
	move_delay= 4.5
	one_hand_penalty = 7
	accuracy = -2
	fire_delay = 1.8
	automatic = 0.8
	armor_penetration = 5 //this is melee

// Boltgun
/obj/item/gun/projectile/bolter //boltus
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
	allowed_magazines = list(/obj/item/ammo_magazine/bolt_rifle_magazine, /obj/item/ammo_magazine/bolt_rifle_magazine/ms, /obj/item/ammo_magazine/bolt_rifle_magazine/ms)
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "ultrabolter-30"
	unloaded_icon = "ultrabolter-e"
	wielded_item_state = "autoshotty" // Do not remove this. We do not have any sprites for Bolters on-mob beyond this, it is perfect.
	loaded_icon = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	fire_delay = 2
	burst = 1
	move_delay = 3
	one_hand_penalty = 10
	automatic = 1
	firemodes = list()
	gun_type = GUN_AUTOMATIC
	accuracy = -2

/obj/item/gun/projectile/bolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ultrabolter-30"
	else
		icon_state = "ultrabolter-e"

/obj/item/gun/projectile/bolter/raven
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XIXth Chapter Raven Guards's colour scheme."
	icon_state = "ravenbolter"
	loaded_icon = "ravenbolter-30"
	unloaded_icon = "ravenbolter-e"

/obj/item/gun/projectile/bolter/ravenbolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ravenbolter-30"
	else
		icon_state = "ravenbolter-e"

/obj/item/gun/projectile/bolter/sally
	name = "Godwyn Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in XVIIIth Chapter Salamanders's colour scheme."
	icon_state = "sallybolter"
	loaded_icon = "sallybolter-30"
	unloaded_icon = "sallybolter-e"

/obj/item/gun/projectile/bolter/sally/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sallybolter-30"
	else
		icon_state = "sallybolter-e"

/obj/item/gun/projectile/bolter/bang
	name = "Baal Mark Vb Pattern Bolter"
	desc = "The Adeptus Astartes's legendary and destructive Bolter Rifle, This one is painted in IXth Chapter Blood Angels's colour scheme."
	icon_state = "bangbolter"
	loaded_icon = "bangbolter-30"
	unloaded_icon = "bangbolter-e"

/obj/item/gun/projectile/bolter/bang/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "bangbolter-30"
	else
		icon_state = "bangbolter-e"

/obj/item/gun/projectile/lockebolter //needs lots of work and love, ok standin for now
	name = "Locke Pattern bolter"
	desc = "The Locke Pattern Bolter, designed for Adeptus Arbites personnel when heavier firepower are required. Can also be found in hands of Astra Militarum officers, veterans and Commissar, Though relatively uncommon. It is a human-sized Bolter, Thus it's very popular among the troops and the lucky ones who get their hands on one of these bad boy."
	icon_state = "lockebolter"
	str_requirement = 10
	w_class = ITEM_SIZE_HUGE
	force = 15
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 30
	caliber = ".75"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/bolter
	load_method = MAGAZINE
	one_hand_penalty = 10 //its a bolter not a toy gun
	magazine_type = /obj/item/ammo_magazine/bolt_rifle_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_rifle_magazine
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "lockebolter-30"
	unloaded_icon = "lockebolter-e"
	wielded_item_state = "autoshotty"
	loaded_icon = "autoshotty"
	unwielded_loaded_icon = "autoshotty"
	wielded_loaded_icon = "autoshotty-wielded"
	unloaded_icon = "autoshotty-e"
	unwielded_unloaded_icon = "autoshotty-e"
	wielded_unloaded_icon = "autoshotty-wielded-e"
	fire_delay = 2.2
	burst = 1
	move_delay = 3
	automatic = 1
	firemodes = list()
	gun_type = GUN_AUTOMATIC
	accuracy = -3.7

/obj/item/gun/projectile/lockebolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "lockebolter-30"
	else
		icon_state = "lockebolter-e"

/obj/item/gun/projectile/lockebolter/infernobolter
	name = "Inferno Bolter"
	desc = "Corrupted by the warp, this bolter once was owned by a Heretic Astartes. The chaos infused into it made it capable of being fired by a human. But it's capabilities have suffered. Just as planned."
	icon_state = "1kbolter"
	loaded_icon = "1kbolter-30"
	unloaded_icon = "1kbolter-e"
/obj/item/gun/projectile/lockebolter/infernobolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "1kbolter-30"
	else
		icon_state = "1kbolter-e"

/obj/item/gun/projectile/sisterbolter
	name = "Godwyn-De'az Pattern Bolter Rifle"
	desc = "A modified bolter rifle, developed specifically for the Adepta Sororitas. This rifle is almost more scripture than weapon, and is clearly wielded by a devout woman. A large Sarissa is attached to the end of it, useful for carving the Emperor's Mercy from the flesh of those who defy him. <i>She was an angel, pure as righteous destruction. She laid low the twisted and lifted the hearts of the righteous. At her passing, a million voices cried out her name. Shall we ever again see her like? No, not now, nor ever again...</i>"
	force = 20 //what even is this description?
	sharp = 1
	edge = 1
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"
	str_requirement = 14
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	max_shells = 30
	caliber = ".75"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	ammo_type = /obj/item/ammo_casing/bolter
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_rifle_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_rifle_magazine
	one_hand_penalty = 10 //its still a bolter bro...
	fire_sound = 'sound/weapons/gunshot/harbinger.ogg'
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
	fire_delay = 1.8
	burst = 1
	move_delay = 3
	automatic = 1
	firemodes = list()
	accuracy = -1.5 //only one gun per round so yeah
	gun_type = GUN_AUTOMATIC

/obj/item/gun/projectile/sisterbolter/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sisterbolter-30"
	else
		icon_state = "sisterbolter-30-e"

//various kroot rifles, bolt action and lever

/obj/item/gun/projectile/shotgun/pump/boltaction/krootrifle
	name = "\improper Kroot Rifle"
	desc = "A Kroot-issue rifle. Quite exotic looking. Fires a malformed slug sure to tear through the enemy. The end of the rifle is decorated with blades sharpened to tear flesh."
	icon_state = "krootrifle"
	item_state = "krootrifle"
	wielded_item_state = "krootrifle-wielded"
	fire_sound = "brifle"
	caliber = "640" //its basically a musket ball
	ammo_type = /obj/item/ammo_casing/krootbullet
	one_hand_penalty = 7
	empty_icon = "krootrifle"
	far_fire_sound = "sniper_fire"
	fire_delay = 6
	move_delay= 2.5
	one_hand_penalty = 6
	accuracy = -2
	force = 20

/obj/item/gun/projectile/shotgun/pump/boltaction/krootrifle/bayonet
	name = "\improper Kroot Rifle"
	force = 30
	sharp = 1
	ammo_type = /obj/item/ammo_casing/krootbullet
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/krootrifle
	name = "\improper Kroot Rifle"
	desc = "A Kroot-issue rifle. Quite exotic looking. Fires a malformed slug sure to tear through the enemy. The end of the rifle is decorated with blades sharpened to tear flesh."
	icon_state = "krootrifle"
	item_state = "krootrifle"
	wielded_item_state = "krootrifle-wielded"
	fire_sound = 'sound/weapons/guns/fire/la_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/la_insert.ogg'
	pumpsound = 'sound/weapons/guns/interact/la_cock.ogg'
	backsound = 'sound/weapons/guns/interact/la_back.ogg'
	forwardsound = 'sound/weapons/guns/interact/la_forward.ogg'
	empty_icon = "krootrifle"
	far_fire_sound = "sniper_fire"
	ammo_type = /obj/item/ammo_casing/krootbullet
	fire_delay = 5
	move_delay= 2.5
	one_hand_penalty = 7
	accuracy = -2
	force = 20
	gping = FALSE

/obj/item/gun/projectile/shotgun/pump/boltaction/shitty/krootrifle/bayonet
	name = "improper Kroot Rifle"
	force = 30
	sharp = 1
	force_wielded = 40
	force_unwielded = 25
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"
	ammo_type = /obj/item/ammo_casing/krootbullet

//ORKA

/obj/item/gun/projectile/ork/automatic/shoota
	name = "shoota"
	desc = "A kinectic, automatic ballistic weapon with low efficiency but does a lot of noise and damage when luck is on your side."
	icon_state = "shoota"
	item_state = "shoota"
	w_class = ITEM_SIZE_LARGE
	force = 30
	max_shells = 30
	caliber = ".75"
	can_jam = TRUE
	move_delay = 5
	one_hand_penalty = 5
	accuracy = -9
	ammo_type = /obj/item/ammo_casing/ork/shoota
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/ork/shoota
	allowed_magazines = list(/obj/item/ammo_magazine/ork/shoota)
	gun_type = GUN_AUTOMATIC
	fire_delay = 2
	automatic = 0.75
	firemodes = list()

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
	fire_delay = 0.5
	burst = 1
	move_delay = 0
	automatic = 1
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0.5, one_hand_penalty=1, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",   	 burst=10, fire_delay=1.5, one_hand_penalty=2, burst_accuracy=list(0,1,1), dispersion=list(0.0, 0.1, 0.2), automatic = 2)
		)
	gun_type = GUN_AUTOMATIC
	accuracy = -1

/obj/item/gun/projectile/eldar/scatapult/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "scatapult"
	else
		icon_state = "scatapult-e"
