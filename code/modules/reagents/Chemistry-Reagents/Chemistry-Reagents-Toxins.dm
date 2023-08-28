/* Toxins, poisons, venoms */

/datum/reagent/toxin
	name = "toxin"
	description = "A toxic chemical."
	taste_description = "bitterness"
	taste_mult = 1.2
	reagent_state = REAGENT_LIQUID
	color = "#cf3600"
	metabolism = REM * 0.25 // 0.05 by default. They last a while and slowly kill you.

	var/target_organ
	var/strength = 4 // How much damage it deals per unit

/datum/reagent/toxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(strength && alien != IS_DIONA)
		M.add_chemical_effect(CE_TOXIN, strength)
		var/dam = (strength * removed)
		if(target_organ && ishuman(M))
			var/mob/living/carbon/human/H = M
			var/obj/item/organ/internal/I = H.internal_organs_by_name[target_organ]
			if(I)
				var/can_damage = I.max_damage - I.damage
				if(can_damage > 0)
					if(dam > can_damage)
						I.take_damage(can_damage, silent=TRUE)
						dam -= can_damage
					else
						I.take_damage(dam, silent=TRUE)
						dam = 0
		if(dam)
			M.adjustToxLoss(target_organ ? (dam * 0.75) : dam)

/datum/reagent/toxin/plasticide
	name = "Plasticide"
	description = "Liquid plastic, do not eat."
	taste_description = "plastic"
	reagent_state = REAGENT_LIQUID
	color = "#cf3600"
	strength = 5

/datum/reagent/toxin/amatoxin
	name = "Amatoxin"
	description = "A powerful poison derived from certain species of mushroom."
	taste_description = "mushroom"
	reagent_state = REAGENT_LIQUID
	color = "#792300"
	strength = 10

/datum/reagent/toxin/blattedin
	name = "Blattedin"
	description = "A powerful toxin produced by those omnipresent roaches."
	taste_description = "grox"
	reagent_state = REAGENT_LIQUID
	target_organ = BP_LIVER
	color = "#0f4800"
	strength = 5

/datum/reagent/toxin/blattedin/touch_mob(var/mob/living/L, var/amount)
	if(istype(L, /mob/living/simple_animal/hostile/retaliate/roach))
		if(L.health <= 0)
			if(prob(70))//Roaches sometimes can come back to life from healing vapors
				return
		L.heal_organ_damage(amount * 0.5)
	else
		..()

/datum/reagent/toxin/carpotoxin
	name = "Carpotoxin"
	description = "A deadly neurotoxin produced by the dreaded space carp."
	taste_description = "fish"
	reagent_state = REAGENT_LIQUID
	color = "#003333"
	target_organ = BP_BRAIN
	strength = 10

/datum/reagent/toxin/phoron
	name = "Promethium"
	description = "Promethium in its dust form."
	taste_mult = 1.5
	reagent_state = REAGENT_LIQUID
	color = "#ff3300"
	strength = 30
	touch_met = 5
	var/fire_mult = 5

/datum/reagent/toxin/phoron/touch_mob(var/mob/living/L, var/amount)
	if(istype(L))
		L.adjust_fire_stacks(amount / fire_mult)

/datum/reagent/toxin/phoron/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_NABBER)
		return
	..()

/datum/reagent/toxin/phoron/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	M.take_organ_damage(0, removed * 0.1) //being splashed directly with phoron causes minor chemical burns
	if(prob(10 * fire_mult))
		M.pl_effects()
/* //this probably isn't working, and if it is, its OP as fuck and could easily be used for griefing
/datum/reagent/toxin/phoron/touch_turf(var/turf/simulated/T)
	if(!istype(T))
		return
	T.assume_gas("phoron", volume, T20C)
	remove_self(volume)
*/

/datum/reagent/toxin/chlorine
	name = "Chlorine"
	description = "A highly poisonous liquid. Smells strongly of bleach."
	reagent_state = REAGENT_LIQUID
	taste_description = "bleach"
	color = "#707C13"
	strength = 15
	metabolism = REM

