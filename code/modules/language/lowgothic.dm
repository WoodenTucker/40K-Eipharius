/datum/language/lowgothic
    name = "Low Gothic"
    desc = "A vulgar form of gothic that is readily used by the lower classes in the Imperium and understood by most"
    speech_verb = "says"
    whisper_verb = "whispers"
    key = "l"
    flags = RESTRICTED
    syllables = list("al","an","ar","as","at","ea","ed","en","er","es","ha","he","hi","in","is","it","le","me","nd","ne","ng","nt","on","or","ou","re","se","st","te","th","ti","to","ve","wa","all","and","are","but","ent","era","ere","eve","for","had","hat","hen","her","hin","his","ing","ion","ith","not","ome","oul","our","sho","ted","ter","tha","the","thi"," tio","uld","ver","was","wit","you")

/datum/language/lowgothic/get_spoken_verb(var/msg_end)
	switch(msg_end)
		if("!")
			return pick("exclaims", "shouts", "yells") //TODO: make the basic proc handle lists of verbs.
		if("?")
			return ask_verb
		if("+")
			return whisper_verb
	return speech_verb
