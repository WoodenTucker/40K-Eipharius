/* Food */

/datum/reagent/nutriment
	name = "Nutriment"
	description = "All the vitamins, minerals, and carbohydrates the body needs in pure form."
	taste_mult = 4
	reagent_state = REAGENT_SOLID
	metabolism = REM * 4
	var/nutriment_factor = 10 // Per unit
	var/injectable = 0
	color = "#664330"

/datum/reagent/nutriment/mix_data(var/list/newdata, var/newamount)

	if(!islist(newdata) || !newdata.len)
		return

	//add the new taste data
	for(var/taste in newdata)
		if(taste in data)
			data[taste] += newdata[taste]
		else
			data[taste] = newdata[taste]

	//cull all tastes below 10% of total
	var/totalFlavor = 0
	for(var/taste in data)
		totalFlavor += data[taste]
	if(!totalFlavor)
		return
	for(var/taste in data)
		if(data[taste]/totalFlavor < 0.1)
			data -= taste

/datum/reagent/nutriment/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(!injectable)
		M.adjustToxLoss(0.2 * removed)
		return
	affect_ingest(M, alien, removed)

/datum/reagent/nutriment/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	M.heal_organ_damage(0.5 * removed, 0) //what

	adjust_nutrition(M, alien, removed)
	M.add_chemical_effect(CE_BLOODRESTORE, 4 * removed)

/datum/reagent/nutriment/proc/adjust_nutrition(var/mob/living/carbon/M, var/alien, var/removed)
	switch(alien)
		if(IS_UNATHI) removed *= 0.1 // Unathi get most of their nutrition from meat.
	M.nutrition += nutriment_factor * removed // For hunger and fatness
	M.bowels += nutriment_factor * removed	//For pooping

/datum/reagent/nutriment/glucose
	name = "Glucose"
	color = "#ffffff"

	injectable = 1

/datum/reagent/nutriment/protein // Bad for Skrell!
	name = "animal protein"
	taste_description = "some sort of protein"
	color = "#440000"

/datum/reagent/nutriment/protein/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	switch(alien)
		if(IS_SKRELL)
			M.adjustToxLoss(0.5 * removed)
			return
	..()

/datum/reagent/nutriment/protein/adjust_nutrition(var/mob/living/carbon/M, var/alien, var/removed)
	switch(alien)
		if(IS_UNATHI) removed *= 2.25
	M.nutrition += nutriment_factor * removed // For hunger and fatness

/datum/reagent/nutriment/protein/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien && alien == IS_SKRELL)
		M.adjustToxLoss(2 * removed)
		return
	..()

/datum/reagent/nutriment/protein/egg // Also bad for skrell.
	name = "egg yolk"
	taste_description = "egg"
	color = "#ffffaa"

/datum/reagent/nutriment/honey
	name = "Honey"
	description = "A golden yellow syrup, loaded with sugary sweetness."
	taste_description = "sweetness"
	nutriment_factor = 10
	color = "#ffff00"

/datum/reagent/honey/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()

	if(alien == IS_UNATHI)
		if(M.chem_doses[type] < 2)
			if(M.chem_doses[type] == metabolism * 2 || prob(5))
				M.emote("yawn")
		else if(M.chem_doses[type] < 5)
			M.eye_blurry = max(M.eye_blurry, 10)
		else if(M.chem_doses[type] < 20)
			if(prob(50))
				M.Weaken(2)
			M.drowsyness = max(M.drowsyness, 20)
		else
			M.sleeping = max(M.sleeping, 20)
			M.drowsyness = max(M.drowsyness, 60)

/datum/reagent/nutriment/flour
	name = "flour"
	description = "This is what you rub all over yourself to pretend to be a ghost."
	taste_description = "chalky wheat"
	reagent_state = REAGENT_SOLID
	nutriment_factor = 1
	color = "#ffffff"

/datum/reagent/nutriment/flour/touch_turf(var/turf/simulated/T)
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/flour(T)
		if(T.wet > 1)
			T.wet = min(T.wet, 1)
		else
			T.wet = 0

/datum/reagent/nutriment/coco
	name = "Coco Powder"
	description = "A fatty, bitter paste made from coco beans."
	taste_description = "bitterness"
	taste_mult = 1.3
	reagent_state = REAGENT_SOLID
	nutriment_factor = 5
	color = "#302000"

/datum/reagent/nutriment/soysauce
	name = "Soysauce"
	description = "A salty sauce made from the soy plant."
	taste_description = "umami"
	taste_mult = 1.1
	reagent_state = REAGENT_LIQUID
	nutriment_factor = 2
	color = "#792300"

/datum/reagent/nutriment/ketchup
	name = "Ketchup"
	description = "Ketchup, catsup, whatever. It's tomato paste."
	taste_description = "ketchup"
	reagent_state = REAGENT_LIQUID
	nutriment_factor = 5
	color = "#731008"

/datum/reagent/nutriment/barbecue
	name = "Barbecue Sauce"
	description = "Barbecue sauce for barbecues and long shifts."
	taste_description = "barbecue"
	reagent_state = REAGENT_LIQUID
	nutriment_factor = 5
	color = "#4f330f"

/datum/reagent/nutriment/garlicsauce
	name = "Garlic Sauce"
	description = "Garlic sauce, perfect for spicing up a plate of garlic."
	taste_description = "garlic"
	reagent_state = REAGENT_LIQUID
	nutriment_factor = 4
	color = "#d8c045"

/datum/reagent/nutriment/rice
	name = "Rice"
	description = "Enjoy the great taste of nothing."
	taste_description = "rice"
	taste_mult = 0.4
	reagent_state = REAGENT_SOLID
	nutriment_factor = 1
	color = "#ffffff"

/datum/reagent/nutriment/cherryjelly
	name = "Cherry Jelly"
	description = "Totally the best. Only to be spread on foods with excellent lateral symmetry."
	taste_description = "cherry"
	taste_mult = 1.3
	reagent_state = REAGENT_LIQUID
	nutriment_factor = 1
	color = "#801e28"

/datum/reagent/nutriment/cornoil
	name = "Corn Oil"
	description = "An oil derived from various types of corn."
	taste_description = "slime"
	taste_mult = 0.1
	reagent_state = REAGENT_LIQUID
	nutriment_factor = 20
	color = "#302000"

/datum/reagent/nutriment/cornoil/touch_turf(var/turf/simulated/T)
	if(!istype(T))
		return

	var/hotspot = (locate(/obj/fire) in T)
	if(hotspot && !istype(T, /turf/space))
		var/datum/gas_mixture/lowertemp = T.remove_air(T:air:total_moles)
		lowertemp.temperature = max(min(lowertemp.temperature-2000, lowertemp.temperature / 2), 0)
		lowertemp.react()
		T.assume_air(lowertemp)
		qdel(hotspot)

	if(volume >= 3)
		T.wet_floor()

/datum/reagent/nutriment/virus_food
	name = "Virus Food"
	description = "A mixture of water, milk, and oxygen. Virus cells can use this mixture to reproduce."
	taste_description = "vomit"
	taste_mult = 2
	reagent_state = REAGENT_LIQUID
	nutriment_factor = 2
	color = "#899613"

/datum/reagent/nutriment/sprinkles
	name = "Sprinkles"
	description = "Multi-colored little bits of sugar, commonly found on donuts. Loved by cops."
	taste_description = "childhood whimsy"
	nutriment_factor = 1
	color = "#ff00ff"

/datum/reagent/nutriment/mint
	name = "Mint"
	description = "Also known as Mentha."
	taste_description = "mint"
	reagent_state = REAGENT_LIQUID
	color = "#cf3600"

/datum/reagent/lipozine // The anti-nutriment.
	name = "Lipozine"
	description = "A chemical compound that causes a powerful fat-burning reaction."
	taste_description = "mothballs"
	reagent_state = REAGENT_LIQUID
	color = "#bbeda4"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/lipozine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.nutrition = max(M.nutrition - 10 * removed, 0)

/* Non-food stuff like condiments */

/datum/reagent/sodiumchloride
	name = "Table Salt"
	description = "A salt made of sodium chloride. Commonly used to season food."
	taste_description = "salt"
	reagent_state = REAGENT_SOLID
	color = "#ffffff"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/blackpepper
	name = "Black Pepper"
	description = "A powder ground from peppercorns. *AAAACHOOO*"
	taste_description = "pepper"
	reagent_state = REAGENT_SOLID
	color = "#000000"

/datum/reagent/enzyme
	name = "Universal Enzyme"
	description = "A universal enzyme used in the preperation of certain chemicals and foods."
	taste_description = "sweetness"
	taste_mult = 0.7
	reagent_state = REAGENT_LIQUID
	color = "#365e30"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/frostoil
	name = "Frost Oil"
	description = "A special oil that noticably chills the body. Extracted from Ice Peppers."
	taste_description = "mint"
	taste_mult = 1.5
	reagent_state = REAGENT_LIQUID
	color = "#b31008"

/datum/reagent/frostoil/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.bodytemperature = max(M.bodytemperature - 10 * TEMPERATURE_DAMAGE_COEFFICIENT, 0)
	if(prob(1))
		M.emote("shiver")
	holder.remove_reagent(/datum/reagent/capsaicin, 5)

/datum/reagent/capsaicin
	name = "Capsaicin Oil"
	description = "This is what makes chilis hot."
	taste_description = "hot peppers"
	taste_mult = 1.5
	reagent_state = REAGENT_LIQUID
	color = "#b31008"
	var/agony_dose = 5
	var/agony_amount = 2
	var/discomfort_message = "<span class='danger'>Your insides feel uncomfortably hot!</span>"

