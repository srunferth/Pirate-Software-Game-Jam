/// @description Arc


// Inherit the parent event
event_inherited();

// Draw the arc_on sprite over the base sprite for the charge up
// using map_value to remap the power level from 0-1 to 0.0.5 so that the alpha snaps from 0.5 to 1 when it actually fires
draw_sprite_ext(spr_tower_arc_on, image_index, x, y, image_xscale, image_yscale, 0, c_white, map_value(power_level, 0, 1, 0, 0.5));

