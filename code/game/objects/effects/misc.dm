//The effect when you wrap a dead body in gift wrap
/obj/effect/spresent
	name = "strange present"
	desc = "It's a ... present?"
	icon = 'icons/obj/items.dmi'
	icon_state = "strangepresent"
	density = 1
	anchored = 0

/obj/effect/stop
	var/victim = null
	icon_state = "empty"
	name = "Geas"
	desc = "You can't resist."


/obj/effect/effect/cig_smoke
	name = "smoke"
	icon_state = "smallsmoke"
	icon = 'icons/effects/effects.dmi'
	opacity = FALSE
	anchored = TRUE
	mouse_opacity = FALSE
	plane = HUMAN_PLANE
	layer = ABOVE_HUMAN_LAYER

	var/time_to_live = 3 SECONDS

/obj/effect/effect/cig_smoke/Initialize()
	. = ..()
	set_dir(pick(GLOB.cardinal))
	pixel_x = rand(0, 13)
	pixel_y = rand(0, 13)
	animate(src, alpha = 0, time_to_live, easing = EASE_IN)
	QDEL_IN(src, time_to_live)

/*/obj/effect/timestop
	anchored = TRUE
	name = "chronofield"
	desc = "Stopped Time"
	icon = 'icons/effects/160x160.dmi'
	icon_state = "emfield_s5"
	layer = ABOVE_HUMAN_LAYER
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	pixel_x = -64
	pixel_y = -64
	var/list/immune = list() // the one who creates the timestop is immune, which includes wizards and the dead slime you murdered to make this chronofield
	var/turf/target
	var/freezerange = 2
	var/duration = 140
	alpha = 125
	/// hides time icon effect and mutes sound
	var/hidden = FALSE

/obj/effect/timestop/Initialize(mapload, radius, time, list/immune_atoms, start = TRUE, silent = FALSE) //Immune atoms assoc list atom = TRUE
	. = ..()
	if(!isnull(time))
		duration = time
	if(!isnull(radius))
		freezerange = radius
	if(silent)
		hidden = TRUE
		alpha = 0
	for(var/A in immune_atoms)
		immune[A] = TRUE
	for(var/mob/living/to_check in GLOB.player_list)
		if(src.has_trait(/datum/trait/death_tolerant)
			immune[to_check] = TRUE
	for(var/mob/living/basic/guardian/stand in GLOB.parasites)
		if(stand.summoner && HAS_TRAIT(stand.summoner, TRAIT_TIME_STOP_IMMUNE)) //It would only make sense that a person's stand would also be immune.
			immune[stand] = TRUE
	if(start)
		INVOKE_ASYNC(src, PROC_REF(timestop))*/
