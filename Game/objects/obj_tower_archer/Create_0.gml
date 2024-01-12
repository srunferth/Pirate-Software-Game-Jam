/// @description Archer Tower

// Inherit the parent event
event_inherited();

// This variable holds the cost of the tower
cost = 15;

// This variable holds the tower's range
range = 260;

// This variable says whether or not the tower is ready to fire
ready_to_fire = false;

// This variable stores the amount of frames to wait between firing
fire_delay = room_speed * 2;

// Set alarm 0 to the fire delay (alarm 0 sets ready_to_fire to true)
alarm[0] = fire_delay;

// Create an instance fo the archer top and use with to access its instance variables
with (instance_create_depth(x, y, depth, obj_tower_archer_top))
{
	// Set my_base to the id of the instance that created it
	my_base = other.id;
}

// Use our custom function to animate this instance using a sequence
animate_with_sequence(layer_create(depth), x, y, seq_tower_build, obj_tower_archer_dummy); 

