/// @description Tower Base


// If a popup menu exists, exit
if (global.popup_menu_exists) 
{
	exit;
}

// Check if the menu is locked
if (global.menu_lock)
{
	// If so, set the image to 0 (we don't want to highlight this base if we're in another menu)
	image_index = 0;
}
// Otherwise, check if the mouse is hovering over this instance
else if (position_meeting(mouse_x, mouse_y, id))
{
	// Set image_index to 1 (which is the highlighted version of the sprite)
	image_index = 1;
} 
// If the menu isn't locked, and the mouse isn't hovering over this isntance
else 
{
	// Set image_index to 0 (the unhighlighted version of the sprite)
	image_index = 0;
}







