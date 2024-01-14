/// @description Insert description here
// You can write your code in this editor

//var xCount = 10;
//var yCount = 10;
//var verticalPadding = 10;
//var horizontalPadding = 10;
//var objectToSpawn = obj_tech_tree_item;

////Spawn Tech Tree Item
//var spriteIndex = object_get_sprite(obj_tech_tree_item);
//var objectHeight = sprite_get_height(spriteIndex);
//var objectWidth = sprite_get_width(spriteIndex);

//for(var xIndex = 0; xIndex < xCount; xIndex += 1)
//{
//	for(var yIndex = 0; yIndex < yCount; yIndex += 1)
//	{
//		var currentXSpawn = (xIndex+1) * (objectWidth + horizontalPadding) - objectWidth / 2;
//		var currentYSpawn = (yIndex+1) * ( objectHeight + verticalPadding) - objectHeight / 2;
//		instance_create_layer(currentXSpawn, currentYSpawn, "Instances", objectToSpawn);
//	}
//}

initializeTechTree();
currentlySelected = [];