// Produced during deuterium synthesis. Super poisonous, SUPER flammable (doesn't need oxygen to burn).
/datum/reagent/toxin/phoron/oxygen
	name = "Oxyphoron"
	description = "An exceptionally flammable molecule formed from deuterium synthesis."
	strength = 15
	fire_mult = 15

/datum/reagent/toxin/phoron/oxygen/touch_turf(var/turf/simulated/T)
	if(!istype(T))
		return
	T.assume_gas("oxygen", ceil(volume/2), T20C)
	T.assume_gas("phoron", ceil(volume/2), T20C)
	remove_self(volume)

/datum/reagent/toxin/cyanide //Fast and Lethal
	name = "Cyanide"
	description = "A highly toxic chemical."
	taste_mult = 0.6
	reagent_state = REAGENT_LIQUID
	color = "#cf3600"
	strength = 20
	metabolism = REM * 2
	target_organ = BP_HEART

/datum/reagent/toxin/cyanide/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	M.sleeping += 1

/datum/reagent/toxin/potassium_chloride
	name = "Potassium Chloride"
	description = "A delicious salt that stops the heart when injected into cardiac muscle."
	taste_description = "salt"
	reagent_state = REAGENT_SOLID
	color = "#ffffff"
	strength = 0
	overdose = REAGENTS_OVERDOSE

/datum/reagent/toxin/potassium_chloride/overdose(var/mob/living/carbon/M, var/alien)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.stat != 1)
			if(H.losebreath >= 10)
				H.losebreath = max(10, H.losebreath - 10)
			H.adjustOxyLoss(2)
			H.Weaken(10)
		M.add_chemical_effect(CE_NOPULSE, 1)


/datum/reagent/toxin/potassium_chlorophoride
	name = "Potassium Chlorophoride"
	description = "A specific chemical based on Potassium Chloride to stop the heart for surgery. Not safe to eat!"
	taste_description = "salt"
	reagent_state = REAGENT_SOLID
	color = "#ffffff"
	strength = 10
	overdose = 20

/datum/reagent/toxin/potassium_chlorophoride/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.stat != 1)
			if(H.losebreath >= 10)
				H.losebreath = max(10, M.losebreath-10)
			H.adjustOxyLoss(2)
			H.Weaken(10)
		M.add_chemical_effect(CE_NOPULSE, 1)

/datum/reagent/toxin/zombiepowder
	name = "Zombie Powder"
	description = "A strong neurotoxin that puts the subject into a death-like state."
	taste_description = "death"
	reagent_state = REAGENT_SOLID
	color = "#669900"
	metabolism = REM
	strength = 3
	target_organ = BP_BRAIN

/datum/reagent/toxin/zombiepowder/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		return
	M.status_flags |= FAKEDEATH
	M.adjustOxyLoss(3 * removed)
	M.Weaken(10)
	M.silent = max(M.silent, 10)
	if(M.chem_doses[type] <= removed) //half-assed attempt to make timeofdeath update only at the onset
		M.timeofdeath = world.time
	M.add_chemical_effect(CE_NOPULSE, 1)

/datum/reagent/toxin/zombiepowder/Destroy()
	if(holder && holder.my_atom && ismob(holder.my_atom))
		var/mob/M = holder.my_atom
		M.status_flags &= ~FAKEDEATH
	. = ..()

/datum/reagent/toxin/fertilizer //Reagents used for plant fertilizers.
	name = /datum/reagent/toxin/fertilizer
	description = "A chemical mix good for growing plants with."
	taste_description = "plant food"
	taste_mult = 0.5
	reagent_state = REAGENT_LIQUID
	strength = 0.5 // It's not THAT poisonous.
	color = "#664330"

/datum/reagent/toxin/fertilizer/eznutrient
	name = "EZ Nutrient"

/datum/reagent/toxin/fertilizer/left4zed
	name = "Left-4-Zed"