/datum/reagent/capsaicin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.adjustToxLoss(0.5 * removed)

/datum/reagent/capsaicin/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.can_feel_pain())
			return
	if(M.chem_doses[type] < agony_dose)
		if(prob(5) || M.chem_doses[type] == metabolism) //dose == metabolism is a very hacky way of forcing the message the first time this procs
			to_chat(M, discomfort_message)
	else
		M.apply_effect(agony_amount, PAIN, 0)
		if(prob(5))
			M.custom_emote(2, "[pick("dry heaves!","coughs!","splutters!")]")
			to_chat(M, "<span class='danger'>You feel like your insides are burning!</span>")
	holder.remove_reagent(/datum/reagent/frostoil, 5)

/datum/reagent/capsaicin/condensed
	name = "Condensed Capsaicin"
	description = "A chemical agent used for self-defense and in police work."
	taste_description = "scorching agony"
	taste_mult = 10
	reagent_state = REAGENT_LIQUID
	touch_met = 50 // Get rid of it quickly
	color = "#b31008"
	agony_dose = 0.5
	agony_amount = 4
	discomfort_message = "<span class='danger'>You feel like your insides are burning!</span>"

/datum/reagent/capsaicin/condensed/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	var/eyes_covered = 0
	var/mouth_covered = 0
	var/no_pain = 0
	var/obj/item/eye_protection = null
	var/obj/item/face_protection = null

	var/effective_strength = 5

	if(alien == IS_SKRELL)	//Larger eyes means bigger targets.
		effective_strength = 8

	var/list/protection
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		protection = list(H.head, H.glasses, H.wear_mask)
		if(!H.can_feel_pain())
			no_pain = 1 //TODO: living-level can_feel_pain() proc
	else
		protection = list(M.wear_mask)

	for(var/obj/item/I in protection)
		if(I)
			if(I.body_parts_covered & EYES)
				eyes_covered = 1
				eye_protection = I.name
			if((I.body_parts_covered & FACE) && !(I.item_flags & ITEM_FLAG_FLEXIBLEMATERIAL))
				mouth_covered = 1
				face_protection = I.name

	var/message = null
	if(eyes_covered)
		if(!mouth_covered)
			message = "<span class='warning'>Your [eye_protection] protects your eyes from the pepperspray!</span>"
	else
		message = "<span class='warning'>The pepperspray gets in your eyes!</span>"
		if(mouth_covered)
			M.eye_blurry = max(M.eye_blurry, effective_strength * 3)
			M.eye_blind = max(M.eye_blind, effective_strength)
		else
			M.eye_blurry = max(M.eye_blurry, effective_strength * 5)
			M.eye_blind = max(M.eye_blind, effective_strength * 2)

	if(mouth_covered)
		if(!message)
			message = "<span class='warning'>Your [face_protection] protects you from the pepperspray!</span>"
	else if(!no_pain)
		message = "<span class='danger'>Your face and throat burn!</span>"
		if(prob(25))
			M.custom_emote(2, "[pick("coughs!","coughs hysterically!","splutters!")]")
		M.Weaken(5)
		M.Stun(6)

/datum/reagent/capsaicin/condensed/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.can_feel_pain())
			return
	if(M.chem_doses[type] == metabolism)
		to_chat(M, "<span class='danger'>You feel like your insides are burning!</span>")
	else
		M.apply_effect(4, PAIN, 0)
		if(prob(5))
			M.visible_message("<span class='warning'>[M] [pick("dry heaves!","coughs!","splutters!")]</span>", "<span class='danger'>You feel like your insides are burning!</span>")
	holder.remove_reagent(/datum/reagent/frostoil, 5)

/* Drinks */

/datum/reagent/drink
	name = "Drink"
	description = "Uh, some kind of drink."
	reagent_state = REAGENT_LIQUID
	color = "#e78108"
	var/nutrition = 0 // Per unit
	var/adj_dizzy = 0 // Per tick
	var/adj_drowsy = 0
	var/adj_sleepy = 0
	var/adj_temp = 0

/datum/reagent/drink/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.adjustToxLoss(removed) // Probably not a good idea; not very deadly though
	return

/datum/reagent/drink/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	M.nutrition += nutrition * removed
	M.dizziness = max(0, M.dizziness + adj_dizzy)
	M.drowsyness = max(0, M.drowsyness + adj_drowsy)
	M.sleeping = max(0, M.sleeping + adj_sleepy)
	if(adj_temp > 0 && M.bodytemperature < 310) // 310 is the normal bodytemp. 310.055
		M.bodytemperature = min(310, M.bodytemperature + (adj_temp * TEMPERATURE_DAMAGE_COEFFICIENT))
	if(adj_temp < 0 && M.bodytemperature > 310)
		M.bodytemperature = min(310, M.bodytemperature - (adj_temp * TEMPERATURE_DAMAGE_COEFFICIENT))

// Juices
/datum/reagent/drink/juice/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.immunity = min(M.immunity + 0.25, M.immunity_norm*1.5)
	var/effective_dose = M.chem_doses[type]/2
	if(alien == IS_UNATHI)
		if(effective_dose < 2)
			if(effective_dose == metabolism * 2 || prob(5))
				M.emote("yawn")
		else if(effective_dose < 5)
			M.eye_blurry = max(M.eye_blurry, 10)
		else if(effective_dose < 20)
			if(prob(50))
				M.Weaken(2)
			M.drowsyness = max(M.drowsyness, 20)
		else
			M.sleeping = max(M.sleeping, 20)
			M.drowsyness = max(M.drowsyness, 60)

/datum/reagent/drink/juice/banana
	name = "Banana Juice"
	description = "The raw essence of a banana."
	taste_description = "banana"
	color = "#c3af00"

	glass_name = "banana juice"
	glass_desc = "The raw essence of a banana. HONK!"

/datum/reagent/drink/juice/berry
	name = "Berry Juice"
	description = "A delicious blend of several different kinds of berries."
	taste_description = "berries"
	color = "#990066"

	glass_name = "berry juice"
	glass_desc = "Berry juice. Or maybe it's jam. Who cares?"

/datum/reagent/drink/juice/carrot
	name = "Carrot juice"
	description = "It is just like a carrot but without crunching."
	taste_description = "carrots"
	color = "#ff8c00" // rgb: 255, 140, 0

	glass_name = "carrot juice"
	glass_desc = "It is just like a carrot but without crunching."

/datum/reagent/drink/juice/carrot/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.reagents.add_reagent(/datum/reagent/imidazoline, removed * 0.2)

/datum/reagent/drink/juice/grape
	name = "Grape Juice"
	description = "It's grrrrrape!"
	taste_description = "grapes"
	color = "#863333"

	glass_name = "grape juice"
	glass_desc = "It's grrrrrape!"

/datum/reagent/drink/juice/lemon
	name = "Lemon Juice"
	description = "This juice is VERY sour."
	taste_description = "sourness"
	taste_mult = 1.1
	color = "#afaf00"

	glass_name = "lemon juice"
	glass_desc = "Sour..."

/datum/reagent/drink/juice/lime
	name = "Lime Juice"
	description = "The sweet-sour juice of limes."
	taste_description = "unbearable sourness"
	taste_mult = 1.1
	color = "#365e30"

	glass_name = "lime juice"
	glass_desc = "A glass of sweet-sour lime juice"

/datum/reagent/drink/juice/lime/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustToxLoss(-0.5 * removed)

/datum/reagent/drink/juice/orange
	name = "Orange juice"
	description = "Both delicious AND rich in Vitamin C, what more do you need?"
	taste_description = "oranges"
	color = "#e78108"

	glass_name = "orange juice"
	glass_desc = "Vitamins! Yay!"

/datum/reagent/drink/juice/orange/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustOxyLoss(-2 * removed)

/datum/reagent/toxin/poisonberryjuice // It has more in common with toxins than drinks... but it's a juice
	name = "Poison Berry Juice"
	description = "A tasty juice blended from various kinds of very deadly and toxic berries."
	taste_description = "berries"
	color = "#863353"
	strength = 5

	glass_name = "poison berry juice"
	glass_desc = "A glass of deadly juice."

/datum/reagent/toxin/poisonberryjuice/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_UNATHI)
		return //unathi are immune!
	else ()
	(M.adjustToxLoss(2.5 * removed))
	return ..()

/datum/reagent/drink/juice/potato
	name = "Potato Juice"
	description = "Juice of the potato. Bleh."
	taste_description = "irish sadness"
	nutrition = 2
	color = "#302000"

	glass_name = "potato juice"
	glass_desc = "Juice from a potato. Bleh."

/datum/reagent/drink/juice/garlic
	name = "Garlic Juice"
	description = "Who would even drink this?"
	taste_description = "bad breath"
	nutrition = 1
	color = "#eeddcc"

	glass_name = "garlic juice"
	glass_desc = "Who would even drink juice from garlic?"

/datum/reagent/drink/juice/onion
	name = "Onion Juice"
	description = "Juice from an onion, for when you need to cry."
	taste_description = "stinging tears"
	nutrition = 1
	color = "#ffeedd"

	glass_name = "onion juice"
	glass_desc = "Juice from an onion, for when you need to cry."

/datum/reagent/drink/juice/tomato
	name = "Tomato Juice"
	description = "Tomatoes made into juice. What a waste of big, juicy tomatoes, huh?"
	taste_description = "tomatoes"
	color = "#731008"

	glass_name = "tomato juice"
	glass_desc = "Are you sure this is tomato juice?"

