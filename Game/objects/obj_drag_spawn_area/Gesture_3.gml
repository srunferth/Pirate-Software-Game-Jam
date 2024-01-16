
if(dragging != pointer_null && dragging && dragging_instance != pointer_null)
{
	if(onDragging(dragging_instance))
	{
			dragging_instance.image_blend=c_red;
	}
	else
	{
			dragging_instance.image_blend=c_lime;
	}
}