/// @description Insert description here
// You can write your code in this editor

//Get all the assets with the enemy tag
var enemyColliders = tag_get_asset_ids("enemy", asset_object);

//For every asset
for(var assetIndex = 0; assetIndex < array_length(enemyColliders); assetIndex += 1)
{
	//Get the amount of instances in the scene for the current asset
	var instanceCount = instance_number(enemyColliders[assetIndex]);
	//For each instance
	for(var objectIndex = 0; objectIndex < instanceCount; objectIndex+=1)
	{
		//Get the current object
		var objectToTest = instance_find(enemyColliders[assetIndex], objectIndex);
		//Check if the object is colliding with the ability area
		if(place_meeting(x,y,objectToTest))
		{
			//If colliding do damage to the object
			deal_damage(objectToTest, 1);
		}
	}
}



//Destroy this object
instance_destroy(id);
//Set the placement variable to false so more abilities can be placed
global.ability_placement_active = false;





