var tti_id = tech_tree_item_id;

if(!array_contains(obj_tech_tree_manager.currentlySelected, tti_id))
{

	if(canBeClicked(tti_id))
	{
		array_push(obj_tech_tree_manager.currentlySelected, tti_id);
		image_blend=c_lime;
		audio_play_sound(snd_popup_click, 10, false);
	}
	
}
else
{

	if(canBeUnclicked(tti_id))
	{
		array_delete(obj_tech_tree_manager.currentlySelected, array_get_index(obj_tech_tree_manager.currentlySelected, tti_id), 1);	
		image_blend=c_white;
		audio_play_sound(snd_popup_click, 10, false);
	}
	
}


//if(selected)
//{
//	sprite_index = asset_get_index("spr_button_pause");	
//	audio_play_sound(snd_popup_click, 10, false);
//	selected = false;
//}
//else
//{
//	sprite_index = asset_get_index("spr_button_skip");
//	audio_play_sound(snd_popup_click, 10, false);
//	selected = true;
//}