/// @description Tower Buy Parent


// Check if it is currently in the unconfirmed state and if the player can afford it
if (!confirmed) && (get_money() >= cost) 
{
	// If it is, then
	// Check whether the manager is in the confirmed state
	if (my_manager.confirmed)
	{
		// If it is, unconfirm it
		unconfirm_choice();
	}	
	
	// Confirm this choice
	confirm_choice();	
	
	// Create an instance of obj_tower_range to show the player what the range will be
	instance_create_layer(my_manager.x, my_manager.y - 39, "TowerRange", obj_tower_range);
	
}
// If it is confirmed and the manager is confirmed and the player still has the money
else if (my_manager.confirmed) && (confirmed) && (get_money() >= cost) 
{
	// Reduce the player's money by the cost of the tower's cost
	adjust_money(-cost);
	
	// Create an instance of the tower
	instance_create_depth(my_manager.x, my_manager.y, depth, my_tower);
	
	// Destroy the current tower base
	instance_destroy(my_manager.my_tower);
	
	// Use the custom method to close the menu	
	close_menu();
	
}
// Otherwise, if the image_index is 1 then the player can't afford this tower
else if (image_index == 1)
{
	// Play the no click sound
	audio_play_sound(snd_button_no_click, 5, false);
}