/datum/reagent/drink/juice/tomato/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.heal_organ_damage(0, 0.5 * removed)

/datum/reagent/drink/juice/watermelon
	name = "Watermelon Juice"
	description = "Delicious juice made from watermelon."
	taste_description = "sweet watermelon"
	color = "#b83333"

	glass_name = "watermelon juice"
	glass_desc = "Delicious juice made from watermelon."

// Everything else

/datum/reagent/drink/milk
	name = "Milk"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	taste_description = "milk"
	color = "#dfdfdf"

	glass_name = "milk"
	glass_desc = "White and nutritious goodness!"

/datum/reagent/drink/milk/chocolate
	name =  "Chocolate Milk"
	description = "A mixture of perfectly healthy milk and delicious chocolate."
	taste_description = "chocolate milk"
	color = "#74533b"

	glass_name = "chocolate milk"
	glass_desc = "Deliciously fattening!" // Here, take your CHOCCY MILK. You deserved. - (c) Eula, Genshin Impact

/datum/reagent/drink/milk/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.heal_organ_damage(0.5 * removed, 0)
	holder.remove_reagent(/datum/reagent/capsaicin, 10 * removed)

/datum/reagent/drink/milk/cream
	name = "Cream"
	description = "The fatty, still liquid part of milk. Why don't you mix this with sum scotch, eh?"
	taste_description = "creamy milk"
	color = "#dfd7af"

	glass_name = "cream"
	glass_desc = "Ewwww..." // No idea why ewww, I drank the milk cream, it tastes quite good. - LeadOnTaste

/datum/reagent/drink/milk/soymilk
	name = "Soy Milk"
	description = "An opaque white liquid made from soybeans."
	taste_description = "soy milk"
	color = "#dfdfc7"

	glass_name = "soy milk"
	glass_desc = "White and nutritious soy goodness!"

/datum/reagent/drink/tea
	name = "Tanna"
	description = "A fairly robust and offensive tea enjoyed by the Valhallan Guard regiment."
	taste_description = "incredibly strong and bitter black-tea"
	color = "#101000"
	adj_dizzy = -2
	adj_drowsy = -1
	adj_sleepy = -3
	adj_temp = 20

	glass_name = "Tanna"
	glass_desc = "A fairly robust and offensive tea enjoyed by the Valhallan Guard regiment."
	glass_special = list(DRINK_VAPOR)

/datum/reagent/drink/tea/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustToxLoss(-0.5 * removed)

/datum/reagent/drink/tea/icetea
	name = "Iced Tea"
	description = "Standard Imperial 'tea' brewed from various plant and sugars!"
	taste_description = "sweet tea"
	color = "#104038" // rgb: 16, 64, 56
	adj_temp = -5

	glass_name = "iced tea"
	glass_desc = "Standard Imperial 'tea' brewed from various plant and sugars!"
	glass_special = list(DRINK_ICE)

/datum/reagent/drink/coffee
	name = "Recaf"
	description = "Effectively the lifeblood of any schola, guardsmen or human to ever have walked the materium."
	taste_description = "bitter shitty coffee"
	taste_mult = 1.3
	color = "#482000"
	adj_dizzy = -5
	adj_drowsy = -3
	adj_sleepy = -2
	adj_temp = 25
	overdose = 45

	glass_name = "Recaf"
	glass_desc = "Don't drop it, or you'll send scalding liquid over yourself faster than your local Munitorium Enforcer can shoot you for wastefulness!"
	glass_special = list(DRINK_VAPOR)

/datum/reagent/drink/coffee/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	..()
	if(alien == IS_TAJARA)
		M.adjustToxLoss(0.5 * removed)
		M.make_jittery(4) //extra sensitive to caffine
	if(adj_temp > 0)
		holder.remove_reagent(/datum/reagent/frostoil, 10 * removed)
	if(volume > 15)
		M.add_chemical_effect(CE_PULSE, 1)

/datum/reagent/nutriment/coffee/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_TAJARA)
		M.adjustToxLoss(2 * removed)
		M.make_jittery(4)
		return
	M.add_chemical_effect(CE_PULSE, 2)

/datum/reagent/drink/coffee/overdose(var/mob/living/carbon/M, var/alien)
	if(alien == IS_DIONA)
		return
	if(alien == IS_TAJARA)
		M.adjustToxLoss(4 * REM)
		M.apply_effect(3, STUTTER)
	M.make_jittery(5)
	M.add_chemical_effect(CE_PULSE, 2)

/datum/reagent/drink/coffee/icecoffee
	name = "Iced Recaf"
	description = "Recaf, now with ice!"
	taste_description = "bitter watery and freezing shitty recaf"
	color = "#102838"
	adj_temp = -5

	glass_name = "iced recaf"
	glass_desc = "Recaf, now with ice!"
	glass_special = list(DRINK_ICE)

/datum/reagent/drink/coffee/soy_latte
	name = "Soy Recaf Latte"
	description = "A nice and tasty beverage while you are reading your xeno books."
	taste_description = "creamy recaf"
	color = "#c65905"
	adj_temp = 5

	glass_name = "soy recaf latte"
	glass_desc = "A nice and refreshing beverage while you are reading."

/datum/reagent/drink/coffee/soy_latte/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.heal_organ_damage(0.5 * removed, 0)

/datum/reagent/drink/coffee/cafe_latte
	name = "Recaf Latte"
	description = "A nice, strong and tasty beverage while you are reading."
	taste_description = "bitter cream"
	color = "#c65905"
	adj_temp = 5

	glass_name = "recaf latte"
	glass_desc = "A nice, strong and refreshing beverage while you are reading."

/datum/reagent/drink/coffee/cafe_latte/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.heal_organ_damage(0.5 * removed, 0)

/datum/reagent/drink/hot_coco
	name = "Hot Chocolate"
	description = "Made with love! If love was promethium-hot chemicals."
	taste_description = "creamy shitty chocolate"
	reagent_state = REAGENT_LIQUID
	color = "#403010"
	nutrition = 2
	adj_temp = 5

	glass_name = "hot chocolate"
	glass_desc = "Warmer and warmer, your throat keeps yearning for it!" // Yes, Stringstorm's 40K Idols reference.
	glass_special = list(DRINK_VAPOR)

/datum/reagent/drink/sodawater
	name = "Soda Water"
	description = "A can of club soda. Why not make a scotch and soda?"
	taste_description = "carbonated water"
	color = "#619494"
	adj_dizzy = -5
	adj_drowsy = -3
	adj_temp = -5

	glass_name = "soda water"
	glass_desc = "Soda water. Why not make a scotch and soda?"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/grapesoda
	name = "Grape Soda"
	description = "Grapes made into a fine drank."
	taste_description = "grape soda"
	color = "#421c52"
	adj_drowsy = -3

	glass_name = "grape soda"
	glass_desc = "Looks like a delicious drink!"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/tonic
	name = "Tonic Water"
	description = "It tastes strange but at least the quinine keeps the Nurgle at bay."
	taste_description = "tart and fresh"
	color = "#619494"
	adj_dizzy = -5
	adj_drowsy = -3
	adj_sleepy = -2
	adj_temp = -5

	glass_name = "tonic water"
	glass_desc = "Quinine tastes funny, but at least it'll keep the Nurgle away."

/datum/reagent/drink/lemonade
	name = "Lemonade"
	description = "Oh the nostalgia..."
	taste_description = "tartness"
	color = "#ffff00"
	adj_temp = -5

	glass_name = "lemonade"
	glass_desc = "Oh the nostalgia..."
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/kiraspecial
	name = "Saints Special"
	description = "Praise be to the saints!"
	taste_description = "fruity sweetness"
	color = "#cccc99"
	adj_temp = -5

	glass_name = "Saints Special"
	glass_desc = "Praise be to the saints!"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/brownstar
	name = "Brown Star"
	description = "It's not what it sounds like..."
	taste_description = "orange and cola soda"
	color = "#9f3400"
	adj_temp = -2

	glass_name = "Brown Star"
	glass_desc = "It's not what it sounds like..."

/datum/reagent/drink/milkshake
	name = "Grox Milkshake"
	description = "Glorious brainfreezing mixture."
	taste_description = "creamy vanilla"
	color = "#aee5e4"
	adj_temp = -9

	glass_name = "milkshake"
	glass_desc = "Glorious brainfreezing mixture."

/datum/reagent/milkshake/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()

	var/effective_dose = M.chem_doses[type]/2
	if(alien == IS_UNATHI)
		if(effective_dose < 2)
			if(effective_dose == metabolism * 2 || prob(5))
				M.emote("yawn")
		else if(effective_dose < 5)
			M.eye_blurry = max(M.eye_blurry, 10)
		else if(effective_dose < 20)
			if(prob(50))
				M.Weaken(2)
			M.drowsyness = max(M.drowsyness, 20)
		else
			M.sleeping = max(M.sleeping, 20)
			M.drowsyness = max(M.drowsyness, 60)

/datum/reagent/drink/dangomilk
	name = "Dango Milk"
	description = "Tasty snack, made of milk and grain, rumoured to be favoured by T'au Empire and, especially, their Gue'vesa Auxiliaries."
	taste_description = "creamy and milky rice"
	color = "#aee5e4"
	adj_temp = -5

	glass_name = "dango milk"
	glass_desc = "Tasty snack, made of milk and grain, rumoured to be favoured by T'au Empire and, especially, their Gue'vesa Auxiliaries." // Yes, I really made it. Just as reference to GI and meme about T'au being weebs. - LeadOnTaste.

