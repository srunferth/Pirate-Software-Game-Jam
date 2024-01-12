/// @description Zombie Defeat Down


// Inherit the parent event
event_inherited();

// Play a random death sound
audio_play_sound(choose(snd_death_zombie_01, snd_death_zombie_02, snd_death_zombie_03), 4, false);