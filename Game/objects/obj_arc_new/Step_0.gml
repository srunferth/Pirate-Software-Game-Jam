/// @description Arc New

	
// Decrease the image_alpha of the arc
image_alpha -= 0.03;

// Check if the image_alpha is equal to or less than zero
if (image_alpha <= 0) 
{
	// Play a random arc attack impact sound
	audio_play_sound(choose(snd_impact_arc_01, snd_impact_arc_02), 1, false);
	
	// Destroy this arc
	instance_destroy(id);
} 
// Check if the image_alpha is less than or equal to 0.7 and make sure it hasn't already chained
else if (image_alpha <= 0.7) && (!chained)
{
	// Check whether any chains remain, if none remain, exit.
	if (chains_remaining <= 0) 
	{
		exit;
	}
	
	/*
		This section finds the nearest correct enemy if there is one
	*/
	
	// Declare the temporary variables 
	var _dist, _lowest, _lowest_val;
	
	// This variable stores the id of the next correct enemy to target
	_lowest = noone;
	
	// This variable stores the number to check against
	_lowest_val = infinity;
	
	// Loop through all current enemies
	with (obj_enemy_parent) 
	{
		// This variable says whether or not the enemy has already been targeted.
		// We start by assuming it hasn't been.
		var _prev_target = false;
		
		// We loop through all enemies we have currently targeted, which are stored in the targets_hit_array.
		// We use other since we are currently inside of a with loop and this variable is part of the arc.
		for (var i = 0; i < array_length(other.targets_hit_array); i += 1)
		{
			// Check to see whether this enemy's id matches the current id in the targets_hit_array
			if (other.targets_hit_array[i] == id) 
			{
				// If there's a match, then we've previously targeted this enemy
				_prev_target = true;
				
				//Break out of the for loop
				break;
			}
		}
		
		// If we previously targted the enemy, continue to the next enemy
		if (_prev_target) continue;
		
		// If we make it here, then it's a brand new enemy, so we see how far away it is
	    _dist = point_distance(x, y, other.target_x, other.target_y);
		
		// If this enemy is more than 250 pixels away, the max length to chain, continue to the next enemy
		if (_dist > 250) continue;
		
		// If we make it here, then it's a brand new enemy that is close enough to target
		// so we check to see if either this is the first enemy (_lowest == noone) or
		// its closer than the last closest enemy (_dist < _lowest_val)
	    if (_lowest == noone) || (_dist < _lowest_val) 
		{		
			// If it is, save its id as _lowest so that it can be compared to the next enemy
			_lowest = id;
			
			// Save its distance as _lowest value so that it can be compared to the next enemy
			_lowest_val = _dist;
	    }
	}

	/*
		This section will fire an arc if there is a viable target
	*/

	// Check to see if _lowest does not equal noone
	// _lowest will contain an instance id if there was a viable target
	if (_lowest != noone) 
	{
		// Switch chained to true, so this arc can't fire again
		chained = true;
		
		// Reduce the amount of chains remaining (this will get passed to the next arc)
		chains_remaining -= 1;
		
		// Use our custom function to deal damage to this enemy
		deal_damage(_lowest, 2);
		
		// Create an instance of obj_arc_chain (which is a child of this object)
		with (instance_create_depth(target_x, target_y - 125, target_depth, obj_arc_chain)) 
		{
			// Set its target to _lowest
			target = _lowest;
			
			// Overwrite its targets_hit_array with the original arcs targets_hit_array
			array_copy(targets_hit_array, 0, other.targets_hit_array, 0, array_length(other.targets_hit_array));
			
			// Push the new target id onto the array so it can't be targeted again
			array_push(targets_hit_array, target);
			
			// Set the amount of chains remaining to the amount of chains remaining of the arc that created it
			chains_remaining = other.chains_remaining;
			
			// Set the target's x, y, and depth
			target_x = target.x;
			target_y = target.y;
			target_depth = target.depth;
			
			// Have this new arc point towards its target
			image_angle = point_direction(x, y, target_x, target_y - 125);
			
			// Scale the arc by how close it is to its target
			image_xscale = point_distance(x, y, target_x, target_y - 125) / sprite_get_width(sprite_index);
			
		}
	}
	
	
} 