/datum/reagent/toxin/fertilizer/robustharvest
	name = "Robust Harvest"


/datum/reagent/toxin/fertilizer/poo
	name = "Manure"
	description = "Made from whatever waste could be found "
	taste_mult = 1
	reagent_state = REAGENT_LIQUID
	color = "#351e03"
	strength = 0.5
/datum/reagent/toxin/plantbgone
	name = "Plant-B-Gone"
	description = "A harmful toxic mixture to kill plantlife. Do not ingest!"
	taste_mult = 1
	reagent_state = REAGENT_LIQUID
	color = "#49002e"
	strength = 4

/datum/reagent/toxin/plantbgone/touch_turf(var/turf/T)
	if(istype(T, /turf/simulated/wall))
		var/turf/simulated/wall/W = T
		if(locate(/obj/effect/overlay/wallrot) in W)
			for(var/obj/effect/overlay/wallrot/E in W)
				qdel(E)
			W.visible_message("<span class='notice'>The fungi are completely dissolved by the solution!</span>")

/datum/reagent/toxin/plantbgone/touch_obj(var/obj/O, var/volume)
	if(istype(O, /obj/effect/vine))
		qdel(O)

/datum/reagent/toxin/plantbgone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		M.adjustToxLoss(50 * removed)

/datum/reagent/toxin/plantbgone/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(alien == IS_DIONA)
		M.adjustToxLoss(50 * removed)

/datum/reagent/acid/polyacid
	name = "Polytrinic acid"
	description = "Polytrinic acid is a an extremely corrosive chemical substance."
	taste_description = "acid"
	reagent_state = REAGENT_LIQUID
	color = "#669900"
	power = 10
	meltdose = 4

/datum/reagent/lexorin
	name = "Lexorin"
	description = "Lexorin temporarily stops respiration. Causes tissue damage."
	taste_description = "acid"
	reagent_state = REAGENT_LIQUID
	color = "#c8a5dc"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/lexorin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(alien == IS_SKRELL)
		M.take_organ_damage(2.4 * removed, 0)
		if(M.losebreath < 22.5)
			M.losebreath++
	else
		M.take_organ_damage(3 * removed, 0)
		if(M.losebreath < 15)
			M.losebreath++

/datum/reagent/mutagen
	name = "Unstable mutagen"
	description = "Might cause unpredictable mutations. Keep away from children."
	taste_description = "slime"
	taste_mult = 0.9
	reagent_state = REAGENT_LIQUID
	color = "#13bc5e"

/datum/reagent/mutagen/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(33))
		affect_blood(M, alien, removed)

/datum/reagent/mutagen/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(67))
		affect_blood(M, alien, removed)

/datum/reagent/mutagen/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)

	if(M.isSynthetic())
		return

	var/mob/living/carbon/human/H = M
	if(istype(H) && (H.species.species_flags & SPECIES_FLAG_NO_SCAN))
		return

	if(M.dna)
		if(prob(removed * 0.1)) // Approx. one mutation per 10 injected/20 ingested/30 touching units
			randmuti(M)
			if(prob(98))
				randmutb(M)
			else
				randmutg(M)
			domutcheck(M, null)
			M.UpdateAppearance()
	M.apply_effect(10 * removed, IRRADIATE, blocked = 0)

/datum/reagent/slimejelly
	name = "Slime Jelly"
	description = "A gooey semi-liquid produced from one of the deadliest lifeforms in existence. SO REAL."
	taste_description = "slime"
	taste_mult = 1.3
	reagent_state = REAGENT_LIQUID
	color = "#801e28"

/datum/reagent/slimejelly/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(prob(10))
		to_chat(M, "<span class='danger'>Your insides are burning!</span>")
		M.adjustToxLoss(rand(100, 300) * removed)
	else if(prob(40))
		M.heal_organ_damage(25 * removed, 0)

