/// @description Game Lost Menu


/*
	This is here because if it is in the Draw GUI
	the buttons will draw below it.
*/

// Draw the Sprite
draw_self();

// Draw the lose image 
draw_sprite_ext(spr_lose_image, 0, x, y - 28, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Set the font horizontal alignment
draw_set_halign(fa_center);

// Set the font vertical alignment
draw_set_valign(fa_middle);

// Set the font
draw_set_font(ft_game_end_small);

// Use our custom function to draw the text and the outline 
draw_text_transformed_outlined(x, y - map_value(image_xscale, 0, 1, 0, 300), "OH NO!", image_xscale, image_yscale, image_angle, #baaa7d, #33261E);

// Set the font
draw_set_font(ft_game_end_big);

// Use our custom function to draw the text and the outline 
draw_text_transformed_outlined(x, y - map_value(image_xscale, 0, 1, 0, 200), "GAME OVER", image_xscale, image_yscale, image_angle, #baaa7d, #33261E);