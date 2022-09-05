GLOBAL_LIST_INIT(borer_reagent_types_by_name, setup_borer_reagents())

/proc/setup_borer_reagents()
	. = list()
	for(var/reagent_type in list(/datum/reagent/alkysine, /datum/reagent/bicaridine, /datum/reagent/hyperzine, /datum/reagent/tramadol))
		var/datum/reagent/R = reagent_type
		.[initial(R.name)] = reagent_type

/mob/living/simple_animal/borer/verb/release_host()
	set category = "Abilities"
	set name = "Release Host"
	set desc = "Slither out of your host."

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(stat)
		to_chat(src, "You cannot leave your host in your current state.")

	if(docile)
		to_chat(src, "<span class='notice'>You are feeling far too docile to do that.</span>")
		return

	if(!host || !src) return

	to_chat(src, "You begin disconnecting from [host]'s synapses and prodding at their internal ear canal.")

	if(!host.stat)
		to_chat(host, "An odd, uncomfortable pressure begins to build inside your skull, behind your ear...")

	spawn(100)

		if(!host || !src) return

		if(src.stat)
			to_chat(src, "You cannot release your host in your current state.")
			return

		to_chat(src, "You wiggle out of [host]'s ear and plop to the ground.")
		if(host.mind)
			if(!host.stat)
				to_chat(host, "<span class='danger'>Something slimy wiggles out of your ear and plops to the ground!</span>")
			to_chat(host, "<span class='danger'>As though waking from a dream, you shake off the insidious mind control of the brain worm. Your thoughts are your own again.</span>")

		detatch()
		leave_host()

