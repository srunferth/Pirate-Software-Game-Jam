/// @description Menu Button Parent


// This variable stores the cost of the item. It will be overwritten in the child objects
cost = 2;

// This variable stores the color to draw the text in
text_color = c_white;

// This variable says whether this instance is in the confirmed state or not. It should start in false.
confirmed = false;


/*
	We have three methods here that the various button children use.
	They could be functions, but since only this object (and its children)
	use them, I made them methods instead.
*/

// This method unconfirms any other confirmed buttons 
// It is only called when there is a confirmed button
unconfirm_choice = function()
{
	// Use with to loop through all menu buttons
	with (obj_menu_button_parent)
	{
		// Skip this button in the loop
		// (only unconfirm other buttons)
		if (id == other.id) continue;
		
		// For all other buttons, set confirmed to false
		confirmed = false;
		
		// Use our custom function switch the icon
		switch_icon();	
	}
}

// This method sets both the managers and this buttons confirm state to true
confirm_choice = function()
{
	// Set the manager's confirmed state to true
	my_manager.confirmed = true;
	
	// Set this button's confirmed state to true
	confirmed = true;
	
	// Play the button click sound
	audio_play_sound(snd_popup_click, 10, false);
	
	// Use our custom function to switch the icon
	switch_icon();
}

// This method closes out the whole menu
close_menu = function()
{
	// Destroy the Popup Manager
	instance_destroy(obj_popup_manager_parent);
	
	// Destroy the tower range
	instance_destroy(obj_tower_range);
	
	// Use with to access the gameplay manager
	with (obj_gameplay_manager)
	{
		// Set alarm[1] to 1 frame. This will turn off the global menu exists flag
		// one frame later so that you can't accidentally click on something at the
		// same time as closing something else
		alarm[1] = 1;
	}
}

