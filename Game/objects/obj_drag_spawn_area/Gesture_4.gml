/// @description Insert description here
// You can write your code in this editor

if(dragging != pointer_null && dragging && dragging_instance != pointer_null)
{
	if(dragging_instance.image_blend = c_red)
	{
		instance_destroy(dragging_instance);	
	}
	else
	{
		dragging_instance.image_blend=c_white;
	}
}


onDraggingEnd();
dragging = false;