/datum/reagent/dangomilk/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()

	var/effective_dose = M.chem_doses[type]/2
	if(alien == IS_UNATHI)
		if(effective_dose < 2)
			if(effective_dose == metabolism * 2 || prob(5))
				M.emote("yawn")
		else if(effective_dose < 5)
			M.eye_blurry = max(M.eye_blurry, 10)
		else if(effective_dose < 20)
			if(prob(50))
				M.Weaken(2)
			M.drowsyness = max(M.drowsyness, 20)
		else
			M.sleeping = max(M.sleeping, 20)
			M.drowsyness = max(M.drowsyness, 60)

/datum/reagent/drink/rewriter
	name = "Rewriter"
	description = "The secret of the sanctuary of the Librarium..."
	taste_description = "a bad night out"
	color = "#485000"
	adj_temp = -5

	glass_name = "Rewriter"
	glass_desc = "The secret of the sanctuary of the Librarium..."

/datum/reagent/drink/rewriter/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.make_jittery(5)

/datum/reagent/drink/nuka_cola
	name = "Krieg Cola"
	description = "Cola, cola never changes."
	taste_description = "the past, trenches, and guilt"
	color = "#100800"
	adj_temp = -5
	adj_sleepy = -2

	glass_name = "Krieg-Cola"
	glass_desc = "Don't cry, Don't raise your eye, It's only nuclear wasteland"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/nuka_cola/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.add_chemical_effect(CE_SPEEDBOOST, 1)
	M.make_jittery(20)
	M.druggy = max(M.druggy, 30)
	M.dizziness += 5
	M.drowsyness = 0

/datum/reagent/drink/grenadine
	name = "Grenadine Syrup"
	description = "Made in the modern day with proper pomegranate substitute. Who uses real fruit, anyways?"
	taste_description = "100% pure pomegranate"
	color = "#ff004f"

	glass_name = "grenadine syrup"
	glass_desc = "Sweet and tangy, a bar syrup used to add color or flavor to drinks."

/datum/reagent/drink/space_cola
	name = "Imperial Cola"
	description = "About as refreshing as luke-warm piss. Very likely made FROM recycled piss!"
	taste_description = "slightly tangy water with fizz"
	reagent_state = REAGENT_LIQUID
	color = "#100800"
	adj_drowsy = -3
	adj_temp = -5

	glass_name = "Imperial Cola"
	glass_desc = "A glass of refreshing Imperial Cola! About as refreshing as luke-warm piss. Very likely made FROM recycled piss!"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/spacemountainwind
	name = "Imperial Ploin-Fizz"
	description = "Fizzy ploin juice. Rather sweet and tangy!"
	taste_description = "sweet ploin soda"
	color = "#102000"
	adj_drowsy = -7
	adj_sleepy = -1
	adj_temp = -5

	glass_name = "Imperial Ploin-Fizz"
	glass_desc = "Fizzy ploin juice. Rather sweet and tangy!"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/dr_gibb
	name = "Dr. Bile"
	description = "A delicious blend of 42 different flavours. Including Bloodthirster juice!"
	taste_description = "cherry and suffering"
	color = "#102000"
	adj_drowsy = -6
	adj_temp = -5

	glass_name = "Dr. Bile"
	glass_desc = "A delicious blend of 42 different flavours. Including Bloodthirster juice!"

/datum/reagent/drink/space_up
	name = "Warp-Up"
	description = "Sends your taste-buds to the warp! Because it tastes like HERESY!"
	taste_description = "slightly batshit flavour compounds"
	color = "#202800"
	adj_temp = -8

	glass_name = "Warp-up"
	glass_desc = "Sends your taste-buds to the warp! Because it tastes like HERESY!"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/lemon_lime
	name = "Lemon Lime"
	description = "A tangy substance made of 0.5% natural ancient fruits!"
	taste_description = "tangy lime and lemon soda"
	color = "#878f00"
	adj_temp = -8

	glass_name = "lemon lime soda"
	glass_desc = "A tangy substance made of 0.5% natural ancient fruits!"
	glass_special = list(DRINK_FIZZ)

/datum/reagent/drink/doctor_delight
	name = "The Medicae's Mercy"
	description = "A gulp a day keeps the Officio Medicae away. That's, probably, for the best."
	taste_description = "homely fruit"
	reagent_state = REAGENT_LIQUID
	color = "#ff8cff"
	nutrition = 1

	glass_name = "The Medicae's Mercy"
	glass_desc = "A healthy mixture of juices, guaranteed to keep you healthy until the next bayonet charge takes place."

/datum/reagent/drink/doctor_delight/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.adjustOxyLoss(-4 * removed)
	M.heal_organ_damage(2 * removed, 2 * removed)
	M.adjustToxLoss(-2 * removed)
	if(M.dizziness)
		M.dizziness = max(0, M.dizziness - 15)
	if(M.confused)
		M.confused = max(0, M.confused - 5)

/datum/reagent/drink/dry_ramen
	name = "Dry Ramen"
	description = "Space age food, since well before the Imperium! Contains dried noodles, \"vegetables\", and chemicals that boil in contact with water."
	taste_description = "dry and cheap noodles"
	reagent_state = REAGENT_SOLID
	nutrition = 1
	color = "#302000"

/datum/reagent/drink/hot_ramen
	name = "Hot Ramen"
	description = "The noodles are boiled, the flavors are artificial, just like being back in school."
	taste_description = "wet and cheap noodles"
	reagent_state = REAGENT_LIQUID
	color = "#302000"
	nutrition = 5
	adj_temp = 5

/datum/reagent/drink/hell_ramen
	name = "Hell Ramen"
	description = "The noodles are boiled, the flavors are artificial, just like being back in school."
	taste_description = "wet and cheap noodles on fire"
	reagent_state = REAGENT_LIQUID
	color = "#302000"
	nutrition = 5

/datum/reagent/drink/hell_ramen/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.bodytemperature += 10 * TEMPERATURE_DAMAGE_COEFFICIENT

/datum/reagent/drink/ice
	name = "Ice"
	description = "Frozen water, your dentist wouldn't like you chewing this."
	taste_description = "ice"
	taste_mult = 1.5
	reagent_state = REAGENT_SOLID
	color = "#619494"
	adj_temp = -5

	glass_name = "ice"
	glass_desc = "Generally, you're supposed to put something else in there too..."
	glass_icon = DRINK_ICON_NOISY

/datum/reagent/drink/nothing
	name = "Nothing"
	description = "Absolutely nothing."
	taste_description = "nothing"

	glass_name = "nothing"
	glass_desc = "Absolutely nothing."

/* Alcohol */

// Basic

/datum/reagent/ethanol/absinthe
	name = "Estufagemi Wine"
	description = "More expensive than you!"
	taste_description = "powerful licoricey wine"
	taste_mult = 1.5
	color = "#33ee00"
	strength = 12

	glass_name = "estufagemi wine"
	glass_desc = "This glass is worth more than you!"

/datum/reagent/ethanol/ale
	name = "Imperial Ale"
	description = "A dark alchoholic beverage made by malted barley and yeast."
	taste_description = "hearty and bitter grain ale"
	color = "#4c3100"
	strength = 50

	glass_name = "imperial bitter ale"
	glass_desc = "A wickedly dark pint of delicious bitter ale"

/datum/reagent/ethanol/beer
	name = "Imperial Beer"
	description = "Contains only recycled water, refined starchs and yeast."
	taste_description = "shitty piss-water beer"
	color = "#ffd300"
	strength = 50
	nutriment_factor = 1

	glass_name = "imperial beer"
	glass_desc = "A pale pint of beer"

/datum/reagent/ethanol/beer/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.jitteriness = max(M.jitteriness - 3, 0)

/datum/reagent/ethanol/bluecuracao
	name = "Blue Curacao"
	description = "Exotically blue, fruity drink, distilled from oranges."
	taste_description = "oranges"
	taste_mult = 1.1
	color = "#0000cd"
	strength = 15

	glass_name = "blue curacao"
	glass_desc = "Exotically blue, fruity drink, distilled from oranges."

/datum/reagent/ethanol/cognac
	name = "Gleece"
	description = "How very fancy..."
	taste_description = "Expensive sweet burning"
	taste_mult = 1.1
	color = "#ab3c05"
	strength = 15

	glass_name = "gleece"
	glass_desc = "Worth alot more than you are!"

/datum/reagent/ethanol/cognac/jovian
	name = "Jovian Silk Cognac"
	description = "Extremely expensive alcoholic beverage, ..."
	taste_description = "Expensive sweet burning"
	taste_mult = 1.2
	color = "#ab3c05"
	strength = 12.5

	glass_name = "silk cognac"
	glass_desc = "Worth alot more than you are!"

/datum/reagent/ethanol/deadrum
	name = "Deadfoize"
	description = "Popular with the sailors. Not very popular with everyone else."
	taste_description = "salty sea water"
	color = "#ecb633"
	strength = 50

	glass_name = "rum"
	glass_desc = "Yarrr... Time to rob some xeno merchants."

/datum/reagent/ethanol/deadrum/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.dizziness +=5

/datum/reagent/ethanol/gin
	name = "White Gyn"
	description = "White-Gyn! It's a shocker it got out this far.."
	taste_description = "an alcoholic Emperors-Day tree"
	color = "#0064c6"
	strength = 15

	glass_name = "gyn"
	glass_desc = "A crystal clear glass of White-Gyn!"

