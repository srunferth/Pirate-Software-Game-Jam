/// @description Popup Manager

// Inherit the parent event
event_inherited();

// Create a buy archer popup
instance_create_layer(x - 80, y - 150, "SequenceInstance", obj_button_tower_buy_archer, {my_manager : other.id});

// Create a buy arc popup
instance_create_layer(x + 80, y - 150, "SequenceInstance", obj_button_tower_buy_arc, {my_manager : other.id});

