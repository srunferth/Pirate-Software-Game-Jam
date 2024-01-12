/// @description Tower Sell


/*
	Since this is the sell button, we want to overwrite
	the normal step event, because we don't need to do the cost check.
*/


// Check whether or not a popup menu exists
if (!global.popup_menu_exists) 
{
	// If none exist, destroy this menu button
	instance_destroy(id);
}	
