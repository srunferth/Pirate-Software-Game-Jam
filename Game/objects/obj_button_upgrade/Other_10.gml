/// @description Upgrade Event


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
	
	// Destroy any instance of the tower range
	instance_destroy(obj_tower_range);
	
	// Create a new instance of the tower range and access its variables using with
	with (instance_create_layer(my_manager.x, my_manager.y - 39, "TowerRange", obj_tower_range))
	{
		// Scale the x scale by remapping it's range and multiplying its current range by 1.25
		// This is what the range will be after upgrading the tower
		image_xscale = map_value((other.my_manager.my_tower.range * 1.25), 0, 260, 0, 1);
		
		// Set the yscale to be the same as xscale so we don't have to call map_value twice
		image_yscale = image_xscale;
	}

}
// If it is confirmed and the manager is confirmed and the player still has the money
else if (my_manager.confirmed) && (confirmed) && (get_money() >= cost) 
{
	// Reduce the player's money by the cost of the upgrade
	adjust_money(-cost);
	
	// Use with to access the tower that spawned this button
	with (my_manager.my_tower) 
	{
		// Use the built in function event_perform to perform user event 1, 
		// which is the tower's level up event
		event_perform(ev_other, ev_user1);
	}

	// Use the custom method to close the menu
	close_menu();

}
// Otherwise, if the image_index is 1 then the player can't afford this upgrade
else if (image_index == 1)
{
	// Play the no click sound
	audio_play_sound(snd_button_no_click, 5, false);
}











