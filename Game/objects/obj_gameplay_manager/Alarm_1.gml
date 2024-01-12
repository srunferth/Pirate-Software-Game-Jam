/// @description Gameplay Manager - Prevent Reopening Menu

/*
	Sometimes buttons can overlap allowing you to click on both at the same time.
	To prevent this, we set an alarm for 1 frame so that the click will finish
	before this variable is set to false.
*/

// Turn this variable off
global.popup_menu_exists = false;