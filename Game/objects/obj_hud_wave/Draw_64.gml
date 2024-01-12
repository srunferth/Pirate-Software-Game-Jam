/// @description Hud Waves

// Declare a temporary variable and set it to 1
var _scale = 1;

// Use with to access the instance variables of obj_gameplay_manager
with (obj_wave_manager)
{
	// Check if wave_flash_alpha's alpha is greater than zero
	if (wave_flash_alpha > 0)
	{
		// If it is, use the custom map_value function to scale the _scale variable
		_scale = map_value(wave_flash_alpha, 1, 0, 1.15, 1);
	}
}

// Inherit the parent event
event_inherited();

// Use our custom function to draw the text and the outline 
draw_text_transformed_outlined(x + 50, y + 42, string(return_wave_number()), _scale, _scale, 0, c_black, c_white);

