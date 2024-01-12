/// @description Tower Parent

/*
	This is the parent object of the two towers.
	Some of these variables will be overwritten 
	in the child objects.
*/

// Inherit the parent event
event_inherited();

// This variable holds the cost of the tower
cost = 2;

// This variable holds the starting level of the tower
level = 0;

// This variable holds the max level of the tower
max_level = 3;

// This variable holds the tower's range
range = 100;

// Play a random tower build sound
audio_play_sound(choose(snd_tower_build_01, snd_tower_build_02), 1, false);


