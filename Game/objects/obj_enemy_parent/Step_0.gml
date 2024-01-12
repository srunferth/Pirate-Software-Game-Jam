/// @description Enemy Parent


// Get the direction the enemy is moving
var _dir = point_direction(x_previous, y_previous, x, y);

// If that direction is pointed up
if (_dir < 135) && (_dir > 45) 
{
	// Set the sprite to the walk up sprite
	sprite_index = walk_up_sprite;
	
	// Use the vertical path speed
	path_speed = v_speed;
} 
// If that direction is pointed down
else if (_dir > 235) && (_dir < 315) 
{
	// Set the sprite to the walk down sprite
	sprite_index = walk_down_sprite;
	
	// Use the vertical path speed
	path_speed = v_speed;
} 
// Otherwise the enemy is moving sideways
else 
{
	// Set the sprite to the sideways sprite
	sprite_index = walk_side_sprite;
	
	// Set the sprite's direction 
	image_xscale = sign(x - x_previous);
	
	// Set path speed to normal speed
	path_speed = my_speed;
}

// Save it's current x and y
x_previous = x;
y_previous = y;
