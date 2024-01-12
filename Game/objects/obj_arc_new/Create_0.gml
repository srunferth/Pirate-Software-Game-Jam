/// @description Arc New

// This variable stores the instance id of its target
target = noone;

// This variable stores how many more times the arc can chain to a new enemy
chains_remaining = 0;

// This variable stores the instance ids of enemies the arc has already hit
// so that it doesn't hit them again
targets_hit_array = [];

// This variable says whether or not the arc has already chained
chained = false;

// These variables stores the target's x, y, and depth
target_x = x;
target_y = y;
target_depth = depth;

// Play a random arc attack sound
audio_play_sound(choose(snd_attack_arc_01, snd_attack_arc_02, snd_attack_arc_03), 10, false);

