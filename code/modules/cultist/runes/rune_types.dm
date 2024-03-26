/datum/rune_recipe/khorne
	diety = GOD_KHORNE
	sound = 'sound/effects/quotes/cults/khorne/khorne.ogg'

/datum/rune_recipe/nurgle
	diety = "nurgle"
	sound = 'sound/effects/fornurgle.ogg'

/datum/rune_recipe/tzeentch
	diety = "tzeentch"

/datum/rune_recipe/slaanesh
	diety = "slaanesh"

/obj/effect/cleanable/heretic_rune/khorne
	name = "strange marking"
	icon = 'icons/map_project/eldritch/Zizo_Rite.dmi'
	icon_state = "1"
	desc = "..."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	var/list/existing_dirs = list()
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR
	pixel_x = -32
	pixel_y = -32

/obj/effect/cleanable/heretic_rune/khorne/New()
	..()
	icon_state = pick("1", "2", "3")

/obj/effect/cleanable/heretic_rune/slaanesh
	name = "strange marking"
	icon = 'icons/map_project/eldritch/Zizo_Rite.dmi'
	icon_state = "7"
	desc = "..."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR
	pixel_x = -32
	pixel_y = -32

/obj/effect/cleanable/heretic_rune/slaanesh/New()
	..()
	icon_state = pick("7", "8", "9")

/obj/effect/cleanable/heretic_rune/tzeentch
	name = "strange marking"
	icon = 'icons/map_project/eldritch/Zizo_Rite.dmi'
	icon_state = "18"
	desc = "..."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR
	pixel_x = -32
	pixel_y = -32

/obj/effect/cleanable/heretic_rune/tzeentch/New()
	..()
	icon_state = pick("14", "15", "16", "17", "18")

/obj/effect/cleanable/heretic_rune/nurgle
	name = "strange marking"
	icon = 'icons/map_project/eldritch/Zizo_Rite.dmi'
	icon_state = "5"
	desc = "..."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR
	pixel_x = -32
	pixel_y = -32

/obj/effect/cleanable/heretic_rune/nurgle/New()
	..()
	icon_state = pick("5", "6", "10")

/obj/effect/cleanable/heretic_rune/hivemind
	name = "Biomass clump"
	icon = 'icons/obj/decals.dmi'
	icon_state = "arthit"
	desc = "A strange lump of biomass."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR
