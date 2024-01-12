/// @description Frankenstein Defeat Side

// Inherit the parent event
event_inherited();

// Play a random death sound
audio_play_sound(choose(snd_frankenstein_death_01, snd_frankenstein_death_02, snd_frankenstein_death_03), 4, false);