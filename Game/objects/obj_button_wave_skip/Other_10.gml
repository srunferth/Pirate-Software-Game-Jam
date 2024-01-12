/// @description Wave Skip Button

// Uses with() to access the instance of obj_wave_manager.
// with() only works if an instance of the object exists.
with (obj_wave_manager)
{
	// Increase the wave number
	wave += 1;
	
	// Set the wave_flash_alpha to 1 so it will animate
	wave_flash_alpha = 1;
}

// Start the next wave using our custom function
start_next_wave();

// Destroy this button
instance_destroy(id);

// Play the button press sound effect
audio_play_sound(snd_button_click, 0, false);