//Base type for alchoholic drinks containing coffee
/datum/reagent/ethanol/coffee
	overdose = 45

/datum/reagent/ethanol/coffee/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	..()
	M.dizziness = max(0, M.dizziness - 5)
	M.drowsyness = max(0, M.drowsyness - 3)
	M.sleeping = max(0, M.sleeping - 2)
	if(M.bodytemperature > 310)
		M.bodytemperature = max(310, M.bodytemperature - (5 * TEMPERATURE_DAMAGE_COEFFICIENT))
	if(alien == IS_TAJARA)
		M.adjustToxLoss(0.5 * removed)
		M.make_jittery(4) //extra sensitive to caffine

/datum/reagent/ethanol/coffee/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_TAJARA)
		M.adjustToxLoss(2 * removed)
		M.make_jittery(4)
		return
	..()

/datum/reagent/ethanol/coffee/overdose(var/mob/living/carbon/M, var/alien)
	if(alien == IS_DIONA)
		return
	if(alien == IS_TAJARA)
		M.adjustToxLoss(4 * REM)
		M.apply_effect(3, STUTTER)
	M.make_jittery(5)

/datum/reagent/ethanol/coffee/kahlua
	name = "Rotgut Recaf"
	description = "For fuck sakes.. Just drink your Recaf and LIKE IT!"
	taste_description = "spiked recaf"
	taste_mult = 1.1
	color = "#4c3100"
	strength = 15

	glass_name = "rotgut recaf"
	glass_desc = "You're pretty sure this is just grain-alcohol shoved into recaf."

/datum/reagent/ethanol/melonliquor
	name = "Melon Liquor"
	description = "A relatively sweet and fruity 46 proof liquor."
	taste_description = "fruity alcohol"
	color = "#138808" // rgb: 19, 136, 8
	strength = 50

	glass_name = "melon liquor"
	glass_desc = "A relatively sweet and fruity 46 proof liquor."

/datum/reagent/ethanol/rum
	name = "Old Foiz"
	description = "This is where the Rum has gone!"
	taste_description = "Buttery sugar"
	taste_mult = 1.1
	color = "#ecb633"
	strength = 15

	glass_name = "rum"
	glass_desc = "Sweet, sweet Foiz!"

/datum/reagent/ethanol/sake
	name = "Sake"
	description = "T'au favorite drink."
	taste_description = "dry alcohol"
	color = "#dddddd"
	strength = 25

	glass_name = "sake"
	glass_desc = "A glass of sake."

/datum/reagent/ethanol/tequilla
	name = "Petro-Rotgut"
	description = "Say goodnight to your liver."
	taste_description = "greasy shitty liquor"
	color = "#ffff91"
	strength = 25

	glass_name = "rotgut"
	glass_desc = "Somehow the scent is even worse than when it was in the bottle!"

/datum/reagent/ethanol/thirteenloko
	name = "Thirteen Loko"
	description = "A potent mixture of caffeine and alcohol."
	taste_description = "jitters and death"
	color = "#102000"
	strength = 25
	nutriment_factor = 1

	glass_name = "Thirteen Loko"
	glass_desc = "This is a glass of Thirteen Loko, it appears to be of the highest quality. The drink, not the glass."

/datum/reagent/ethanol/thirteenloko/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.drowsyness = max(0, M.drowsyness - 7)
	if (M.bodytemperature > 310)
		M.bodytemperature = max(310, M.bodytemperature - (5 * TEMPERATURE_DAMAGE_COEFFICIENT))
	M.make_jittery(5)
	M.add_chemical_effect(CE_PULSE, 2)

/datum/reagent/ethanol/vermouth
	name = "Vlod"
	description = "You suddenly feel a craving to freeze your ass off and be miserable.."
	taste_description = "dry alcohol"
	taste_mult = 1.3
	color = "#91ff91" // rgb: 145, 255, 145
	strength = 15

	glass_name = "vlod"
	glass_desc = "This is gonna be dry!"

/datum/reagent/ethanol/vodka
	name = "Rahzvod"
	description = "Kicks like a Grox and tastes like you licked the grease off your lasgun! Commonly dispensed as a ration to the Firstborn Regiment!"
	taste_description = "grain alcohol"
	color = "#0064c8" // rgb: 0, 100, 200
	strength = 15

	glass_name = "rahzvod"
	glass_desc = "Kicks like a Grox. You sure you'll be able to finish the glass, Soldier?"

/datum/reagent/ethanol/vodka/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.apply_effect(max(M.radiation - 1 * removed, 0), IRRADIATE, blocked = 0)

/datum/reagent/ethanol/vodka/premium
	name = "Zakat Premium"
	description = "Premium distilled rahzvod imported directly from the city of Zakat, industrial center of Vostroya."
	taste_description = "grain, victory and birch wood"
	color = "#aaddff" // rgb: 170, 221, 255 - very light blue.
	strength = 10

/datum/reagent/ethanol/whiskey
	name = "Agri-Whiskey"
	description = "Whiskey! Warming the hearts of any Imperial since before the Imperium!"
	taste_description = "molasses"
	color = "#4c3100"
	strength = 25

	glass_name = "agri-whiskey"
	glass_desc = "A fairly good-quality grain-based liquor fit for the imperial stout defenders!"

/datum/reagent/ethanol/wine
	name = "Wine"
	description = "An premium alchoholic beverage made from distilled grape juice."
	taste_description = "bitter sweetness"
	color = "#7e4043" // rgb: 126, 64, 67
	strength = 15

	glass_name = "wine"
	glass_desc = "A very classy looking drink."

/datum/reagent/ethanol/wine/premium
	name = "White Wine"
	description = "An exceptionally expensive alchoholic beverage made from distilled white grapes."
	taste_description = "white velvet"
	color = "#ffddaa" // rgb: 255, 221, 170 - a light cream
	strength = 20

/datum/reagent/ethanol/amasec/cheap
	name = "Cheap Amasec"
	description = "Affordable, golden, amasec. The beloved drink of the Imperium"
	strength = 25
	color = "#ff9100"
	taste_description = "the herbs and fruits of a far-off world."

/datum/reagent/ethanol/amasec/expensive
	name = "Aged Amasec"
	description = "Expensive, aged and meant for the nobility of the Imperium. This bottle of amasec tastes and smells like the embrace of the Emperor himself."
	strength = 30
	color = "#ff9100"
	taste_description = "the finest fruits and aged wood, carefully selected from numerous Imperial worlds."

/datum/reagent/ethanol/amasec/caddis/extra
	name = "Mourning Collection"
	description = "Expensive, aged and meant for the nobility of the Imperium. This bottle of wine tastes and smells indescribably good, produced from precious fruits and herbs of the paradise world of Caddis for the lowest class of it's citizens."
	strength = 30
	color = "#722f37"
	taste_description = "the perfect collection fruits and herbs, carefully gathered on Caddis with effort and respect, saturating the drink with unique hints of noble wines."

	glass_name = "caddisian wine"
	glass_desc = "A very classy looking drink."

/datum/reagent/ethanol/amasec/caddis/elite
	name = "Golden Tokay"
	description = "Expensive, aged and meant for the nobility of the Imperium. This bottle of wine tastes and smells indescribably good, produced from precious fruits and herbs of the paradise world of Caddis for the middle-class citizens."
	strength = 30
	color = "#722f37"
	taste_description = "the ultimate collection of fruits and herbs, carefully gathered on Caddis with proper effort and respect, saturating the drink with it's pleasant taste."

	glass_name = "caddisian wine"
	glass_desc = "A very classy looking drink."

/datum/reagent/ethanol/amasec/caddis/supreme
	name = "Catalina Malvasia"
	description = "Luxury, extremely aged and meant for the pinnacle of the Imperium. This bottle of wine tastes and smells unimaginably good, produced from precious fruits and herbs of the paradise world of Caddis for it's highest nobility."
	strength = 35
	color = "#722f37"
	taste_description = "the supreme collection of fruits and herbs, carefully gathered on Caddis with incredible proper effort and respect. You surely could give your own soul for this ideal wine."

	glass_name = "caddisian wine"
	glass_desc = "A very classy looking drink."

/datum/reagent/ethanol/amasec/mjod
	name = "Mjod"
	description = "Extremely potent alcoholic beverage, able to intoxicate even Adeptus Astartes."
	strength = 12.5
	toxicity = 5
	nutriment_factor = 5
	color = "#ff9100"
	taste_description = "cold and bitter sweetness with a hint of herbs"

	glass_name = "mjod"
	glass_desc = "Extremely potent alcoholic beverage, able to intoxicate even Adeptus Astartes. Probably lethal for non-Astartes, but tastes quite good."

/datum/reagent/ethanol/herbal
	name = "Herbal Liquor"
	description = "A complex blend of herbs, spices and roots mingle in this old Terrah classic."
	taste_description = "a sweet summer garden"
	color = "#dfff00"
	strength = 15

	glass_name = "herbal liquor"
	glass_desc = "It's definitely green. Or is it yellow?"

// Cocktails
/datum/reagent/ethanol/acid_spit
	name = "Astartes Spit"
	description = "A drink for the daring, can be deadly if incorrectly prepared!"
	taste_description = "stomach acid"
	reagent_state = REAGENT_LIQUID
	color = "#365000"
	strength = 30

	glass_name = "Astartes Spit"
	glass_desc = "A drink from the Administratum archives. Made from dead spacemarines Batcher's glands."

