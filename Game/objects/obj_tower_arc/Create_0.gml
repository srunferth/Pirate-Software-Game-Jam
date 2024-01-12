/// @description Arc Tower

// Inherit the parent event
event_inherited();

// This variable holds the cost of the tower
cost = 30;

// This variable holds the tower's range
range = 260;

// This variable says whether or not the tower is ready to fire
ready_to_fire = false;

// This variable stores the amount of frames to wait between firing
fire_delay = room_speed * 2.5;

// Set alarm 0 to the fire delay (alarm 0 sets ready_to_fire to true)
alarm[0] = fire_delay;

// This variable holds how often the arc can chain
chain_amount = 0;

// This variable holds the arc tower's power leve. It can fire when it reaches 1
power_level = 0;

// This variable controls how fast the power_level is charged up
power_charge = 0.02;

// Use our custom function to animate this instance using a sequence
animate_with_sequence(layer_create(depth), x, y, seq_tower_build, obj_tower_archer_dummy); 

