/// @description Upgrade Button

// Inherit the parent event
event_inherited();

// Set the cost of this upgrade
cost = my_manager.my_tower.cost;

// Use our custom function to animate this instance using a sequence
animate_with_sequence("Sequences", x, y, seq_popup_button, obj_button_tower_buy_parent);

// Use our custom function to create a new icon and save the instance id to the variable my_icon
my_icon = create_icon(x +3, y - 27, "SequenceIcons", id, spr_tower_icon_upgrade, spr_tower_icon_upgrade);	

