/// @description Zombie

// Inherit the parent event
event_inherited();

// This variable stores the enemies max health and is used to scale the health bar
max_hp = 4;

// Set the enemies hp to its max hp
hp = max_hp;

// This variable stores the amount of money the player will get when they defeat it
my_value = 3;

// This variable holds the speed for the enemy
my_speed = 1.3;

// This variable holds the speed the enemy should move at when moving vertically
v_speed = my_speed * 0.6;

// This variable holds the sprite to use when the enemy is moving sideways
walk_side_sprite = spr_zombie_walk_side;

// This variable holds the sprite to use when the enemy is moving up
walk_up_sprite = spr_zombie_walk_up;

// This variable holds the sprite to use when the enemy is moving down
walk_down_sprite = spr_zombie_walk_down;

// The defeated enemy to spawn if the enemy is moving sideways
defeat_side_object = obj_zombie_defeat_side;

// The defeated enemy to spawn if the enemy is moving down
defeat_down_object = obj_zombie_defeat_down;

// This variable is updated to match the health bar offset to the zombies height
health_offset_y = -170;

