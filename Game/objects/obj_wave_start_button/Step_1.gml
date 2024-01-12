/// @description Wave Start Button


// Prevent clicking on this button while a popup menu is active
if (global.popup_menu_exists) 
{
	exit;
}

// Inherit the parent event
event_inherited();

