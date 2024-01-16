// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function onDraggingStart(){
	if((!variable_global_exists("currentlyDragging")) || (variable_global_exists("currentlyDragging") && !bool(variable_global_get("currentlyDragging"))))
	{
		show_debug_message("1: " + string(id) + " depth: " +  string(depth));
		var currentDepth = depth;
		if(variable_global_exists("lowestDraggedId"))
		{
			show_debug_message("2: " + string(id));
			if( variable_global_get("lowestDraggedId") != pointer_null)
			{
				show_debug_message("3: " + string(id));
				var currentLowest = variable_global_get("lowestDraggedId");
	
				if(currentLowest.depth > currentDepth)
				{
					show_debug_message("4: " + string(id));
					variable_global_set("lowestDraggedId", id)
					prev_mouse_x = mouse_x;
					prev_mouse_y = mouse_y;
					return true;
				}
			}
			else
			{
				show_debug_message("5: " + string(id));
				variable_global_set("lowestDraggedId", id);
				prev_mouse_x = mouse_x;
				prev_mouse_y = mouse_y;
				return true;
			}
		}
		else
		{
			show_debug_message("6: " + string(id));
			variable_global_set("lowestDraggedId", id);
			prev_mouse_x = mouse_x;
			prev_mouse_y = mouse_y;
			return true;
		}
	
		
	}
	
	return false;
}

function onDragging(objectToDrag)
{
	 objectToDrag = is_undefined(objectToDrag) ? id : objectToDrag;
	if(variable_global_get("lowestDraggedId") == id)
	{

		
		variable_global_set("currentlyDragging", true);
		
		var towers = tag_get_asset_ids("tower", asset_object);
		show_debug_message(array_length(towers));
		var levelColliders = tag_get_asset_ids("level_collider", asset_object);
		var reverseLevelColliders = tag_get_asset_ids("reverse_lvl_collider", asset_object);
		show_debug_message(array_length(levelColliders));
		show_debug_message(array_length(reverseLevelColliders));
		array_delete(towers, objectToDrag, 1);
		var prevX = objectToDrag.x;
		var prevY = objectToDrag.y;
		var testX = prev_mouse_x;
		var testY = prev_mouse_y;
		with(objectToDrag)
		{
			
			var colliding = place_meeting(prevX + mouse_x - testX,  prevY + mouse_y - testY, towers);
			if(!colliding)
			{
				colliding = !place_meeting(prevX + mouse_x - testX,  prevY + mouse_y - testY, levelColliders);
				show_debug_message("colliding with area: " + string(place_meeting(prevX + mouse_x - testX,  prevY + mouse_y - testY, levelColliders)));
				if(!colliding)
				{
					colliding = place_meeting(prevX + mouse_x - testX, prevY + mouse_y - testY, reverseLevelColliders);	
				}
			}
		}
		
		objectToDrag.x = prevX +  mouse_x - prev_mouse_x;
		objectToDrag.y = prevY + mouse_y - prev_mouse_y;
		prev_mouse_x  = mouse_x;
		prev_mouse_y = mouse_y;	
		return colliding;
		
		
	}
	
	return false;
}

function onDraggingEnd()
{
	if(variable_global_exists("lowestDraggedId"))
	{
		variable_global_set("lowestDraggedId", pointer_null);
	}
	variable_global_set("currentlyDragging", false);
}