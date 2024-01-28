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
	name = "mark of khorne"
	icon = 'icons/obj/decals.dmi'
	icon_state = "angry"
	desc = "A horrifying rune drawn in blood."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	var/list/existing_dirs = list()
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR

/obj/effect/cleanable/heretic_rune/slaanesh
	name = "mark of slaanesh"
	icon = 'icons/obj/decals.dmi'
	icon_state = "lewd"
	desc = "A horrifying rune drawn in spice."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR

/obj/effect/cleanable/heretic_rune/tzeentch
	name = "mark of tzeentch"
	icon = 'icons/obj/decals.dmi'
	icon_state = "smart"
	desc = "A horrifying rune drawn in ash."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR

/obj/effect/cleanable/heretic_rune/nurgle
	name = "mark of nurgle"
	icon = 'icons/obj/decals.dmi'
	icon_state = "nasty"
	desc = "A horrifying rune drawn in filth."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	blood_DNA = list()
	appearance_flags = NO_CLIENT_COLOR

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
