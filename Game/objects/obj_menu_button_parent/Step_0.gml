/// @description Tower Buy Parent


// Check whether or not a popup menu exists
if (!global.popup_menu_exists) 
{
	// If none exist, destroy this menu button
	instance_destroy(id);
}	

// Check whether the current money is less than what this item costs
if (get_money() < cost) 
{
	// If so, then use image_index 1, the grey version
	image_index = 1;
} 
else 
{
	// If not, use image_index 0, the colorized version.
	image_index = 0;
}