/datum/reagent/soporific
	name = "Soporific"
	description = "An effective hypnotic used to treat insomnia."
	taste_description = "bitterness"
	reagent_state = REAGENT_LIQUID
	color = "#009ca8"
	metabolism = REM * 0.5
	overdose = REAGENTS_OVERDOSE
	scannable = 1

/datum/reagent/soporific/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	var/threshold = 1
	if(alien == IS_SKRELL)
		threshold = 1.2

	if(M.chem_doses[type] < 1 * threshold)
		if(M.chem_doses[type] == metabolism * 2 || prob(5))
			M.emote("yawn")
	else if(M.chem_doses[type] < 1.5 * threshold)
		M.eye_blurry = max(M.eye_blurry, 10)
	else if(M.chem_doses[type] < 5 * threshold)
		if(prob(50))
			M.Weaken(2)
		M.drowsyness = max(M.drowsyness, 20)
	else
		M.sleeping = max(M.sleeping, 20)
		M.drowsyness = max(M.drowsyness, 60)
	M.add_chemical_effect(CE_PULSE, -1)

/datum/reagent/chloralhydrate
	name = "Chloral Hydrate"
	description = "A powerful sedative."
	taste_description = "bitterness"
	reagent_state = REAGENT_SOLID
	color = "#000067"
	metabolism = REM * 0.5
	overdose = REAGENTS_OVERDOSE * 0.5

/datum/reagent/chloralhydrate/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	var/threshold = 1
	if(alien == IS_SKRELL)
		threshold = 1.2

	if(M.chem_doses[type] == metabolism * threshold)
		M.confused += 2
		M.drowsyness += 2
	else if(M.chem_doses[type] < 2 * threshold)
		M.Weaken(30)
		M.eye_blurry = max(M.eye_blurry, 10)
	else
		M.sleeping = max(M.sleeping, 30)

	if(M.chem_doses[type] > 1 * threshold)
		M.adjustToxLoss(removed)

/datum/reagent/chloralhydrate/beer2 //disguised as normal beer for use by emagged brobots
	name = "Beer"
	description = "An alcoholic beverage made from malted grains, hops, yeast, and water. The fermentation appears to be incomplete." //If the players manage to analyze this, they deserve to know something is wrong.
	taste_description = "shitty piss water"
	reagent_state = REAGENT_LIQUID
	color = "#ffd300"

	glass_name = "beer"
	glass_desc = "A freezing pint of beer"
/* Drugs */

/datum/reagent/space_drugs
	name = "Obscura"
	description = "An illegal chemical compound used as drug."
	taste_description = "bitterness"
	taste_mult = 0.4
	reagent_state = REAGENT_LIQUID
	color = "#60a584"
	metabolism = REM * 0.5
	overdose = REAGENTS_OVERDOSE
	overdose = 30
	reagent_addiction_strength = 40

