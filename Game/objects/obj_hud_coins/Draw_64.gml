/// @description Hud Coins


var _scale, _alpha, _color;

// Set _scale's default value to 1
_scale = 1;

// Set _alpha's default value to 0
_alpha = 0;

// Set _color's default value to c_white
_color = c_white;

// Use with to access the instance variables of obj_gameplay_manager
with (obj_gameplay_manager)
{
	// Overwrite _alpha's default value with money_flash_alpha's value
	_alpha = money_flash_alpha;

	// Overwrite _color's default value with money_flash_color's value
	_color = money_flash_color;

	// Check if money_flash_alpha's alpha is greater than zero
	if (money_flash_alpha > 0)
	{
		// If it is, use the custom map_value function to scale the _scale variable
		_scale = map_value(money_flash_alpha, 1, 0, 1.15, 1);
	}
}

// Inherit the parent event
event_inherited();

// Use our custom function to draw the text and the outline 
draw_text_transformed_outlined(x + 50, y + 42, string(get_money()), _scale, _scale, 0, c_black, c_white);

// Check if _alpha is greater than zero
if (_alpha > 0)
{
	// Draw the text again using the color and alpha values to change the text's color
	draw_text_transformed_color(x + 50, y + 42, string(get_money()), _scale, _scale, 0, _color, _color, _color, _color, _alpha);
}