/datum/reagent/ethanol/alliescocktail
	name = "Allies Cocktail"
	description = "A drink made from your allies, not as sweet as when made from your enemies."
	taste_description = "bitter yet free"
	color = "#d8ac45"
	strength = 25

	glass_name = "Allies cocktail"
	glass_desc = "A drink made from your allies."

/datum/reagent/ethanol/aloe
	name = "Aloe"
	description = "So very, very, very good."
	taste_description = "sweet 'n creamy"
	color = "#b7ea75"
	strength = 15

	glass_name = "Aloe"
	glass_desc = "Very, very, very good."

/datum/reagent/ethanol/amasec
	name = "Amasec"
	description = "Official drink of the Imperium of Man!"
	taste_description = "dark and metallic"
	reagent_state = REAGENT_LIQUID
	color = "#ff975d"
	strength = 25

	glass_name = "amasec"
	glass_desc = "Always handy before COMBAT!!!"

/datum/reagent/ethanol/andalusia
	name = "Andalusia"
	description = "A nice, strangely named drink."
	taste_description = "lemons"
	color = "#f4ea4a"
	strength = 15

	glass_name = "Andalusia"
	glass_desc = "A nice, strange named drink."

/datum/reagent/ethanol/antifreeze
	name = "Anti-freeze"
	description = "Ultimate refreshment."
	taste_description = "piss of Saint Drusus"
	color = "#56deea"
	strength = 12
	adj_temp = 20
	targ_temp = 330

	glass_name = "Anti-freeze"
	glass_desc = "The ultimate refreshment."

/datum/reagent/ethanol/atomicbomb
	name = "Vraks Vibe Check"
	description = "No man's land - inside and outside."
	taste_description = "artillery strike"
	reagent_state = REAGENT_LIQUID
	color = "#666300"
	strength = 10
	druggy = 50

	glass_name = "Vraks Vibe Check"
	glass_desc = "Will certainly turn your tongue into no man's land."

/datum/reagent/ethanol/coffee/b52
	name = "Maradeur"
	description = "Rotgut Recaf, Tannithian Cream, and Gleece. You will get bombed."
	taste_description = "angry and irish"
	taste_mult = 1.3
	color = "#997650"
	strength = 12

	glass_name = "Maradeur"
	glass_desc = "Rotgut Recaf, Tannithian cream, and Gleece. You will get bombed."

/datum/reagent/ethanol/bahama_mama
	name = "Reth Resort"
	description = "Tropical cocktail."
	taste_description = "lime and orange"
	color = "#ff7f3b"
	strength = 25

	glass_name = "Reth Resort"
	glass_desc = "Tropical cocktail"

/datum/reagent/ethanol/bananahonk
	name = "Banana Mama"
	description = "A drink from Clown Heaven."
	taste_description = "a bad joke"
	nutriment_factor = 1
	color = "#ffff91"
	strength = 12

	glass_name = "Banana Honk"
	glass_desc = "A drink from Banana Heaven."

/datum/reagent/ethanol/barefoot
	name = "Barefoot"
	description = "Barefoot and pregnant."
	taste_description = "creamy berries"
	color = "#ffcdea"
	strength = 30

	glass_name = "Barefoot"
	glass_desc = "Barefoot and pregnant."

/datum/reagent/ethanol/beepsky_smash
	name = "Servitor Smash"
	description = "Deny drinking this and prepare for becoming another one for annoying Adeptus Mechanicus."
	taste_description = "JUSTICE"
	taste_mult = 2
	reagent_state = REAGENT_LIQUID
	color = "#404040"
	strength = 14

	glass_name = "Servitor Smash"
	glass_desc = "Heavy, just like the your punishment for annoying Adeptus Mechanicus."

/datum/reagent/ethanol/beepsky_smash/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.Stun(2)

/datum/reagent/ethanol/bilk
	name = "Bilk"
	description = "This appears to be beer mixed with milk. Disgusting."
	taste_description = "desperation and lactate"
	color = "#895c4c"
	strength = 50
	nutriment_factor = 2

	glass_name = "bilk"
	glass_desc = "A brew of milk and beer. For those alcoholics who fear osteoporosis."

/datum/reagent/ethanol/black_russian
	name = "Black Vostroyan"
	description = "For the lactose-intolerant. Still as classy as a White Vostroyan."
	taste_description = "bitterness"
	color = "#360000"
	strength = 15

	glass_name = "Black Vostroyan"
	glass_desc = "For the lactose-intolerant. Still as classy as a White Vostroyan."

/datum/reagent/ethanol/bloody_mary
	name = "Bloody Mary"
	description = "A strange yet pleasurable mixture made of Rahzvod, tomato and lime juice. Or at least you THINK the red stuff is tomato juice."
	taste_description = "tomatoes with a hint of lime"
	color = "#b40000"
	strength = 15

	glass_name = "Bloody Mary"
	glass_desc = "Tomato juice, mixed with Rahzvod and a lil' bit of lime. Tastes like liquid murder."

/datum/reagent/ethanol/booger
	name = "Booger"
	description = "Ewww..."
	taste_description = "sweet 'n creamy"
	color = "#8cff8c"
	strength = 30

	glass_name = "Booger"
	glass_desc = "Ewww..."

/datum/reagent/ethanol/coffee/brave_bull
	name = "Brave Bull"
	description = "It's just as effective as Dutch-Courage!"
	taste_description = "alcoholic bravery"
	taste_mult = 1.1
	color = "#4c3100"
	strength = 15

	glass_name = "Brave Bull"
	glass_desc = "Tequilla and recaf liquor, brought together in a mouthwatering mixture. Drink up."

/datum/reagent/ethanol/changelingsting
	name = "Genestealer Sting"
	description = "You take a tiny sip and feel a burning sensation..."
	taste_description = "your brain coming out your nose"
	color = "#2e6671"
	strength = 10

	glass_name = "Genestealer Sting"
	glass_desc = "A stingy drink."

/datum/reagent/ethanol/martini
	name = "Classic Martini"
	description = "Vermouth with Gyn. Not quite how 007 enjoyed it, but still delicious."
	taste_description = "dry class"
	color = "#0064c8"
	strength = 25

	glass_name = "classic martini"
	glass_desc = "Damn, the bartender even stirred it, not shook it."

/datum/reagent/ethanol/cuba_libre
	name = "Caddis Libre"
	description = "Rum, mixed with cola. Viva la revolucion."
	taste_description = "cola"
	color = "#3e1b00"
	strength = 30

	glass_name = "Caddis Libre"
	glass_desc = "A classic mix of rum and cola."

/datum/reagent/ethanol/demonsblood
	name = "Bloodthirster's Blood"
	description = "A bit heretical. Better look if there are any inquisitors around before you order."
	taste_description = "blood and pure slaughter"
	taste_mult = 1.5
	color = "#820000"
	strength = 15

	glass_name = "Bloodthirster's Blood"
	glass_desc = "A bit heretical. Better look if there are any inquisitors around before you order."

/datum/reagent/ethanol/devilskiss
	name = "Daemonette's Kiss"
	description = "Better don't drink it with Inquisitor's acolytes nearby"
	taste_description = "bitter iron and heretical activities"
	color = "#a68310"
	strength = 15

	glass_name = "Daemonette's Kiss"
	glass_desc = "Better don't drink it with Inquisitor's acolytes nearby"

/datum/reagent/ethanol/driestmartini
	name = "Driest Martini"
	description = "Only for the experienced. You think you see sand floating in the glass."
	taste_description = "a beach"
	nutriment_factor = 1
	color = "#2e6671"
	strength = 12

	glass_name = "Driest Martini"
	glass_desc = "Only for the experienced. You think you see sand floating in the glass."

/datum/reagent/ethanol/ginfizz
	name = "Gyn Fizz"
	description = "Refreshingly lemony, deliciously dry."
	taste_description = "dry, tart lemons"
	color = "#ffffae"
	strength = 30

	glass_name = "gyn fizz"
	glass_desc = "Refreshingly lemony, deliciously dry."

/datum/reagent/ethanol/grog
	name = "Grog"
	description = "Watered-down foiz, pirate approved!"
	taste_description = "a poor excuse for alcohol"
	reagent_state = REAGENT_LIQUID
	color = "#ffbb00"
	strength = 100

	glass_name = "grog"
	glass_desc = "A fine and cepa drink for warp jumps."

/datum/reagent/ethanol/erikasurprise
	name = "Erika Surprise"
	description = "The surprise is, it's green!"
	taste_description = "tartness and bananas"
	color = "#2e6671"
	strength = 15

	glass_name = "Erika Surprise"
	glass_desc = "The surprise is, it's green!"

/datum/reagent/ethanol/gargle_blaster
	name = "Pan-Imperial Gargle Blaster"
	description = "Whoah, this stuff looks volatile!"
	taste_description = "your brains smashed out by a ploin wrapped around a gold brick"
	taste_mult = 5
	reagent_state = REAGENT_LIQUID
	color = "#7f00ff"
	strength = 10

	glass_name = "Pan-Imperial Gargle Blaster"
	glass_desc = "Does... does this mean that Arthur and Ford are here? Oh joy."

/datum/reagent/ethanol/gintonic
	name = "Gyn and Tonic"
	description = "An all time classic, mild cocktail."
	taste_description = "mild and tart"
	color = "#0064c8"
	strength = 50

	glass_name = "gyn and tonic"
	glass_desc = "A mild but still great cocktail. Drink up, like a true Mordian."

