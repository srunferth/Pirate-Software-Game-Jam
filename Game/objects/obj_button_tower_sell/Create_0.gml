/// @description Tower Sell


/*
	This is the sell button. It will sell the tower
	and refund the player the cost of the tower.
*/

// Inherit the parent event
event_inherited();

// Set the cost (sell value) to its original cost multiplied by the level plus 1
// because towers start at level 0
cost = my_manager.my_tower.cost * (my_manager.my_tower.level + 1);

// Use our custom function to animate this instance using a sequence
animate_with_sequence("Sequences", x, y, seq_popup_button, obj_button_tower_buy_parent);

// Use our custom function to create a new icon and save the instance id to the variable my_icon
my_icon = create_icon(x +3, y - 27, "SequenceIcons", id, spr_tower_icon_sell, spr_tower_icon_sell);	

