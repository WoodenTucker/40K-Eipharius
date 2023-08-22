/mob/proc/defaultRitualFail(var/mob/ritual_leader)
	to_chat(ritual_leader, "Nothing happens!")

/proc/preservationFail(var/mob/ritual_leader)
	var/i
	for(i=1,i<=ritual_leader.active_ritual.ritualists.len,i++)
		var/mob/living/carbon/human/ritualist = ritual_leader.active_ritual.ritualists[i]
		to_chat(ritualist, "<span class='flick-holy'>+ I can't feel Him... +</span>")
		ritualist.happiness -= 1

/mob/proc/invokeFail(var/mob/ritual_leader)
	for(var/mob/living/carbon/M in view(6, ritual_leader))
		if(/datum/reagent/water/holywater in M.chem_doses)
			if(M.faction == "Chaos")
				M.my_stats[1].level +=3
				M.my_stats[2].level +=2
				M.my_stats[3].level +=1 //failing on an actual cultist is going to be bad, you're just gunna piss them off.
			else
				M.adjustToxLoss(10)
				M.adjustBrainLoss(10) //adds some damage to the innocent upon failure