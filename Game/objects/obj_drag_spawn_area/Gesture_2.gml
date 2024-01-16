/// @description Insert description here
// You can write your code in this editor


if(onDraggingStart())
{
	dragging_instance = instance_create_layer(x,y,"Instances", obj_tower_draggable);
	dragging_instance.image_blend=c_white;
	dragging = true;
}
else
{
	dragging = false;	
}


