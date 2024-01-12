/// @description Tower Top


// Check if an instance of my_base exists 
if (!instance_exists(my_base))
{
	// If no instance does, destroy this tower top
	instance_destroy(id);
}
// If an instance of my base does exist
else 
{
	// Set the depth of this tower top relative to its y value + 150 
	// (this decreases its depth so it will appear above the tower)
	depth = -(y + 150);
	
	// Update its image index based on its base's image index
	// This will highlight the tower top if the base is highlighted
	image_index = my_base.image_index;
}


