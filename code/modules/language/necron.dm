/datum/language/necon
    name = "Necron"
    desc = "The ancient language of the Necrons, it is incomprehensible to anyone in the Imperium"
    speech_verb = "says"
    whisper_verb = "whispers"
    key = "n"
    flags = NO_STUTTER | RESTRICTED
    syllables = list("SOI","SOI","SOI","SOI","SOI","SOI","SOI","SOI","SOI","SOI","SOI",)


/*

If we go forward with this. I will change this to something more appropriate
/datum/language/xenos/check_special_condition(var/mob/other)

	var/mob/living/carbon/M = other
	if(!istype(M))
		return 1
	if(locate(/obj/item/organ/internal/xenos/hivenode) in M.internal_organs)
		return 1

	return 0

*/

