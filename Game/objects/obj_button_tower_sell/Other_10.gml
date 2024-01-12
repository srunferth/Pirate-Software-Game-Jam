/// @description Sell Event


// Check if it is currently in the unconfirmed state
if (!confirmed)
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
}
// If it is confirmed and the manager is confirmed 
else if (my_manager.confirmed) && (confirmed)
{
	// Then use our custom function to increase the player's money
	adjust_money(cost);
	
	// Use with to access the tower that spawned this button
	with (my_manager.my_tower) 
	{
		// Create a new tower base where this tower is located
		instance_create_layer(x, y,  "Instances", obj_tower_base);
		
		// Destroy this tower
		instance_destroy(id);
		
		// Create an instance of the sell sequence
		layer_sequence_create("Sequences", x, y, seq_tower_sell);
		
		// Play a random tower sell sound
		audio_play_sound(choose(snd_tower_sell_01, snd_tower_sell_02, snd_tower_sell_03), 10, false);
	}

	// Use the custom method to close the menu
	close_menu();

}






