/// Script Functions


/// @description Is used by a sequence to lock the menu
function menu_lock_on()
{
	// Set the global.menu_lock to true in order to prevent interacting with certain objects
	global.menu_lock = true;
}

/// @description Is used by a sequence to unlock the menu
function menu_lock_off()
{
	// Set the global.menu_lock to false so buttons can be interacted with again
	global.menu_lock = false;
}

/// @description Returns the current amount of money
/// @returns number
function get_money()
{
	// Uses with() to access the instance of obj_gameplay_manager.
	// with() only works if an instance of the object exists.
	with (obj_gameplay_manager)
	{
		// Return the number stored in the money variable of obj_gameplay_manager.
		// return will end the function
		return money;
	}
	
	// If we make it here, then there is no instance of obj_gameplay_manager to check,
	// so we will return -1 instead.
	return - 1;
}

/// @description Adjusts the amount of money available
/// @param {int} _amount
function adjust_money(_amount)
{
	// Uses with() to access the instance of obj_gameplay_manager.
	// with() only works if an instance of the object exists.
	with (obj_gameplay_manager)
	{
		// Adjust the amount of money
		money += _amount;
		
		// If the amount is a positive number
		if (_amount > 0) 
		{
			// Set this value to 1 in order to animate the HUD Text
			money_flash_alpha = 1;
		}
	}
}

/// @description Returns the current amount of village health points
/// @returns number
function get_village_hp()
{
	// Uses with() to access the instance of obj_gameplay_manager.
	// with() only works if an instance of the object exists.
	with (obj_gameplay_manager)
	{
		// Return the number stored in the money variable of obj_gameplay_manager.
		// return will end the function
		return village_hp;
	}
	// If we make it here, then there is no instance of obj_gameplay_manager to check,
	// so we will return -1 instead.
	return -1;
}

/// @description Reduces the amount of village health points
/// @param {int} _amount
function reduce_village_hp(_amount)
{
	// Uses with() to access the instance of obj_gameplay_manager.
	// with() only works if an instance of the object exists.	
	with (obj_gameplay_manager)
	{
		// If the village hp is already at zero, then stop the function
		if (village_hp <= 0) return;
		
		// Reduce the village hp by the amount provided
		village_hp -= _amount;		
		
		// Set this value to 1 in order to animate the HUD Text
		village_flash_alpha = 1;
		
		// Play a random villager death sound
		audio_play_sound(choose(snd_villager_death_01, snd_villager_death_02, snd_villager_death_03, snd_villager_death_04, snd_villager_death_05, snd_villager_death_06), 100, false);
	}
}

/// @description Deal damage to an enemy
/// @param {inst_id} _id
/// @param {int} _amount
function deal_damage(_id, _amount)
{
	// Reduce the enemies hp by the amount that was passed in
	_id.hp -= _amount;
	
	// Set the enemy flash_alpha to 1 so that the hit flash will activate
	_id.flash_alpha = 1;

	// Check if the enemy still has hp left
	if (_id.hp > 0)
	{
		// Check if the enemy is a zombie
		if (_id.object_index == obj_zombie)
		{
			// If so, choose a zombie groan sound to play
			audio_play_sound(choose(snd_zombie_groan_01, snd_zombie_groan_02, snd_zombie_groan_03), 10, false);
		} 
		// Otherwise check if the enemy is a frankenstein
		else if (_id.object_index == obj_frankenstein)
		{
			// If so, choose a frankenstein groan sound to play
			audio_play_sound(choose(snd_frankenstein_groan_01, snd_frankenstein_groan_02, snd_frankenstein_groan_03), 10, false);		
		}	
	}
}

/// @description Creates an icon for the popup menu
/// @param {num} _x
/// @param {num} _y
/// @param {layer_id} _layer
/// @param {inst_id} _id
/// @param {sprite} _spr
/// @param {sprite} _starting_sprite
/// @returns instance_id
function create_icon(_x, _y, _layer, _id, _spr, _starting_sprite)
{
	// Create an instance of obj_icon and save it's id to _inst
	// We are passing variables to this new instance using a struct
	var _inst = instance_create_layer(_x, _y, _layer, obj_icon, {
		// Set the variable my_button to the id of the instance that created this obj_icon
		my_button : _id,
		
		// Set the sprite index to the sprite passed in
		sprite_index : _spr,
		
		// Set the starting_sprite to be the _starting_sprite passed in (this will not necessarily be the same as _spr)
		starting_sprite : _starting_sprite
	});
	
	// Return the newly create instance id
	return _inst;
}

/// @description Animate an instance of obj_icon using a sequence
function switch_icon()
{
	// Use with to access an instance of obj_icon using the instance_id stored in the instance variable my_icon
	with (my_icon)
	{
		// Use our custom function to override this instance with a sequence
		animate_with_sequence("SequencesIcons", x, y, seq_popup_icon_out, obj_icon);
		
		// Set finished to true. This variable use used in the icon step event so the icon can destroy itself after animating
		finished = true;
	}	
}

