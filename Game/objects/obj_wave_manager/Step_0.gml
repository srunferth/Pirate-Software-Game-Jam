/// @description Wave Manager


// This is how we animate the wave number text in the HUD
// If wave_flash_alpha is greater than zero
if (wave_flash_alpha > 0)
{
	// Reduce the wave_flash alpha
	wave_flash_alpha -= 0.03;
}

// This checks if the wave is running. If this is false, it means
// that the game is between waves or the waves have ended.
if (wave_running) 
{
	// If position is greater or equal to the length of the enemy_array, 
	// then we have spawned all the enemies for that wave.
	if (position >= array_length(current_wave_struct.enemy_array)) 
	{
		// This checks whether all enemies have been destroyed
		if (!instance_exists(obj_enemy_parent)) 
		{
			// Set wave running to false since the wave is over
			wave_running = false;
			
			// Increase the wave number
			wave += 1;
			
			// Set the wave_flash_alpha to 1 so it will animate
			wave_flash_alpha = 1;
			
			// Check if there are any additional waves using wave - 1 because
			// wave starts at one but arrays start at zero.
			if ((wave - 1) < array_length(wave_array)) 
			{		
				// Spawn the wave start button 
				layer_sequence_create("Sequences", 0, 0, seq_wave_start_button);
								
				// Destroy the wave skip button if it exists since it is no longer needed
				instance_destroy(obj_button_wave_skip);
			} 
			// If all waves have been completed
			else 
			{
				// Set waves_over to true
				waves_over = true;
			}
		}
		// If the wave is over, there are still more waves left, and there are still enemies left
		// we spawn the wave skip button so the player can start the next wave immediately if they want to.
		else if (wave < array_length(wave_array)) && (!instance_exists(obj_button_wave_skip)) 
		{
			// This creates a sequence which creates the wave skip button.
			layer_sequence_create("Sequences", 0, 0, seq_wave_skip_button);
		}
	}
}

