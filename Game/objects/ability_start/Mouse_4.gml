/// @description Insert description here
// You can write your code in this editor

//First check if the global variable exists. 
//If it does not we know the ability has never been used so we can spawn it
//If it does exist as long as it is false we can spawn the ability
if(!variable_global_exists("ability_placement_active") || !global.ability_placement_active)
{
	//Create the ability area object at the cursor on the Instances_1 layer
	var area = instance_create_layer(mouse_x, mouse_y, "Instances_1", ability_area);
	//Set the variable so we know the ability is currently being placed. So we don't have multiple
	//abilities being places at once.
	global.ability_placement_active = true;
	
}