/// @description Create a Sequence and using sequence_instance_override to animate an object
/// @param {layer_id} _layer_id
/// @param {int} _x
/// @param {int} _y
/// @param {sequence_id} _sequence_id
/// @param {object_id} _object
function animate_with_sequence(_layer_id, _x, _y, _sequence_id, _object)
{
	
	// Declare local variables
	var _seq_elem, _seq_inst;
	
	// Create the sequence and save its element id to a variable
	_seq_elem = layer_sequence_create(_layer_id, _x, _y, _sequence_id);
	
	// Use the sequence element id to get the the sequence id
	_seq_inst = layer_sequence_get_instance(_seq_elem);
	
	// Override the current instance using the sequence id and the object id we passed in 
	sequence_instance_override_object(_seq_inst, _object, id);	
}

/// @description Draw text with an outline
/// @param {num} _x
/// @param {num} _y
/// @param {string} _string
/// @param {num} _xscale
/// @param {num} _yscale
/// @param {num} _angle
/// @param {col} _outline_color
/// @param {col} _string_color
function draw_text_transformed_outlined(_x, _y, _string, _xscale, _yscale, _angle, _outline_color, _string_color)
{	
	// Set the color for the outline first
	draw_set_color(_outline_color);  
	
	// Draw the text 8 times with an offset of one pixel
	draw_text_transformed(_x + 1,	_y + 1,  _string, _xscale, _yscale, _angle);  
	draw_text_transformed(_x - 1,	_y - 1,  _string, _xscale, _yscale, _angle);  
	draw_text_transformed(_x,		_y + 1,  _string, _xscale, _yscale, _angle);  
	draw_text_transformed(_x + 1,   _y,		 _string, _xscale, _yscale, _angle);  
	draw_text_transformed(_x,		_y - 1,  _string, _xscale, _yscale, _angle);  
	draw_text_transformed(_x - 1,   _y,		 _string, _xscale, _yscale, _angle);  
	draw_text_transformed(_x - 1,	_y	+ 1, _string, _xscale, _yscale, _angle);  
	draw_text_transformed(_x + 1,	_y	- 1, _string, _xscale, _yscale, _angle);  
   
	// Set the color for the text itself
	draw_set_color(_string_color);  
	
	// Draw the text on top
	draw_text_transformed(_x, _y, _string, _xscale, _yscale, _angle);  
}

/// @description Do a group of things we want to do whenever the game ends
function set_game_over()
{
	// Use with to access obj_wave_manager
	with (obj_wave_manager)
	{
		// Set wave_running to false
		wave_running = false;
		
		// Set waves_over to true
		waves_over = true;
	}
	
	// Set game_over to true
	game_over = true;
	
	// Lock the menu so we can't interact with the game any more
	global.menu_lock = true;
	
	// Destroy any current buttons
	instance_destroy(obj_button_parent);
	
	// Stop the level's music
	audio_stop_sound(snd_music_level);
}

/// @description Pause the game if unpaused, otherwise if paused, unpause the game
function pause_or_unpause_game()
{
	// Use with to access obj_gameplay_manager
	with (obj_gameplay_manager)
	{
		// If the game is not paused, we want to pause it
		if (!paused)
		{
			// Check to see if a background screenshot already exists
			if(!sprite_exists(global.screen_shot_id)) 
			{
				// If not, create one from the application_surface
		        global.screen_shot_id = sprite_create_from_surface(application_surface, 0, 0, 1920, 1080, false, false, 0, 0);
			}
	
			// Deactivate and pause everything
			instance_deactivate_all(true);
			
			// Create the pause sequence and save the sequence element id
			pause_sequence = layer_sequence_create("Sequences", 0, 0, seq_popup_pause);
			
			// Set paused to true
			paused = true;
	
		}
		// The game is paused
		else
		{
			// Check if the background sprite exists
			if(sprite_exists(global.screen_shot_id))
			{
				// If it does, delete it
		        sprite_delete(global.screen_shot_id);
		    }
	
			// Reactivate all instances
			instance_activate_all();
			
			// Destroy the pause sequence using the sequence element id we saved earlier
			layer_sequence_destroy(pause_sequence);
			
			// Set paused to false
			paused = false;
	
		}
	}
}

/// @description Re-maps a number from one range to another 
/// @param {num} _value
/// @param {num} _current_lower_bound
/// @param {num} _current_upper_bound
/// @param {num} _desired_lowered_bound
/// @param {num} _desired_upper_bound
/// @returns number
function map_value(_value, _current_lower_bound, _current_upper_bound, _desired_lowered_bound, _desired_upper_bound) 
{
	// Re-maps a number from one range to another
	// For example, the inputs 5, 0, 10, 0, 100 would return 50
	return (((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound;
}




