/obj/item/gun/launcher/rcl_rifle
        name = "Vraks pattern rocket launcher"
        desc = "A rocket launcher of Vraks pattern, being supplied to Krieg for combat against armoured targets."
        icon_state = "rcl_rifle-e"
        item_state = "rcl_rifle"
        w_class = ITEM_SIZE_LARGE
        throw_speed = 2
        throw_range = 10
        force = 5.0
        obj_flags =  OBJ_FLAG_CONDUCTIBLE
        slot_flags = SLOT_BELT|SLOT_S_STORE //you couldnt place it anywhere before. don't remove, krieger sgt uses it and its the only way to give it to them
        origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1, TECH_ILLEGAL = 1)
        fire_sound = 'sound/weapons/gunshot/tank.ogg'
        combustion = 1
        release_force = 12.5
        throw_distance = 30
        var/max_shells = 1
        var/list/shells = new/list()

/obj/item/gun/launcher/rcl_rifle/update_icon()
	..()
	if(shells.len == max_shells)
		icon_state = "rcl_rifle"
	else
		icon_state = "rcl_rifle-e"

/obj/item/gun/launcher/rcl_rifle/examine(mob/user)
        if(!..(user, 2))
                return
        to_chat(user, "<span class='notice'>[shells.len] / [max_shells] shells.</span>")

/obj/item/gun/launcher/rcl_rifle/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/heat_shell))
		if(shells.len < max_shells)
			user.drop_item()
			I.loc = src
			playsound(src.loc, 'sound/effects/cannon_load.ogg', 100, 1)
			shells += I
			to_chat(user, "<span class='notice'>You put the shell in [src].</span>")
			to_chat(user, "<span class='notice'>[shells.len] / [max_shells] shells.</span>")
		else
			to_chat(usr, "<span class='warning'>\The [src] cannot hold more shells.</span>")
		update_icon()

/obj/item/gun/launcher/rcl_rifle/consume_next_projectile()
        if(shells.len)
                var/obj/item/ammo_casing/heat_shell/I = shells[1]
                var/obj/item/recoilless_shell/M = new (src)
                M.primed = 1
                shells -= I
                return M
        return null


//a lot of shitcode. i fix it someday
/obj/item/gun/launcher/rcl_rifle/handle_post_fire(mob/user, atom/target)
        log_and_message_admins("fired a shell from a recoilless rifle ([src.name]) at [target].")
        ..()


/obj/item/gun/launcher/rcl_rifle/ork
        name = "Rokkit Launcha"
        desc = "De rockity bit iz to be pointed at da umies. Charge in wid ya choppa when ya shoot it, innit."
        icon_state = "rokkit_launcha"
        item_state = "rcl_rifle"

/obj/item/gun/launcher/rcl_rifle/ork/New()
	..()
	shells += 1
	return

/obj/item/gun/launcher/rcl_rifle/ork/update_icon()
	..()
	if(shells.len == max_shells)
		icon_state = "rokkit_launcha"
	else
		icon_state = "rokkit_launcha-e"

/obj/item/gun/launcher/rcl_rifle/ork/examine(mob/user)
        if(!..(user, 2))
                return
        to_chat(user, "<span class='notice'>[shells.len] / [max_shells] shells.</span>")

/obj/item/gun/launcher/rcl_rifle/ork/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/heat_shell/orkhe))
		if(shells.len < max_shells)
			user.drop_item()
			I.loc = src
			playsound(src.loc, 'sound/effects/cannon_load.ogg', 100, 1)
			shells += I
			to_chat(user, "<span class='notice'>You put the shell in [src].</span>")
			to_chat(user, "<span class='notice'>[shells.len] / [max_shells] shells.</span>")
		else
			to_chat(usr, "<span class='warning'>\The [src] cannot hold more shells.</span>")
		update_icon()

/obj/item/gun/launcher/rcl_rifle/ork/consume_next_projectile()
        if(shells.len)
                var/obj/item/ammo_casing/heat_shell/orkhe/I = shells[1]
                var/obj/item/recoilless_shell/orkhe/M = new (src)
                M.primed = 1
                shells -= I
                return M
        return null


//a lot of shitcode. i fix it someday
/obj/item/gun/launcher/rcl_rifle/ork/handle_post_fire(mob/user, atom/target)
        log_and_message_admins("fired a shell from a recoilless rifle ([src.name]) at [target].")
        ..()