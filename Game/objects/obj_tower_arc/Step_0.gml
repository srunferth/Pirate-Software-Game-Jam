/// @description Tower


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

// See if we found an enemy to target (_farthest will contain an instanc id
// if there was a viable target) and check if we are ready to fire
if (_farthest != noone) && (ready_to_fire)
{

	// Start charging up
	power_level += power_charge;

	// Once the tower is charged, it is ready to fire
	if (power_level >= 1) 
	{
		// Deal damage immedaitely
		deal_damage(_farthest, 2);
		
		// Reset power level to 0
		power_level = 0;
		
		// Set ready to fire to false so the tower can't fire again right away
		ready_to_fire = false;
		
		// Set alarm zero to the fire_delay
		alarm[0] = fire_delay;
		
		// Create a new layer just above this one
		var _layer = layer_create(depth - 1);
		
		// Create the fire fade sequence
		layer_sequence_create(_layer, x, y, seq_arc_fire_fade);
		
		// Get the direction to the enemy (offsetting the y value)
		// so that it doesn't spawn and target the bottom of the sprites
		var _dir = point_direction(x, y - 122, _farthest.x, _farthest.y - 125);	
		
		// Create the arc fire sequence and save it's id
		var _seq = layer_sequence_create(_layer, x, y - 122, seq_arc_fire);
		
		// Set the sequence's angle using the id and direction we just calculated
		layer_sequence_angle(_seq, _dir);
		
		// Create a new instance of the arc and use with to access its variables 
		with (instance_create_depth(x, y - 134, depth, obj_arc_new)) 
		{
			// Set the target id to the id of the enemy we're targeting
			target = _farthest;
			
			// Push that id onto the targets_hit_array so it can't be targeted again
			array_push(targets_hit_array, target);
			
			// Set the amount of chains remaining to the amount of chains remaining of the arc that created it
			chains_remaining = other.chain_amount;
			
			// Set the target's x, y, and depth
			target_x = target.x;
			target_y = target.y;
			target_depth = target.depth;
			
			// Have this new arc point towards its target
			image_angle = point_direction(x, y, target_x, target_y - 125);
			
			// Scale the arc by how close it is to its target
			image_xscale = point_distance(x, y, target_x, target_y - 125) / sprite_get_width(sprite_index);
			
			// Create a new instance of the arc and use with to access its variables 
			with (instance_create_depth(_farthest.x, _farthest.y - 125, _farthest.depth - 15, obj_arc_hit))
			{
				// Set the image's x scale to face right or left
				image_xscale = ((_dir > 90) && (_dir < 270)) ? -1 : 1;
			}
			
		}


	}
		
} 
// If there's no target or we're not ready to fire
else 
{
	// Power down
	power_level -= power_charge;
} 

// Clamp the power level between 0 and 1
power_level = clamp(power_level, 0, 1);