/datum/reagent/space_drugs/affect_blood(var/mob/living/carbon/human/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	var/drug_strength = 15
	if(alien == IS_SKRELL)
		drug_strength = drug_strength * 0.8

	M.druggy = max(M.druggy, drug_strength)
	if(prob(7))
		M.emote(pick("twitch", "drool", "moan", "giggle"))
	M.add_chemical_effect(CE_PULSE, -1)
	M.adjustBruteLoss(-0.5)
	M.add_event("high", /datum/happiness_event/high)
	//SUGAR CRACK PIE, GET ME HIGH

/datum/reagent/serotrotium
	name = "Serotrotium"
	description = "A chemical compound that promotes concentrated production of the serotonin neurotransmitter in humans."
	taste_description = "bitterness"
	reagent_state = REAGENT_LIQUID
	color = "#202040"
	metabolism = REM * 0.25
	overdose = REAGENTS_OVERDOSE

/datum/reagent/serotrotium/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(prob(7))
		M.emote(pick("twitch", "drool", "moan", "gasp"))
	return

/datum/reagent/cryptobiolin
	name = "Cryptobiolin"
	description = "Cryptobiolin causes confusion and dizzyness."
	taste_description = "sourness"
	reagent_state = REAGENT_LIQUID
	color = "#000055"
	metabolism = REM * 0.5
	overdose = REAGENTS_OVERDOSE

/datum/reagent/cryptobiolin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	var/drug_strength = 4
	if(alien == IS_SKRELL)
		drug_strength = drug_strength * 0.8
	M.make_dizzy(drug_strength)
	M.confused = max(M.confused, drug_strength * 5)

/datum/reagent/impedrezene
	name = "Impedrezene"
	description = "Impedrezene is a narcotic that impedes one's ability by slowing down the higher brain cell functions."
	taste_description = "numbness"
	reagent_state = REAGENT_LIQUID
	color = "#c8a5dc"
	overdose = REAGENTS_OVERDOSE

/datum/reagent/impedrezene/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.jitteriness = max(M.jitteriness - 5, 0)
	if(prob(80))
		M.adjustBrainLoss(0.1 * removed)
	if(prob(50))
		M.drowsyness = max(M.drowsyness, 3)
	if(prob(10))
		M.emote("drool")
	M.add_event("high", /datum/happiness_event/high)

/datum/reagent/mindbreaker
	name = "Mindbreaker Toxin"
	description = "A powerful hallucinogen, it can cause fatal effects in users."
	taste_description = "sourness"
	reagent_state = REAGENT_LIQUID
	color = "#b31008"
	metabolism = REM * 0.25
	overdose = REAGENTS_OVERDOSE

/datum/reagent/mindbreaker/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.add_chemical_effect(CE_MIND, -2)
	if(alien == IS_SKRELL)
		M.hallucination(25, 30)
	else
		M.hallucination(50, 50)

/datum/reagent/psilocybin
	name = "Psilocybin"
	description = "A strong psycotropic derived from certain species of mushroom."
	taste_description = "mushroom"
	color = "#e700e7"
	overdose = REAGENTS_OVERDOSE
	metabolism = REM * 0.5

/datum/reagent/psilocybin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	var/threshold = 1
	if(alien == IS_SKRELL)
		threshold = 1.2

	M.druggy = max(M.druggy, 30)

	if(M.chem_doses[type] < 1 * threshold)
		M.apply_effect(3, STUTTER)
		M.make_dizzy(5)
		if(prob(5))
			M.emote(pick("twitch", "giggle"))
	else if(M.chem_doses[type] < 2 * threshold)
		M.apply_effect(3, STUTTER)
		M.make_jittery(5)
		M.make_dizzy(5)
		M.druggy = max(M.druggy, 35)
		if(prob(10))
			M.emote(pick("twitch", "giggle"))
	else
		M.add_chemical_effect(CE_MIND, -1)
		M.apply_effect(3, STUTTER)
		M.make_jittery(10)
		M.make_dizzy(10)
		M.druggy = max(M.druggy, 40)
		if(prob(15))
			M.emote(pick("twitch", "giggle"))
	M.add_event("high", /datum/happiness_event/high)

/* Transformations */

/datum/reagent/slimetoxin
	name = "Mutation Toxin"
	description = "A corruptive toxin produced by slimes."
	taste_description = "sludge"
	reagent_state = REAGENT_LIQUID
	color = "#13bc5e"
	metabolism = REM * 0.2

/datum/reagent/slimetoxin/affect_blood(var/mob/living/carbon/human/H, var/alien, var/removed)
	if(!istype(H))
		return
	if(H.species.name == SPECIES_PROMETHEAN)
		return
	H.adjustToxLoss(40 * removed)
	if(H.chem_doses[type] < 1 || prob(30))
		return
	H.chem_doses[type] = 0
	var/list/meatchunks = list()
	for(var/limb_tag in list(BP_R_ARM, BP_L_ARM, BP_R_LEG,BP_L_LEG))
		var/obj/item/organ/external/E = H.get_organ(limb_tag)
		if(!E.is_stump() && E.robotic < ORGAN_ROBOT && E.species.name != SPECIES_PROMETHEAN)
			meatchunks += E
	if(!meatchunks.len)
		return
	var/obj/item/organ/external/O = pick(meatchunks)
	to_chat(H, "<span class='danger'>Your [O.name]'s flesh mutates rapidly!</span>")
	meatchunks = list(O) | O.children
	for(var/obj/item/organ/external/E in meatchunks)
		E.species = all_species[SPECIES_PROMETHEAN]
		E.s_tone = null
		E.s_col = ReadRGB("#05ff9b")
		E.s_col_blend = ICON_ADD
		E.status &= ~ORGAN_BROKEN
		E.status |= ORGAN_MUTATED
		E.cannot_break = 1
		E.dislocated = -1
		E.max_damage = 5
		E.update_icon(1)
	O.max_damage = 15
	if(prob(10))
		to_chat(H, "<span class='danger'>Your slimy [O.name]'s plops off!</span>")
		O.droplimb()
	H.update_body()

/datum/reagent/aslimetoxin
	name = "Advanced Mutation Toxin"
	description = "An advanced corruptive toxin produced by slimes."
	taste_description = "sludge"
	reagent_state = REAGENT_LIQUID
	color = "#13bc5e"

/datum/reagent/aslimetoxin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed) // TODO: check if there's similar code anywhere else
	if(M.transforming)
		return
	to_chat(M, "<span class='danger'>Your flesh rapidly mutates!</span>")
	M.transforming = 1
	M.canmove = 0
	M.icon = null
	M.overlays.Cut()
	M.set_invisibility(101)
	for(var/obj/item/W in M)
		if(istype(W, /obj/item/implant)) //TODO: Carn. give implants a dropped() or something
			qdel(W)
			continue
		M.drop_from_inventory(W)
	//var/mob/living/carbon/slime/new_mob = new /mob/living/carbon/slime(M.loc)
	var/new_mob	//find something you'd want someone to mutate into. Replace slime above and remove comments.
	//new_mob.a_intent = "hurt"
	//new_mob.universal_speak = 1
	if(M.mind)
		M.mind.transfer_to(new_mob)
	//else
		//new_mob.key = M.key
	qdel(M)

