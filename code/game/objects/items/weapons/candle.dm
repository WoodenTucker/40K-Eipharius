/obj/item/flame/candle
	name = "red candle"
	desc = "A small pillar candle. Its specially-formulated fuel-oxidizer wax mixture allows continued combustion in airless environments."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle1"
	item_state = "candle1"
	w_class = ITEM_SIZE_TINY
	light_color = "#e09d37"
	var/wax = 6000

/obj/item/flame/candle/New()
	wax = rand(6000, 7000) // Enough for 27-33 minutes. 30 minutes on average.
	..()

/obj/item/flame/candle/update_icon()
	var/i
	if(wax > 1500)
		i = 1
	else if(wax > 800)
		i = 2
	else i = 3
	icon_state = "candle[i][lit ? "_lit" : ""]"


/obj/item/flame/candle/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if(isWelder(W))
		var/obj/item/weldingtool/WT = W
		if(WT.isOn()) //Badasses dont get blinded by lighting their candle with a welding tool
			light("<span class='notice'>\The [user] casually lights the [name] with [W].</span>")
	else if(istype(W, /obj/item/flame/lighter))
		var/obj/item/flame/lighter/L = W
		if(L.lit)
			light()
	else if(istype(W, /obj/item/flame/match))
		var/obj/item/flame/match/M = W
		if(M.lit)
			light()
	else if(istype(W, /obj/item/flame/candle))
		var/obj/item/flame/candle/C = W
		if(C.lit)
			light()
	else if(istype(W, /obj/item/torch))
		var/obj/item/torch/C = W
		if(C.lit)
			light()


/obj/item/flame/candle/proc/light(var/flavor_text = "<span class='notice'>\The [usr] lights the [name].</span>")
	if(!src.lit)
		src.lit = 1
		//src.damtype = "fire"
		for(var/mob/O in viewers(usr, null))
			O.show_message(flavor_text, 1)
		set_light(CANDLE_LUM)
		START_PROCESSING(SSobj, src)


/obj/item/flame/candle/Process()
	if(!lit)
		return
	wax--
	if(!wax)
		new/obj/item/trash/candle(src.loc)
		qdel(src)
	update_icon()
	if(istype(loc, /turf)) //start a fire if possible
		var/turf/T = loc
		T.hotspot_expose(700, 5)

/obj/item/flame/candle/attack_self(mob/user as mob)
	if(lit)
		lit = 0
		update_icon()
		set_light(0)

/obj/item/flame/candle/dinner
	name = "dinner candle"
	desc = "A long dinner candle, perfect for setting the mood of an evening meal."
	icon = 'icons/obj/candle.dmi'
	icon_state = "dinner_candle"
	item_state = "dinner_candle"
	w_class = ITEM_SIZE_TINY
	light_color = "#e09d37"
	wax = 6000

/obj/item/flame/candle/small
	name = "small candle"
	desc = "An small candle, it wont last too much."
	icon = 'icons/obj/candle.dmi'
	icon_state = "tiny_candle"
	item_state = "tiny_candle"
	w_class = ITEM_SIZE_TINY
	light_color = "#e09d37"
	wax = 6000

/obj/item/flame/candle/church
	name = "church candle"
	desc = "A church candle, mostly used on religious acts and common in shrines and the like."
	icon = 'icons/obj/candle.dmi'
	icon_state = "church_candle"
	item_state = "church_candle"
	w_class = ITEM_SIZE_TINY
	light_color = "#e09d37"
	wax = 6000