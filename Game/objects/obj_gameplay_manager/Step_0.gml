/// @description Gameplay Manager

// This is how we animate the village hp text in the HUD
// If village_flash_alpha is greater than zero
if (village_flash_alpha > 0)
{
	// Reduce the village_flash_alpha
	village_flash_alpha -= 0.03;
}

// This is how we animate the money text in the HUD
// If money_flash_alpha is greater than zero
if (money_flash_alpha > 0)
{
	// Reduce the money_flash_alpha
	money_flash_alpha -= 0.03;
}

// Check if the game is over, and if so, exit this event
if (game_over) exit;

// Check if the village's hp is less than zero
if (get_village_hp() <= 0) 
{
	// Use the custom game over function to turn off variables
	set_game_over();	
	
	// Create the game lost popup using a sequence
	layer_sequence_create("Sequences", 0, 0, seq_popup_game_lost);
	
	// Play the game over music
	audio_play_sound(snd_music_lose, 1, false);

} 
else if ((waves_are_over()) && (!instance_exists(obj_enemy_parent))) 
{
	// Use the custom game over function to turn off variables
	set_game_over();
	
	// Create the game won popup using a sequence
	layer_sequence_create("Sequences", 0, 0, seq_popup_game_won);
	
	// Play the game over music
	audio_play_sound(snd_music_win, 1, false);
}