/datum/reagent/nanites
	name = "Nanomachines"
	description = "Microscopic construction robots."
	taste_description = "slimey metal"
	reagent_state = REAGENT_LIQUID
	color = "#535e66"

/datum/reagent/xenomicrobes
	name = "Xenomicrobes"
	description = "Microbes with an entirely alien cellular structure."
	taste_description = "sludge"
	reagent_state = REAGENT_LIQUID
	color = "#535e66"

/datum/reagent/toxin/hair_remover
	name = "Hair Remover"
	description = "An extremely effective chemical depilator. Do not ingest."
	taste_description = "acid"
	reagent_state = REAGENT_LIQUID
	color = "#d9ffb3"
	strength = 1
	overdose = REAGENTS_OVERDOSE

/datum/reagent/toxin/hair_remover/affect_touch(var/mob/living/carbon/human/M, var/alien, var/removed)
	if(alien == IS_SKRELL)	//skrell can't have hair unless you hack it in, also to prevent tentacles from falling off
		return
	M.species.set_default_hair(M)
	to_chat(M, "<span class='warning'>Your feel a chill, your skin feels lighter..</span>")
	remove_self(volume)

/datum/reagent/toxin/corrupting
	name = "Corruption"
	description = "a loyalty changing liquid."
	taste_description = "blood"
	color = "#669900"
	taste_mult = 5
	strength = 10
	metabolism = REM * 2
	overdose = 30

/datum/reagent/toxin/corrupting/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	affect_blood(M,alien,removed*0.5)

/datum/reagent/toxin/corrupting/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	..()
	if(prob(100))
		if(M.chem_doses[type] < 5)
			to_chat(M, "<span class='warning'>You feel funny...</span>")
		else
			to_chat(M, "<span class='danger'>You feel like you could die at any moment!</span>")
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		H.zombieze()
	M.adjustOxyLoss(3 * removed)
	M.Weaken(5)
	M.silent = max(M.silent, 10)
	remove_self(volume)


