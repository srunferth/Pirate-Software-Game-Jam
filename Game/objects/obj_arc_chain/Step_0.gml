/// @description Arc Chain



// Inherit the parent event
event_inherited();

// Check if the prev_target (an instance) still exists
if (instance_exists(prev_taget)) 
{
	// If it does, update this isntance's x adn y
	x = prev_taget.x;
	
	// We offset the y value. Otherwise, the arc would track the enemies feet
	y = prev_taget.y - 125;
}	