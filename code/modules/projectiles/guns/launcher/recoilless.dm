/obj/item/gun/launcher/rcl_rifle
        name = "rocket launcher"
        desc = "Auf wiedersein, krigga."
        icon_state = "rocket"
        item_state = "rocket"
        w_class = ITEM_SIZE_LARGE
        throw_speed = 2
        throw_range = 10
        force = 5.0
        obj_flags =  OBJ_FLAG_CONDUCTIBLE
        slot_flags = 0
        origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
        fire_sound = 'sound/weapons/gunshot/tank.ogg'
        fire_volume = 100
        combustion = 1


        release_force = 12.5
        throw_distance = 30
        var/max_shells = 1
        var/list/shells = new/list()


/obj/item/gun/launcher/rcl_rifle/examine(mob/user)
        if(!..(user, 2))
                return
        to_chat(user, "<span class='notice'>[rockets.len] / [max_rockets] shells.</span>")


/obj/item/gun/launcher/rcl_rifle/attackby(obj/item/I as obj, mob/user as mob)
        if(istype(I, /obj/item/ammo_casing/heat_shell))
                if(shells.len < max_shells)
                        user.drop_item()
                        I.loc = src
                        rockets += I
                        to_chat(user, "<span class='notice'>You put the shell in [src].</span>")
                        to_chat(user, "<span class='notice'>[shells.len] / [max_rockets] shells.</span>")
                else
                        to_chat(usr, "<span class='warning'>\The [src] cannot hold more shells.</span>")


/obj/item/gun/launcher/rcl_rifle/consume_next_projectile()
        if(rockets.len)
                var/obj/item/ammo_casing/heat_shell/I = shells[1]
                var/obj/item/heat_shell/M = new (src)
                M.primed = 1
                shells -= I
                return M
        return null


/obj/item/gun/launcher/rcl_rifle/handle_post_fire(mob/user, atom/target)
        log_and_message_admins("fired a shell from a recoilless rifle ([src.name]) at [target].")
        ..()