var/mob/living/carbon/human/next_gas_eye_message = -1
var/mob/living/carbon/human/next_gas_skin_message = -1
var/mob/living/carbon/human/next_gas_lung_message = -1
var/mob/living/carbon/human/next_gas_flesh_message = -1

/datum/reagent/proc/mask_check(var/mob/living/carbon/human/m)
	if (m && istype(m))
		if (m.wear_mask && istype(m.wear_mask, /obj/item/clothing/mask/gas))
			return TRUE
	return FALSE

/datum/reagent/proc/eye_damage(var/mob/living/carbon/human/m, var/severity = TRUE) // damage eyes
	if (mask_check(m)) return
	for (var/obj/item/clothing/C in m.get_equipped_items())
		if (C.body_parts_covered & EYES)
			return
	if (m && istype(m) && severity)
		var/base = ((rand(2,3)) * severity)
		if (base >= 2)
			if (world.time >= next_gas_eye_message)
				m << "<span class = 'danger'>The gas burns your eyes!</span>"
			next_gas_eye_message = world.time + 10
			if (m.stat != DEAD)
				m.emote("scream")
			m.Weaken(rand(2,3))
			m.eye_blurry = max(m.eye_blurry+2, FALSE)

/datum/reagent/proc/external_damage(var/mob/living/carbon/human/m, var/severity = TRUE) // damage skin
	if (m && istype(m) && severity)
		var/base = ((rand(2,3)) * severity)
		if (base >= 2)
			if (world.time >= next_gas_skin_message)
				m << "<span class = 'danger'>The gas burns your skin!</span>"
			next_gas_skin_message = world.time + 10
			if (prob(50))
				if (m.stat != DEAD)
					m.emote("scream")
		var/burnlist = "l_arm,r_arm,l_leg,r_leg,l_hand,r_hand,feet,chest,groin,head,"
		for (var/obj/item/clothing/C in m.get_equipped_items())
			if (C.permeability_coefficient == TRUE || !C.body_parts_covered)
				continue
			if (C.body_parts_covered & HEAD)
				burnlist = replacetext(burnlist,"head,","")
			if (C.body_parts_covered & UPPER_TORSO)
				burnlist = replacetext(burnlist,"chest,","")
			if (C.body_parts_covered & LOWER_TORSO)
				burnlist = replacetext(burnlist,"groin,","")
			if (C.body_parts_covered & LEGS)
				burnlist = replacetext(burnlist,"legs,","")
			if (C.body_parts_covered & FEET)
				burnlist = replacetext(burnlist,"feet,","")
			if (C.body_parts_covered & ARMS)
				burnlist = replacetext(burnlist,"arms,","")
			if (C.body_parts_covered & HANDS)
				burnlist = replacetext(burnlist,"hands,","")
		/*var/list/burnparts = splittext(burnlist, ",")
	world.log << "[burnparts]"*/

/datum/reagent/proc/internal_damage(var/mob/living/carbon/human/m, var/severity = TRUE) // damage things like lungs
	if (mask_check(m)) return
	if (m && istype(m) && severity)
		var/base = ((rand(2,3)) * severity)
		if (base >= 2)
			if (world.time >= next_gas_lung_message)
				m << "<span class = 'danger'>The gas burns your lungs!</span>"
			next_gas_lung_message = world.time + 10
			if (m.stat != DEAD)
				m.emote("scream")
			if (prob(70))
				m.Weaken(rand(3,4))

/datum/reagent/proc/suffocation(var/mob/living/carbon/human/m, var/severity = TRUE)
	if (mask_check(m)) return
	if (m && istype(m) && severity)
		var/base = ((rand(2,3)) * severity)
		if (base >= 2)
			if (world.time >= next_gas_lung_message)
				m << "<span class = 'danger'>You can't breathe!</span>"
			next_gas_lung_message = world.time + 10
			if (m.stat != DEAD)
				m.emote("gasp")
			m.adjustOxyLoss(base)


