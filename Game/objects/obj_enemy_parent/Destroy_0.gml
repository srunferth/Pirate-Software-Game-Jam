/// @description Enemy Parent


// Check if hp is greater than zero
// We only want to run this event if the enemy has
// Lost all of its health
if (hp > 0) exit;

// Check if the enemy is walking sideways
if (sprite_index == walk_side_sprite) 
{
	// If so, create an instance of their defeat_side_object and use with to access its variables
	with (instance_create_depth(x, y, depth, defeat_side_object)) 
	{
		// Set image_xscale to the xscale of the instance that created it
		// This will make the newly created instance face the right way
		image_xscale = other.image_xscale;
	}
} 
// If it is not walking sideways
else 
{	
	// Create this instance's defeat_down_object
	instance_create_depth(x, y, depth, defeat_down_object);
}