/mob/living/simple_animal/borer/verb/infest()
	set category = "Abilities"
	set name = "Infest"
	set desc = "Infest a suitable humanoid host."

	if(host)
		to_chat(src, "You are already within a host.")
		return

	if(stat)
		to_chat(src, "You cannot infest a target in your current state.")
		return

	var/list/choices = list()
	for(var/mob/living/carbon/C in view(1,src))
		if(src.Adjacent(C))
			choices += C

	if(!choices.len)
		to_chat(src, "There are no viable hosts within range...")
		return

	var/mob/living/carbon/M = input(src,"Who do you wish to infest?") in null|choices

	if(!M || !src) return

	if(!(src.Adjacent(M))) return

	if(M.has_brain_worms())
		to_chat(src, "You cannot infest someone who is already infested!")
		return

	if(istype(M,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = M

		var/obj/item/organ/external/E = H.organs_by_name[BP_HEAD]
		if(!E || E.is_stump())
			to_chat(src, "\The [H] does not have a head!")

		if(!H.should_have_organ(BP_BRAIN))
			to_chat(src, "\The [H] does not seem to have an ear canal to breach.")
			return

		if(H.check_head_coverage())
			to_chat(src, "You cannot get through that host's protective gear.")
			return

	to_chat(M, "Something slimy begins probing at the opening of your ear canal...")
	to_chat(src, "You slither up [M] and begin probing at their ear canal...")

	if(!do_after(src,30, progress = 0))
		to_chat(src, "As [M] moves away, you are dislodged and fall to the ground.")
		return

	if(!M || !src) return

	if(src.stat)
		to_chat(src, "You cannot infest a target in your current state.")
		return

	if(M in view(1, src))
		to_chat(src, "You wiggle into [M]'s ear.")
		if(!M.stat)
			to_chat(M, "Something disgusting and slimy wiggles into your ear!")

		src.host = M
		src.host.status_flags |= PASSEMOTES
		src.loc = M

		//Update their heretic status.
		if(host.mind)
			borers.add_antagonist_mind(host.mind, 1, borers.faction_role_text, borers.faction_welcome)

		if(istype(M,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			var/obj/item/organ/I = H.internal_organs_by_name[BP_BRAIN]
			if(!I) // No brain organ, so the borer moves in and replaces it permanently.
				replace_brain()
			else
				// If they're in normally, implant removal can get them out.
				var/obj/item/organ/external/head = H.get_organ(BP_HEAD)
				head.implants += src

		return
	else
		to_chat(src, "They are no longer in range!")
		return

/*
/mob/living/simple_animal/borer/verb/devour_brain()
	set category = "Abilities"
	set name = "Devour Brain"
	set desc = "Take permanent control of a dead host."

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(host.stat != 2)
		to_chat(src, "Your host is still alive.")
		return

	if(stat)
		to_chat(src, "You cannot do that in your current state.")

	if(docile)
		to_chat(src, "<span class='notice'>You are feeling far too docile to do that.</span>")
		return


	to_chat(src, "<span class = 'danger'>It only takes a few moments to render the dead host brain down into a nutrient-rich slurry...</span>")
	replace_brain()
*/

// BRAIN WORM ZOMBIES AAAAH.
/mob/living/simple_animal/borer/proc/replace_brain()

	var/mob/living/carbon/human/H = host

	if(!istype(host))
		to_chat(src, "This host does not have a suitable brain.")
		return

	to_chat(src, "<span class = 'danger'>You settle into the empty brainpan and begin to expand, fusing inextricably with the dead flesh of [H].</span>")

	H.add_language("Cortical Link")

	if(host.stat == 2)
		add_verb(H, /mob/living/carbon/human/proc/jumpstart)

	add_verb(H, /mob/living/carbon/human/proc/psychic_whisper)
	add_verb(H, /mob/living/carbon/human/proc/tackle)
	add_verb(H, /mob/living/carbon/proc/spawn_larvae)
	// Remove the usual "host control" abilities
	remove_verb(H, list(abilities_in_control))

	add_verb(H, /mob/living/carbon/human/proc/commune)
	add_verb(H, /mob/living/carbon/human/proc/psychic_whisper)
	add_verb(H, /mob/living/carbon/proc/spawn_larvae)
	add_verb(H, /mob/living/carbon/proc/talk_host)

	if(H.client)
		H.ghostize(0)

	if(src.mind)
		src.mind.special_role = "Borer Husk"
		src.mind.transfer_to(host)

	H.ChangeToHusk()

	var/obj/item/organ/internal/borer/B = new(H)
	H.internal_organs_by_name[BP_BRAIN] = B
	H.internal_organs |= B

	var/obj/item/organ/external/affecting = H.get_organ(BP_HEAD)
	affecting.implants -= src

	var/s2h_id = src.computer_id
	var/s2h_ip= src.lastKnownIP
	src.computer_id = null
	src.lastKnownIP = null

	if(!H.computer_id)
		H.computer_id = s2h_id

	if(!H.lastKnownIP)
		H.lastKnownIP = s2h_ip

/mob/living/simple_animal/borer/verb/secrete_chemicals()
	set category = "Abilities"
	set name = "Secrete Chemicals"
	set desc = "Push some chemicals into your host's bloodstream."

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(stat)
		to_chat(src, "You cannot secrete chemicals in your current state.")

	if(docile)
		to_chat(src, "<span class='notice'>You are feeling far too docile to do that.</span>")
		return

	if(chemicals < 50)
		to_chat(src, "You don't have enough chemicals!")

	var/chem = input("Select a chemical to secrete.", "Chemicals") as null|anything in GLOB.borer_reagent_types_by_name

	if(!chem || chemicals < 50 || !host || controlling || !src || stat) //Sanity check.
		return

	to_chat(src, "<span class='danger'>You squirt a measure of [chem] from your reservoirs into \the [host]'s bloodstream.</span>")
	host.reagents.add_reagent(GLOB.borer_reagent_types_by_name[chem], 10)
	chemicals -= 50

/mob/living/simple_animal/borer/verb/dominate_victim()
	set category = "Abilities"
	set name = "Paralyze Victim"
	set desc = "Freeze the limbs of a potential host with supernatural fear."

	if(world.time - used_dominate < 150)
		to_chat(src, "You cannot use that ability again so soon.")
		return

	if(host)
		to_chat(src, "You cannot do that from within a host body.")
		return

	if(src.stat)
		to_chat(src, "You cannot do that in your current state.")
		return

	var/list/choices = list()
	for(var/mob/living/carbon/C in view(3,src))
		if(C.stat != 2)
			choices += C

	if(world.time - used_dominate < 150)
		to_chat(src, "You cannot use that ability again so soon.")
		return

	var/mob/living/carbon/M = input(src,"Who do you wish to dominate?") in null|choices

	if(!M || !src) return

	if(M.has_brain_worms())
		to_chat(src, "You cannot infest someone who is already infested!")
		return

	to_chat(src, "<span class='warning'>You focus your psychic lance on [M] and freeze their limbs with a wave of terrible dread.</span>")
	to_chat(M, "<span class='wanring'>You feel a creeping, horrible sense of dread come over you, freezing your limbs and setting your heart racing.</span>")
	M.Weaken(10)

	used_dominate = world.time

/mob/living/simple_animal/borer/verb/bond_brain()
	set category = "Abilities"
	set name = "Assume Control"
	set desc = "Fully connect to the brain of your host."

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(src.stat)
		to_chat(src, "You cannot do that in your current state.")
		return

	if(docile)
		to_chat(src, "<span class='notice'>You are feeling far too docile to do that.</span>")
		return

	to_chat(src, "You begin delicately adjusting your connection to the host brain...")

	spawn(100+(host.getBrainLoss()*5))

		if(!host || !src || controlling)
			return
		else

			to_chat(src, "<span class='danger'>You plunge your probosci deep into the cortex of the host brain, interfacing directly with their nervous system.</span>")
			to_chat(host, "<span class='danger'>You feel a strange shifting sensation behind your eyes as an alien consciousness displaces yours.</span>")
			host.add_language("Cortical Link")

			// host -> brain
			var/h2b_id = host.computer_id
			var/h2b_ip= host.lastKnownIP
			host.computer_id = null
			host.lastKnownIP = null

			qdel(host_brain)
			host_brain = new(src)

			host_brain.ckey = host.ckey

			host_brain.SetName(host.name)

			if(!host_brain.computer_id)
				host_brain.computer_id = h2b_id

			if(!host_brain.lastKnownIP)
				host_brain.lastKnownIP = h2b_ip

			// self -> host
			var/s2h_id = src.computer_id
			var/s2h_ip= src.lastKnownIP
			src.computer_id = null
			src.lastKnownIP = null

			host.ckey = src.ckey

			if(!host.computer_id)
				host.computer_id = s2h_id

			if(!host.lastKnownIP)
				host.lastKnownIP = s2h_ip

			controlling = 1

			add_verb(host, /mob/living/carbon/proc/release_control)
			add_verb(host, /mob/living/carbon/proc/punish_host)
			add_verb(host, /mob/living/carbon/proc/spawn_larvae)
			controlling = TRUE

			return

/mob/living/carbon/human/proc/jumpstart()
	set category = "Abilities"
	set name = "Revive Host"
	set desc = "Send a jolt of electricity through your host, reviving them."

	if(stat != 2)
		to_chat(usr, "Your host is already alive.")
		return

	remove_verb(src, /mob/living/carbon/human/proc/jumpstart)
	visible_message("<span class='warning'>With a hideous, rattling moan, [src] shudders back to life!</span>")
	if(chemicals < 500)
		to_chat(src, SPAN_WARNING("You don't have enough chemicals!"))
		return

	if(host.getBrainLoss() >= 200)
		to_chat(src, SPAN_WARNING("Host is brain dead!"))
		return

	visible_message(SPAN_WARNING("With a hideous, rattling moan, [src] shudders back to life!"))


	var/all_damage = host.getBruteLoss() + host.getFireLoss() + host.getCloneLoss() + host.getOxyLoss() + host.getToxLoss()
	while(all_damage > 90)
		host.adjustBruteLoss(-10)
		host.adjustFireLoss(-10)
		host.adjustCloneLoss(-10)
		host.adjustOxyLoss(-10)
		host.adjustToxLoss(-10)
		all_damage = host.getBruteLoss() + host.getFireLoss() + host.getCloneLoss() + host.getOxyLoss() + host.getToxLoss()

	host.stat = UNCONSCIOUS
	host.updatehealth()
	host.make_jittery(100)
	host.Stun(10)
	host.Weaken(10)
	host.Paralyse(10)
	host.restore_blood()
	host.fixblood()
	chemicals -= 500

/mob/living/simple_animal/borer/proc/read_mind()
	set category = "Abilities"
	set name = "Read Mind"
	set desc = "Extract information, languages and skills out of host's brain. May cause confusion and brain damage."

	if(stat)
		return

	if(!host)
		to_chat(src, SPAN_WARNING("You are not inside a host body."))
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return


	var/list/copied_languages = list()
	for(var/datum/language/L in host.languages)
		if(!(L.flags & HIVEMIND) && !can_speak(L))
			add_language(L.name)
			copied_languages += L.name

	if(host.mind)
		host.mind.show_memory(src)

	var/copied_amount =  length(copied_languages)
	if(copied_amount)
		borer_add_exp((copied_amount*5))

		if(length(copied_languages))
			to_chat(src, SPAN_NOTICE("You learned [english_list(copied_languages)]."))

		to_chat(host, SPAN_DANGER("Your head spins, your memories thrown in disarray!"))
		host.adjustBrainLoss(copied_amount * 4)

		host.make_dizzy(copied_amount * 4)
		host.confused = max(host.confused, copied_amount * 4)


/mob/living/simple_animal/borer/proc/write_mind()
	set category = "Abilities"
	set name = "Write Mind"
	set desc = "Write known skills and languages to host's brain. May cause confusion and brain damage."

	if(stat)
		return

	if(!host)
		to_chat(src, SPAN_WARNING("You are not inside a host body."))
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	var/list/copied_languages = list()
	for(var/datum/language/L in languages)
		if(!(L.flags & HIVEMIND) && !host.can_speak(L))
			host.add_language(L.name)
			copied_languages += L.name


	var/copied_amount =  length(copied_languages)
	if(copied_amount)

		if(length(copied_languages))
			to_chat(src, SPAN_NOTICE("You teach your host [english_list(copied_languages)]."))

		to_chat(host, SPAN_DANGER("Your head spins as new information fills your mind!"))
		host.adjustBrainLoss(copied_amount * 2)

		host.make_dizzy(copied_amount * 2)
		host.confused = max(host.confused, copied_amount * 2)

/mob/living/simple_animal/borer/proc/say_host()
	set category = "Abilities"
	set name = "Say as Host"
	set desc = "Say something as host."

	if(stat)
		return

	if(!host)
		to_chat(src, "\red <B>You cannot do this without a host.</B>")
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	if(!host || !src) return

	var/message = input("", "say (text)") as text
	host.say(message)

/mob/living/simple_animal/borer/proc/whisper_host()
	set category = "Abilities"
	set name = "Whisper as Host"
	set desc = "Whisper something as host."

	if(stat)
		return

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	if(!host || !src) return

	var/message = input("", "whisper (text)") as text
	host.whisper(message)

/mob/living/simple_animal/borer/proc/invisible()
	set category = "Abilities"
	set name = "Invisibility"
	set desc = "Become invisible for living being."

	if(src.stat)
		return

	if(world.time - used_dominate < 150)
		to_chat(src, "\red <B>You cannot use that ability again so soon.</B>")
		return

	if(host)
		to_chat(src, "\red <B>You cannot do this inside a host.</B>")
		return

	if(invisibility)
		src.invisibility = 0
		src.alpha = 255
		used_dominate = world.time
		to_chat(src, SPAN_NOTICE("You become visible again."))
		return
	else
		src.invisibility = 26
		src.alpha = 100
		to_chat(src, SPAN_NOTICE("You become invisible for living being."))
		return

/mob/living/simple_animal/borer/proc/biograde()
	set category = "Abilities"
	set name = "Biograde Vision"
	set desc = "Make you see living being throug walls."

	if(src.stat)
		return

	if(host)
		to_chat(src, "\red <B>You cannot do this inside a host.</B>")
		return

	if(sight & SEE_MOBS)
		sight &= ~SEE_MOBS
		to_chat(src, SPAN_NOTICE("You cannot see living being throug walls for now."))
		return
	else
		sight |= SEE_MOBS
		to_chat(src, SPAN_NOTICE("You can now sen living being throug walls."))
		return

/mob/living/simple_animal/borer/proc/reproduce()
	set category = "Abilities"
	set name = "Reproduce"
	set desc = "Spawn several young."

	if(src.stat)
		return

	if(!host)
		to_chat(src, "\red <B>You cannot do this without a host.</B>")
		return

	if(chemicals >= 100)
		to_chat(host, "\red <B>Your host twitches and quivers as you rapidly excrete a larva from your sluglike body.</B>")
		visible_message("\red <B>[host.name] heaves violently, expelling a rush of vomit and a wriggling, sluglike creature!</B>")
		chemicals -= 100
		has_reproduced = 1
		borer_add_exp(10)

		new /obj/effect/decal/cleanable/vomit(get_turf(host))
		playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		new /mob/living/simple_animal/borer(get_turf(host))

	else
		to_chat(src, SPAN_NOTICE("You do not have enough chemicals stored to reproduce."))
		return

/mob/living/simple_animal/borer/proc/commune()
	set category = "Abilities"
	set name = "Commune with humans"
	set desc = "Send a telepathic message to an unlucky recipient."

	var/list/targets = list()
	var/target = null
	var/text = null

	for(var/mob/living/carbon/H in oview())
		if(H == host || H.stat == DEAD)
			continue

		targets += H //Fill list, prompt user with list
	target = input("Select a creature!", "Speak to creature", null, null) as null|anything in targets

	if(!target) return

	text = input("What would you like to say?", "Speak to human", null, null)

	text = capitalize(sanitize(text))

	if(!text) return

	var/mob/M = targets[target]

	if(isghost(M) || M.stat == DEAD)
		to_chat(src, "Not even you can speak to the dead.")
		return

	log_say("[key_name(src)] communed to [key_name(M)]: [text]")

	to_chat(M, "\blue Like lead slabs crashing into the ocean, alien thoughts drop into your mind: [text]")
	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		to_chat(H, SPAN_WARNING("Your nose begins to bleed..."))


/mob/living/carbon/proc/talk_host()
	set category = "Abilities"
	set name = "Talk to captive host"
	set desc = "Talk to your captive host."

	var/mob/living/simple_animal/borer/B = has_brain_worms()
	var/text = null

	if(!B)
		return

	if(B.host_brain.ckey)
		text = input("What would you like to say?", "Speak to captive host", null, null)
		text = capitalize(sanitize(text))
		if(!text)
			return
		log_say("Borer said to its host [text]")
		to_chat(src, "You say to your host: [text]")
		to_chat(B.host_brain, "YOU say to yourself: [text]")
