/// @description Level Up

/*
	This is the generic level up function as a user event.
	It should be inherited and modified by the child towers.
*/

// Create the Upgrade Sequence at the appropriate location
layer_sequence_create("Sequences", x + 70, (y - 150) + (level * 36), seq_tower_upgrade);

// Increase the level
level += 1;

// Choose a random tower upgrade sound to play
audio_play_sound(choose(snd_tower_upgrade_01, snd_tower_upgrade_02), 1, false);