#define DEFAULT_DROP_TIME 5 SECONDS

/datum/noble_entry
	var/name // Name is displayed to user when spawning it, and using UI. Override.
	var/cost = 0
	var/item_path // What spawns when you purchase
	var/special = FALSE // Unique behaviour. Such as altering the map, but not spawning any specific item.
	var/category

/datum/noble_entry/proc/purchase(var/obj/machinery/computer/planetarytrade/terminal)

	if(terminal.busy) //stops spam buying
		terminal.visible_message("<b>[terminal]</b> flashes an <span style='color:red'>error</span>, \"Busy.\"")
		return FALSE

	if(!terminal.drop_pads)
		terminal.visible_message("<b>[terminal]</b> flashes an <span style='color:red'>error</span>, \"Drop pads not found.\"")
		return FALSE

	if(terminal.balance < (cost + round(cost * GLOB.tax_rate, 1)))
		terminal.visible_message("<b>[terminal]</b> flashes a <span style='color:red'>warning</span>, \"Your balance is too low..\"")
		return FALSE

	terminal.visible_message("<b>[terminal]</b> flashes a <span style='color:blue'>notice</span>, \"Your order has been confirmed. ETA: [DEFAULT_DROP_TIME / 10] Seconds.\"")
	terminal.balance -= (cost + round(cost * GLOB.tax_rate,1)) //this goes here so it subtracts payment before the sleep, u cannot out spam me boy
	GLOB.thrones += round(cost * GLOB.tax_rate, 1)
	terminal.busy = TRUE
	playsound(terminal, 'sound/effects/beam.ogg', 50, 0, -1)
	addtimer(CALLBACK(src, .proc/drop_purchase, terminal), DEFAULT_DROP_TIME)
	return TRUE

/datum/noble_entry/proc/drop_purchase(var/obj/machinery/computer/planetarytrade/terminal)
	var/obj/effect/landmark/cargospawn2/T = pick(terminal.drop_pads) //where dey spawning
	var/atom/dropping
	if(!special)
		dropping = new item_path(T.loc) //what they spawning
		dropping.visible_message("[dropping] falls onto the drop pad.")
		on_purchase(terminal, dropping)
	else
		special_purchase(terminal)
	terminal.busy = FALSE

/datum/noble_entry/proc/on_purchase(var/obj/machinery/computer/planetarytrade/terminal, var/product) // Override for things that need to be done post-spawn. Like adding ammo.
	return

/datum/noble_entry/proc/special_purchase(var/obj/machinery/computer/planetarytrade/terminal) // Ovveride for special items
	return

#undef DEFAULT_DROP_TIME