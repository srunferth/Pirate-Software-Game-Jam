/// @description Menu Button Parent

// Use the draw_self function to draw the sprite which will be the background of the button
draw_self();

// Set the font
draw_set_font(ft_popup);

// Set the text color
draw_set_colour(text_color);

// Set the font horizontal alignment
draw_set_halign(fa_left);

// Set the font vertical alignment
draw_set_valign(fa_middle);

// Draw the text
draw_text_transformed(x - 18, y + 36, string(cost), image_xscale, image_yscale, 0);

// Reset the font alignment and color
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
