// Some various defines used in the heretic sacrifice map.

/// A global assoc list of all landmarks that denote a heretic sacrifice location. [string heretic path] = [landmark].
GLOBAL_LIST_EMPTY(heretic_sacrifice_landmarks)

/// Lardmarks meant to designate where heretic sacrifices are sent.
/obj/effect/landmark/heretic
	name = "default heretic sacrifice landmark"
	icon_state = "x"
	/// What path this landmark is intended for.
	var/for_heretic_path = PATH_START

/obj/effect/landmark/heretic/Initialize(mapload)
	. = ..()
	GLOB.heretic_sacrifice_landmarks[for_heretic_path] = src

/obj/effect/landmark/heretic/Destroy()
	GLOB.heretic_sacrifice_landmarks[for_heretic_path] = null
	return ..()

/obj/effect/landmark/heretic/ash
	name = "ash heretic sacrifice landmark"
	for_heretic_path = PATH_ASH

/obj/effect/landmark/heretic/flesh
	name = "flesh heretic sacrifice landmark"
	for_heretic_path = PATH_FLESH

/obj/effect/landmark/heretic/void
	name = "void heretic sacrifice landmark"
	for_heretic_path = PATH_VOID

/obj/effect/landmark/heretic/rust
	name = "rust heretic sacrifice landmark"
	for_heretic_path = PATH_RUST

/obj/effect/landmark/heretic/lock
	name = "lock heretic sacrifice landmark"
	for_heretic_path = PATH_LOCK

// A fluff signpost object that doesn't teleport you somewhere when you touch it.
/obj/structure/no_effect_signpost
	name = "signpost"
	desc = "Won't somebody give me a sign?"
	icon = 'icons/obj/fluff/general.dmi'
	icon_state = "signpost"
	anchored = TRUE
	density = TRUE

/obj/structure/no_effect_signpost/void
	name = "signpost at the edge of the universe"
	desc = "A direction in the directionless void."
	density = FALSE
	/// Brightness of the signpost.
	var/range = 2
	/// Light power of the signpost.
	var/power = 0.8

/obj/structure/no_effect_signpost/void/Initialize(mapload)
	. = ..()
	set_light(range, power)

// Some VERY dim lights, used for the void sacrifice realm.
/obj/machinery/light/very_dim
	nightshift_allowed = FALSE
	bulb_colour = "#d6b6a6ff"
	brightness = 3
	fire_brightness = 3.5
	bulb_power = 0.5

WALL_MOUNT_DIRECTIONAL_HELPERS(/obj/machinery/light/very_dim)

// Rooms for where heretic sacrifices send people.
/area/centcom/heretic_sacrifice
	name = "Mansus"
	icon_state = "heretic"
	has_gravity = STANDARD_GRAVITY
	ambience_index = AMBIENCE_SPOOKY
	sound_environment = SOUND_ENVIRONMENT_CAVE
	area_flags = UNIQUE_AREA | NOTELEPORT | HIDDEN_AREA | BLOCK_SUICIDE | NO_BOH

/area/centcom/heretic_sacrifice/Initialize(mapload)
	if(!ambientsounds)
		ambientsounds = GLOB.ambience_assoc[ambience_index]
		ambientsounds += 'sound/ambience/ambiatm1.ogg'
	return ..()

/area/centcom/heretic_sacrifice/ash //also, the default
	name = "Mansus Ash Gate"

/area/centcom/heretic_sacrifice/void
	name = "Mansus Void Gate"
	sound_environment = SOUND_ENVIRONMENT_UNDERWATER

/area/centcom/heretic_sacrifice/flesh
	name = "Mansus Flesh Gate"
	sound_environment = SOUND_ENVIRONMENT_STONEROOM

/area/centcom/heretic_sacrifice/rust
	name = "Mansus Rust Gate"
	ambience_index = AMBIENCE_REEBE
	sound_environment = SOUND_ENVIRONMENT_SEWER_PIPE

/area/centcom/heretic_sacrifice/lock
	name = "Mansus Lock Gate"
	ambience_index = AMBIENCE_DANGER
	sound_environment = SOUND_ENVIRONMENT_PSYCHOTIC