/datum/reagent/proc/open_wound_damage(var/mob/living/carbon/human/m, var/severity = TRUE) // damage wounded skin
	if (m && istype(m) && severity)
		var/base = ((m.getBruteLoss() + m.getFireLoss())/10) * severity
		base += rand(1,2)
		base /= 2
		if (base >= 1)
			if (world.time >= next_gas_flesh_message)
				m << "<span class = 'danger'>The gas burns the flesh on your open wounds!</span>"
			next_gas_flesh_message = world.time + 10
			if (prob(50))
				if (m.stat != DEAD)
					m.emote("scream")
			m.adjustFireLoss(base)

/*/proc/get_severity(var/amount)
	switch (amount)
		if (0)
			return FALSE
		if (1 to 5)
			return TRUE
		if (6 to 10)
			return 2
		if (11 to INFINITY)
			return 3*/
//blue cross
/datum/reagent/toxin/xylyl_bromide
	name = "Xylyl Bromide"
	//id = "xylyl_bromide"
	description = "A lacrimant. Won't kill you but will make you cry a lot."
	taste_mult = 1.5
	reagent_state = GAS
	color = "#ffd700"
	strength = 30
	touch_met = 5
//	alpha = 51
//	meltdose = 4

/datum/reagent/toxin/xylyl_bromide/touch_mob(var/mob/living/L, var/amount)
	if (istype(L))
		if (mask_check(L)) return
		L.eye_blurry += (amount/10)
		L.Weaken(10)
		if (prob(10))
			L.emote("cough")


/datum/reagent/toxin/mustard_gas
	name = "Mustard Gas"
	//id = "mustard_gas"
	description = "A deadly gas that causes burns inside and out."
	reagent_state = GAS
	color = "#A2CD5A"
	strength = 10
	touch_met = 5
//	meltdose = 4

/datum/reagent/toxin/mustard_gas/touch_mob(var/mob/living/L, var/amount)
	if (istype(L))
		eye_damage(L, get_severity(amount))
		external_damage(L, get_severity(amount))
		internal_damage(L, get_severity(amount))
		open_wound_damage(L, get_severity(amount))
/datum/reagent/toxin/mustard_gas/white_phosphorus
	name = "White Phosphorus Gas"
	//id = "white_phosphorus_gas"
	description = "A deadly white gas that burns you up like a torch."
	reagent_state = GAS
	color = "#FFFFFF"
	strength = 5
	touch_met = 5
	var/meltdose = 4

/datum/reagent/toxin/white_phosphorus/touch_mob(var/mob/living/L, var/amount)
	if (istype(L))
		eye_damage(L, get_severity(amount)*3)
		external_damage(L, get_severity(amount)*3)
		open_wound_damage(L, get_severity(amount)*3)
//green cross
/datum/reagent/toxin/chlorine_gas
	name = "Chlorine Gas"
	//id = "chlorine_gas"
	description = "A deadly gas that destroys your lungs."
	reagent_state = GAS
	color = "#ffd700"
	strength = 10
	touch_met = 5
//	alpha = 128
//	meltdose = 4

/datum/reagent/toxin/chlorine_gas/touch_mob(var/mob/living/L, var/amount)
	if (istype(L))
		eye_damage(L, get_severity(amount/1))
		open_wound_damage(L, get_severity(amount)*1)

/datum/reagent/toxin/phosgene_gas
	name = "Phosgene Gas"
	//id = "phosgene_gas"
	description = "A deadly gas that causes suffocation."
	reagent_state = GAS
	color = "#eaeaea"
	strength = 10
	touch_met = 5
//	alpha = 25
/datum/reagent/toxin/phosgene_gas/touch_mob(var/mob/living/L, var/amount)
	if (istype(L))
		suffocation(L, get_severity(amount)*1)
