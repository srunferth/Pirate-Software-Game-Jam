/// @description Popup Manager Tower

// Inherit the parent event
event_inherited();

// Create a sell popup
instance_create_layer(x, y + 75, "SequenceInstance", obj_button_tower_sell, {my_manager : other.id});

// Check if the tower is less than max level
if (my_tower.level < my_tower.max_level) 
{
	// Create an upgrade popup if the tower is not at max level
	instance_create_layer(x, y - 225, "SequenceInstance", obj_button_upgrade, {my_manager : other.id});
}

// Use with to create an instance of obj_tower_range and access it's variables
with (instance_create_layer(x, y - 39, "TowerRange", obj_tower_range))
{
	// Scale the x scale by remapping it's range
	image_xscale = map_value(other.my_tower.range, 0, 260, 0, 1);
	
	// Set the yscale to be the same as xscale so we don't have to call map_value twice
	image_yscale = image_xscale;
}
