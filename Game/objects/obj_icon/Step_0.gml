/// @description Icon

// Check if the button controlling this instance exists
// This variable is set by passing in a struct with instance_create_layer
if (!instance_exists(my_button))
{
	// If my button has been destroyed, this instance should be destroyed as well
	instance_destroy(id);
	
	// Exit this event as we don't want to run any more code
	exit;
}

// Set the image index to the same image index as its button
// This will use the greyed out sub image when appropriate
image_index = my_button.image_index;

// Check whether it is finished and not in a sequence 
// which will mean it has finished animating and should be destroyed
if (finished) && (!in_sequence)
{
	// Check whether or not the current sprite is the tick icon, if it is, switch it to the starting sprite
	// Otherwise, set it to the tick icon (this will toggle between the starting icon and the tick icon)
	var _spr = (sprite_index == spr_tower_icon_tick) ? starting_sprite : spr_tower_icon_tick;
	
	// Use with to access this icon's button
	with (my_button)
	{
		// Use our custom function to create a new icon and save the instance id to the variable my_icon
		my_icon = create_icon(x + 3, y - 27, "SequenceIcons", id, _spr, other.starting_sprite);	
	}
	
	// Destroy this icon
	instance_destroy(id);
}