/// @description Wave Manager


// This variable tells whether the wave is currently running
wave_running = false;

// This variable tells whether all the waves have been completed 
waves_over = false;

// This variable stores the wave number
wave = 1;

// This variable stores all the wave struct data
wave_array = [];

// This variable stores the current wave struct
current_wave_struct = noone;

// This variable stores the index to the current wave struct's array of enemies.
// It is used to spawn the next enemy in the wave.
position = 0;

// This variable is used to animate the wave number displayed in the HUD
wave_flash_alpha = 0;

// This variable holds the path to use for the enemies that spawn
// It should be overwritten in the child object
level_path = pth_level_1;


// Create start wave button for first wave
layer_sequence_create("Sequences", 0, 0, seq_wave_start_button);

