/// @description Archer Tower

// Set depth based on its y value
depth = -y;

// Set the distance calculation a bit up from the base of the sprite
var _target_y = y - 39

/*
	This section finds the target that is
	farthest along the path (i.e. closest to village)
*/

	// Declare the temporary variables 
var _farthest, _farthest_val;

// This variable stores the id of the next correct enemy to target
_farthest = noone;

// This variable stores the distance to the farthest enemy, defaulted to 0
_farthest_val = 0;

// Loop through all current enemies
with (obj_enemy_parent) 
{
	// Create a value based off the ellipse position and the position of the enemy for ellipse equation
	// thats is used to check if the distance x squared divided by the x range squared 
	// plus the distance y squared divided by the range y squared is less than 1
	var _check_ellipse_collision = (sqr(x - other.x)/sqr(other.range)) + (sqr(y - _target_y)/sqr(other.range * 0.75));
	
	// Performs the check to see if the enemy is in range based on the calculated value
	if (_check_ellipse_collision < 1)
	{
		// Check to see if either this is the first enemy (_farthest == noone) or
		// its farther along the path than the last closest enemy (path_position > _farthest_val)
	    if (_farthest == noone) || (path_position > _farthest_val) 
		{		
			// If it is, save its id as _farthest so that it can be compared to the next enemy
			_farthest = id;
		
			// Save its distance as _farthest_val value so that it can be compared to the next enemy
			_farthest_val = path_position;
	    }
	}
}

/*
	This section will use the id of the farthest enemy (i.e. closest to village)
	and fire at it, if the tower is ready to fire.
*/

// See if we found an enemy to target (_farthest will contain an instance id
// if there was a viable target) and check if we are ready to fire
if (_farthest != noone) && (ready_to_fire)
{

	// Create an instance of obj_arrow and use with to access its instance variables
	with (instance_create_depth(x, y - 100, depth, obj_arrow)) 
	{
		// Set image_angle using point_direction to get the direction to the target 
		// We are offsetting the target's y value because we don't want to shoot at the target's feet
		image_angle = point_direction(x, y, _farthest.x, _farthest.y - 125);
			
		// Set the direction to be the same as the image_angle
		direction = image_angle;
			
		// Create a layer for our arrow fire sequence so it will be at the right depth
		var _layer = layer_create(-(y + 105));
			
		// Create a sequence on that layer
		var _seq = layer_sequence_create(_layer, x, y, seq_arrow_fire);
			
		// Set the sequence's angle to be the same as the arrows
		layer_sequence_angle(_seq, image_angle);
	}
		
	// Set ready to fire to false so the tower can't fire again right away
	ready_to_fire = false;
		
	// Set alarm zero to the fire_delay
	alarm[0] = fire_delay;
		
}




