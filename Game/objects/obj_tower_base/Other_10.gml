/// @description Tower Base


// If a popup menu exists, exit
if (global.popup_menu_exists) 
{
	exit;
}

// Create an instance of the popup manager base and set its my_tower id to the instance id of this tower base
// This instance id will allow the popup menu to refer back to the correct tower base
instance_create_layer(x, y, "SequenceInstance", obj_popup_manager_base, {my_tower : other.id});

// Play the button press sound effect
audio_play_sound(snd_button_click, 2, false);
