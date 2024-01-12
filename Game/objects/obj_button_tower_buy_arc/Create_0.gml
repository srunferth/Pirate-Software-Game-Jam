/// @description Buy Arc Tower

// Inherit the parent event
event_inherited();

// This variable is the cost of buying an arc tower
cost = 30;

// This variable holds which type of tower to create
my_tower = obj_tower_arc;

// Use our custom function to animate this instance using a sequence
animate_with_sequence("Sequences", x, y, seq_popup_button, obj_button_tower_buy_parent);

// Use our custom function to create a new icon and save the instance id to the variable my_icon
my_icon = create_icon(x +3, y - 27, "SequenceIcons", id, spr_tower_icon_arc, spr_tower_icon_arc);	

