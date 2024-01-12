/// @description Wave Marker



// Inherit the parent event
event_inherited();

// Set the font 
draw_set_font(ft_wave_banner);

// Set the horizontal and verticle alignment of the text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Use our custom function to draw the text and the outline using the variables we set in the create event
draw_text_transformed_outlined(x - 100, y + 40, text, 1, 1, 0, #baaa7d, c_black);
