/// @description Wave Manager 


/*
	This alarm will spawn the next enemy in the wave and reset itself
	only if the current position in the wave is less than the length of the enemy_array.
*/


// Check if the current position is less than the length of the enemy array in the current wave
if (position < array_length(current_wave_struct.enemy_array)) 
{	
	// Create an instance of that enemy inside of a with statement 
	with (instance_create_layer(x, y, layer, current_wave_struct.enemy_array[position])) 
	{
		// So that we can start it on the path
		path_start(other.level_path, my_speed, path_action_stop, true);
	}	
	
	// Increase the position variable so that next time we spawn the next enemy
	position += 1;
	
	// Reset the alarm using the current wave's wave delay
	alarm[0] = current_wave_struct.wave_delay;	
}