/datum/reagent/ethanol/goldschlager
	name = "Goldschlager"
	description = "100 proof cinnamon amasec, made for alcoholic teen girls on spring break."
	taste_description = "burning cinnamon"
	taste_mult = 1.3
	color = "#f4e46d"
	strength = 15

	glass_name = "goldschlager"
	glass_desc = "100 proof that teen girls will drink anything with gold in it."

/datum/reagent/ethanol/hippies_delight
	name = "Mirael's Kiss"
	description = "Oh yes, those assets of Sororitas..."
	taste_description = "sweet and lustful kiss of gentle lips with a hint of tentacles"
	reagent_state = REAGENT_LIQUID
	color = "#ff88ff"
	strength = 15
	druggy = 50

	glass_name = "Mirael's Kiss"
	glass_desc = "Very heretical drink, favored by Slaanesh followers."

/datum/reagent/ethanol/hooch
	name = "Hooch"
	description = "Either someone's failure at cocktail making or attempt in alchohol production. In any case, do you really want to drink that?"
	taste_description = "pure resignation"
	color = "#4c3100"
	strength = 25
	toxicity = 2

	glass_name = "hooch"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."

/datum/reagent/ethanol/iced_beer
	name = "Iced Beer"
	description = "A beer which is so cold the air around it freezes."
	taste_description = "refreshingly cold"
	color = "#ffd300"
	strength = 50
	adj_temp = -20
	targ_temp = 270

	glass_name = "iced beer"
	glass_desc = "A beer so frosty, the air around it freezes."
	glass_special = list(DRINK_ICE)

/datum/reagent/ethanol/irishcarbomb
	name = "Tannithian Car Bomb"
	description = "Mmm, tastes like chocolate cake..."
	taste_description = "delicious anger"
	color = "#2e6671"
	strength = 15

	glass_name = "Tannithian Car Bomb"
	glass_desc = "I was born on a Tannith street, where the Emperor's drums did beat..."

/datum/reagent/ethanol/coffee/irishcoffee
	name = "Tannithian Recaf"
	description = "Coffee, and alcohol. More fun than a Mimosa to drink in the morning."
	taste_description = "giving up on the day"
	color = "#4c3100"
	strength = 15

	glass_name = "Tannithian recaf"
	glass_desc = "Recaf and alcohol. More fun than a Mimosa to drink in the morning."

/datum/reagent/ethanol/irish_cream
	name = "Tannithian Cream"
	description = "Whiskey-imbued cream, what else would you expect from the Tannithian?"
	taste_description = "creamy alcohol"
	color = "#dddd9a3"
	strength = 25

	glass_name = "Tannith cream"
	glass_desc = "It's cream, mixed with whiskey. What else would you expect from the Tannithian?"

/datum/reagent/ethanol/longislandicedtea
	name = "Long Island Iced Tanna"
	description = "The liquor cabinet, brought together in a delicious mix. Intended for middle-aged alcoholic women only."
	taste_description = "a mixture of cola and alcohol"
	color = "#895b1f"
	strength = 12

	glass_name = "Long Island iced tanna"
	glass_desc = "The liquor cabinet, brought together in a delicious mix. Intended for middle-aged alcoholic women only."

/datum/reagent/ethanol/manhattan
	name = "Necromunda"
	description = "The Arbites undercover drink of choice. He never could stomach gyn..."
	taste_description = "mild dryness and sewers"
	color = "#c13600"
	strength = 15

	glass_name = "Necromunda"
	glass_desc = "The Arbites undercover drink of choice. He never could stomach gyn..."

/datum/reagent/ethanol/manhattan_proj
	name = "Jurten"
	description = "A Krieger's drink of choice, for pondering ways to blow stuff up like in good old times."
	taste_description = "despaired sacrifice"
	color = "#c15d00"
	strength = 10
	druggy = 30

	glass_name = "Jurten"
	glass_desc = "A Krieger's drink of choice, for pondering ways to blow stuff up like in good old times."

/datum/reagent/ethanol/manly_dorf
	name = "The Manly Squat"
	description = "Beer and Ale, brought together in a delicious mix. Intended for true men only."
	taste_description = "hair on your chest and your chin"
	color = "#4c3100"
	strength = 25

	glass_name = "The Manly Squat"
	glass_desc = "A manly concotion made from Ale and Beer. Intended for true men only."

/datum/reagent/ethanol/margarita
	name = "Margarita"
	description = "On the rocks with salt on the rim. Arriba~!"
	taste_description = "dry and salty"
	color = "#8cff8c"
	strength = 15

	glass_name = "margarita"
	glass_desc = "On the rocks with salt on the rim. Arriba~!"

/datum/reagent/ethanol/battuta
	name = "Ibn Batutta"
	description = "One of the Rogue Trader's favourite cocktails, celebrating Muhammad Ibn Battuta, the traveller of ancient Terra."
	taste_description = "a Moroccan garden"
	color = "#dfbe00"
	strength = 18

	glass_name = "Ibn Batutta cocktail"
	glass_desc = "A refreshing blend of herbal liquor, the juice of an orange and a hint of mint. Named for Muhammad Ibn Battuta, the traveler of ancient Terra."

/datum/reagent/ethanol/magellan
	name = "Magellan"
	description = "One of the Rogue Trader's favourite cocktails, celebrating Ferdinand Magellan."
	taste_description = "an aristrocatic experience"
	color = "#6b3535"
	strength = 13

	glass_name = "Magellan cocktail"
	glass_desc = "A tasty sweetened blend of wine and fine whiskey. Named for Ferdinand Magellan, who led the first expedition to circumnavigate ancient Terra by sea."

/datum/reagent/ethanol/zhenghe
	name = "Zheng He"
	description = "One of the Rogue Trader's favourite cocktails, celebrating Zheng He, the traveller of ancient Terra."
	taste_description = "herbal bitterness"
	color = "#173b06"
	strength = 20

	glass_name = "Zheng He cocktail"
	glass_desc = "A rather bitter blend of vermouth and well-steeped black tea. Named for Zheng He, the traveller of ancient Terra."

/datum/reagent/ethanol/armstrong
	name = "Armstrong"
	description = "One of the Rogue Trader's favourite cocktails, celebrating Neil Armstrong."
	taste_description = "limes and alcoholic beer"
	color = "#ffd300"
	strength = 15

	glass_name = "Armstrong cocktail"
	glass_desc = "Beer, vodka and lime come together in this instant classic. Named for Neil Armstrong, explorer of ancient Terra and it's moon."

/datum/reagent/ethanol/mead
	name = "Mead"
	description = "An ancient drink, favored by Valhallans and Fenrisians, although a cheap one."
	taste_description = "sweet, sweet alcohol"
	reagent_state = REAGENT_LIQUID
	color = "#ffbb00"
	strength = 30
	nutriment_factor = 1

	glass_name = "mead"
	glass_desc = "An ancient drink, favored by Valhallans and Fenrisians, although a cheap one."

/datum/reagent/ethanol/moonshine
	name = "Moonshine"
	description = "You've really hit rock bottom now... your liver packed its bags and left last night."
	taste_description = "bitterness"
	taste_mult = 2.5
	color = "#0064c8"
	strength = 12

	glass_name = "moonshine"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."

/datum/reagent/ethanol/neurotoxin
	name = "Neurotoxin"
	description = "A strong neurotoxin that puts the subject into a death-like state."
	taste_description = "a numbing sensation"
	reagent_state = REAGENT_LIQUID
	color = "#2e2e61"
	strength = 10

	glass_name = "Neurotoxin"
	glass_desc = "A drink that is guaranteed to knock you silly."
	glass_icon = DRINK_ICON_NOISY
	glass_special = list("neuroright")

/datum/reagent/ethanol/neurotoxin/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.Weaken(3)
	M.add_chemical_effect(CE_PULSE, -1)

/datum/reagent/ethanol/patron
	name = "Patron"
	description = "Rotgut with silver in it, a favorite of alcoholic women in the club scene."
	taste_description = "metallic and expensive"
	color = "#585840"
	strength = 30

	glass_name = "Patron"
	glass_desc = "Drinking patron in the bar, with all the subpar ladies."

/datum/reagent/ethanol/pwine
	name = "Poison Wine"
	description = "Is this even wine? Toxic! Hallucinogenic! Probably consumed in boatloads by your superiors!"
	taste_description = "purified alcoholic death"
	color = "#000000"
	strength = 10
	druggy = 50
	halluci = 10

	glass_name = "???"
	glass_desc = "A black ichor with an oily purple sheer on top. Are you sure you should drink this?"

/datum/reagent/ethanol/pwine/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(M.chem_doses[type] > 30)
		M.adjustToxLoss(2 * removed)
	if(M.chem_doses[type] > 60 && ishuman(M) && prob(5))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/heart/L = H.internal_organs_by_name[BP_HEART]
		if (L && istype(L))
			if(M.chem_doses[type] < 120)
				L.take_damage(10 * removed, 0)
			else
				L.take_damage(100, 0)

/datum/reagent/ethanol/red_mead
	name = "Red Mead"
	description = "The true Valhallan's drink! Even though it has a strange red color."
	taste_description = "sweet and salty alcohol"
	color = "#c73c00"
	strength = 30

	glass_name = "red mead"
	glass_desc = "A true Valhallan's beverage, though its color is strange."

/datum/reagent/ethanol/sbiten
	name = "Sbiten"
	description = "A spicy Mead! Might be a little hot for the little guys!"
	taste_description = "hot and spice"
	color = "#ffa371"
	strength = 15
	adj_temp = 50
	targ_temp = 360

	glass_name = "Sbiten"
	glass_desc = "A spicy mix of Mead and Spice. Very hot."

