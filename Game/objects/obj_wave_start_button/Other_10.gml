/// @description Wave Start Button

// Start the next wave using our custom function
start_next_wave();

// Destroy this button
instance_destroy(id);

// Play the button press sound effect
audio_play_sound(snd_button_click, 0, false);
 