#pragma once

// Home row mods settings //

// Default tapping term is 200
#define TAPPING_TERM 170
#define TAPPING_TERM_PER_KEY // See bottom of keymap.c

// This prevents accidental repeats of the tap-hold keys when typing quickly.
#define QUICK_TAP_TERM_PER_KEY

// Disable PERMISSIVE_HOLD
// (It's enabled dy default for all Dactyl Manuform boards,
// so it requires explicit undef to disable)
#undef PERMISSIVE_HOLD

// Other settings //
#define HOLD_ON_OTHER_KEY_PRESS_PER_KEY

#define COMBO_TERM 70

// Limits the max. amount of layers to 8 to save firmware memory.
#define LAYER_STATE_8BIT

// Save firmware space
//
// Strip away all prints except `uprintf`
#define USER_PRINT
// Disable hardware lock switches support to free up space
#undef LOCKING_SUPPORT_ENABLE
#undef LOCKING_RESYNC_ENABLE