/datum/reagent/ethanol/screwdrivercocktail
	name = "Screwdriver"
	description = "Rahzvod, mixed with plain ol' orange juice. The result is surprisingly delicious."
	taste_description = "oranges"
	color = "#a68310"
	strength = 15

	glass_name = "Screwdriver"
	glass_desc = "A simple, yet superb mixture of Rahzvod and orange juice. Just the thing for the tired tankman of Leman Russ."

/datum/reagent/ethanol/ships_surgeon
	name = "Ship's Chiurgeon"
	description = "Rum and Dr. Bile. Served ice cold, like the scalpel."
	taste_description = "black comedy"
	color = "#524d0f"
	strength = 15

	glass_name = "ship's Chiurgeon"
	glass_desc = "Rum qualified for surgical practice by Dr. Bile. Smooth and steady."

/datum/reagent/ethanol/silencer
	name = "Silencer"
	description = "Signature drink of Officio Assasinorum. They never spill it."
	taste_description = "pure infiltration and punishing darkness"
	taste_mult = 1.2
	nutriment_factor = 1
	color = "#ffffff"
	strength = 12

	glass_name = "Silencer"
	glass_desc = "Signature drink of Officio Assasinorum. They never spill it."

/datum/reagent/ethanol/singulo
	name = "Geller"
	description = "A warp-beverage!"
	taste_description = "chaotic energies and foreign realms"
	color = "#2e6671"
	strength = 10

	glass_name = "Geller"
	glass_desc = "A warp-beverage!"

/datum/reagent/ethanol/snowwhite
	name = "Snow White"
	description = "A cold refreshment."
	taste_description = "refreshing cold"
	color = "#ffffff"
	strength = 30

	glass_name = "Snow White"
	glass_desc = "A cold refreshment."

/datum/reagent/ethanol/suidream
	name = "Sui Dream"
	description = "Comprised of: White soda, blue curacao, melon liquor."
	taste_description = "fruit"
	color = "#00a86b"
	strength = 100

	glass_name = "Sui Dream"
	glass_desc = "A froofy, fruity, and sweet mixed drink. Understanding the name only brings shame."

/datum/reagent/ethanol/syndicatebomb
	name = "Strange Bomb"
	description = "Tastes like terrorism!"
	taste_description = "purified treason"
	color = "#2e6671"
	strength = 10

	glass_name = "Strange Bomb"
	glass_desc = "Tastes like terrorism!"

/datum/reagent/ethanol/tequilla_sunrise
	name = "Rotgut Sunrise"
	description = "Rotgut and orange juice. Much like a Screwdriver, only Tallarn."
	taste_description = "oranges"
	color = "#ffe48c"
	strength = 25

	glass_name = "Rotgut Sunrise"
	glass_desc = "Oh great, now you feel nostalgic about sunrises back on Tallarn..."

/datum/reagent/ethanol/threemileisland
	name = "Three Mile Island Iced Tanna"
	description = "Made for a woman, strong enough for a man."
	taste_description = "dry"
	color = "#666340"
	strength = 10
	druggy = 50

	glass_name = "Three Mile Island iced tea"
	glass_desc = "A glass of this is sure to prevent a meltdown, but Machine Spirits still will not be pleased..."

/datum/reagent/ethanol/toxins_special
	name = "Promethium Special"
	description = "This thing is ON FIRE! OPEN THE DAMN SLIPSTREAM!"
	taste_description = "spicy toxins"
	reagent_state = REAGENT_LIQUID
	color = "#7f00ff"
	strength = 10
	adj_temp = 15
	targ_temp = 330

	glass_name = "Promethium Special"
	glass_desc = "Whoah, this thing is on FIRE!"

/datum/reagent/ethanol/vodkamartini
	name = "Rahzvod Martini"
	description = "Rahzvod with Gyn. Not quite how Inquisition enjoys it, but still delicious."
	taste_description = "shaken, not stirred"
	color = "#0064c8"
	strength = 12

	glass_name = "rahzvod martini"
	glass_desc ="A bastardisation of the classic martini. Still great."


/datum/reagent/ethanol/vodkatonic
	name = "Rahzvod and Tonic"
	description = "For when a gin and tonic isn't Vostroyan enough."
	taste_description = "tart bitterness"
	color = "#0064c8" // rgb: 0, 100, 200
	strength = 15

	glass_name = "rahzvod and tonic"
	glass_desc = "For when a gin and tonic isn't Vostroyan enough."


/datum/reagent/ethanol/white_russian
	name = "White Vostroyan"
	description = "That's just, like, your opinion, man..."
	taste_description = "bitter cream"
	color = "#a68340"
	strength = 15

	glass_name = "White Vostroyan"
	glass_desc = "A very nice looking drink. But that's just, like, your opinion, man."


/datum/reagent/ethanol/whiskey_cola
	name = "Whiskey Cola"
	description = "Agri-Whiskey, mixed with cola. Surprisingly refreshing."
	taste_description = "cola"
	color = "#3e1b00"
	strength = 25

	glass_name = "whiskey cola"
	glass_desc = "An innocent-looking mixture of cola and agri-whiskey. Delicious."

/datum/reagent/ethanol/whiskeysoda
	name = "Whiskey Soda"
	description = "For the more refined underhive scum."
	color = "#eab300"
	strength = 15

	glass_name = "whiskey soda"
	glass_desc = "Ultimate refreshment."

/datum/reagent/ethanol/specialwhiskey // I have no idea what this is and where it comes from
	name = "Special Blend Whiskey"
	description = "Just when you thought regular agri-whiskey was good... This silky, amber goodness has to come along and ruin everything."
	taste_description = "liquid fire"
	color = "#523600"
	strength = 25

	glass_name = "special blend whiskey"
	glass_desc = "Just when you thought regular agri-whiskey was good... This silky, amber goodness has to come along and ruin everything."

/datum/reagent/ethanol/greenrush
	name = "Green Rush"
	description = "An strange mix of alcohol, it was apparently used by ancient tribes of Terra for shamanic rituals and rites for their warriors."
	taste_description = "an unknown mix you can't even describe with your tongue"
	color = "#2A871B"

	glass_name = "green rush"
	glass_desc = "This drink really just makes you want to travel a post-apocalyptic wasteland in search of a briefcase to save your tribe does it ?."

/datum/reagent/ethanol/bluerush
	name = "Blue Rush"
	description = "Unlike green rush, this drink has been not forgotten, now simply distilled by more poor hive denizens and praised for it's taste that isnt shit."
	taste_description = "pure resignation"
	color = "#1C719E"

	glass_name = "hooch"
	glass_desc = "It reminds you of the ocean with such blue color."

/datum/reagent/ethanol/oak_scream
	name = "Oak Scream"
	description = "The name of this drink comes from the sheer amount of oaks that were cut to produce this somewhat forgotten drink nowadays, and the sounds they produced when they fell onto the ground."
	taste_description = "liquid..oak ?"
	color = "#AF8943"

	glass_name = "oak scream"
	glass_desc = "Relax, the trees around you wont awake and shred you to nothing for drinking this..Right ?"

/datum/reagent/ethanol/southernblood
	name = "Southern Blood"
	description = ""
	taste_description = "pure resignation"
	color = "#A72929"

	glass_name = "hooch"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."

/datum/reagent/ethanol/ancienteye
	name = "Ancient Eye"
	description = "This drink was used mainly by shamans and fortune tellers to see the future of individuals"
	taste_description = "pure resignation"
	color = "#29A777"

	glass_name = "hooch"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."

/datum/reagent/ethanol/thymebolt
	name = "Thyme Bolt"
	description = "A drink rumored to be a favourite by plasma weapon specialists and people whom are forced to use said weapons, because it numbs the thought of their weapon exploding in their hands at any time with the heating."
	taste_description = "pure resignation"
	color = "#47F3F1"

	glass_name = "hooch"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."

/datum/reagent/ethanol/redscore
	name = "Redscore"
	description = "A favourite among pirates, gangers and apparently berserks & heretics, but do not allow such baseless rumors to enjoy such a drink!"
	taste_description = "pure resignation"
	color = "#F34747"

	glass_name = "hooch"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."

/datum/reagent/ethanol/spiritbear
	name = "Spirit Bear"
	description = "Rumored to have been created by a Space Wolf recruit with the blood of a bear-like creature, apparently he managed to survive the trial just drinking the blood of those creatures, but is it true ?"
	taste_description = "liquid bear and copper, lots of copper"
	color = "#811515"

	glass_name = "spirit bear"
	glass_desc = "The drink you just need before embarking to die inside of a cave full of shafras with a lasgun, or beating them up with your fists."

/datum/reagent/ethanol/oldvinland
	name = "Old Vinland"
	description = "In the old Terra, there was a place that the sun never arrived, the soil was not fertile and most adventurers died & expeditions unsuccessfully ever arrived, this drink was made to eagerly make men who were forced on such expeditionary feats forget the horrors of such work and land."
	taste_description = "you taste fear and hunger"
	color = "#4c3100"

	glass_name = "old vinland"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."

/datum/reagent/ethanol/depressing_flash
	name = "Depressing Flash"
	description = "A drink favored by depressed mercenaries, bounty hunters, inquisitors, and some gangers. Generally you dont want to shoot the face of your bounty with a bolter or flamethrower, else the bounty goes to waste most of the times."
	taste_description = "the tears of a grade one fixer"
	color = "#4c3100"

	glass_name = "depressing flash"
	glass_desc = "You know how the head of the city is so strict with these things ?"