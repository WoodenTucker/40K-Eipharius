#if !defined(using_map_DATUM)
	#include "warhammer_areas.dm"
	#include "warhammer_unit_testing.dm"
	#include "jobs/warhammer_jobs.dm"
	#include "../shared/items/clothing.dm"
	#include "../shared/items/cards_ids.dm"

	#include "warhammer-1.dmm"
	#include "warhammer-2.dmm"
	#include "warhammer-3.dmm"
	#include "warhammer-4.dmm"
	#include "warhammer-5.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define using_map_DATUM /datum/map/warhammer

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Example

#endif
