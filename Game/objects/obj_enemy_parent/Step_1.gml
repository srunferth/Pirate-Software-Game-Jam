/// @description Enemy Parent

// Set the enemy's speed
// Because the enemy is on path, we need to use path_speed instead of speed
path_speed = my_speed;

// Check if the enemies position on the path is greater than or equal to 1
// which means that it is at the end of the path
if (path_position >= 1)
{
	// If the enemy is at the end of the path, then it has reached the village,
	// so we should reduce the village hp.
	reduce_village_hp(1);
	
	// Destroy this enemy
	instance_destroy(id);
}