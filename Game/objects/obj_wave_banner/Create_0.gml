/// @description Wave Banner



// Create a temporary variable and set it to false
var _waves_over = false;

// Use with to access the instance variables inside obj_wave_manager
with (obj_wave_manager)
{
	// Check to see whether waves is greater than or equal to the length of the wave array (which means the waves are over)
	if (wave >= array_length(wave_array))
	{
		// Set waves over to true
		_waves_over = true;
	}

}

// Set text based on whether it is the last wave
// Check if the waves are over
if (_waves_over)
{
	// If waves are over, set text to final wave
	text = "FINAL WAVE";
	
	// And play the final wave sound
	audio_play_sound(snd_wave_start_final, 4, false);
}
// If the waves aren't over
else 
{
	// Set the text to the waver number
	text = "WAVE " + string(return_wave_number());
	
	// And play the normal wave sound
	audio_play_sound(snd_wave_start, 4, false);
}

