// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function getTechTreeItemSprite(id){
	switch(id)
	{
		case "1":
			return spr_button_pause;
		case "2":
			return spr_button_skip;
		case "3":
			return spr_button_pause;
		case "4":
			return spr_button_pause;
	}
}

function canBeClicked(id)
{
	with(obj_tech_tree_manager)
	{
		var prereqs = techTree[$ id].prereqs;
		for(var i = 0; i < array_length(prereqs); i = i+1;)
		{
			if(!array_contains(currentlySelected, prereqs[i]))
			{
				return false;
			}
		}
		return true;
	}
}

function canBeUnclicked(id)
{
	with(obj_tech_tree_manager)
	{
		for(var i = 0; i < array_length(currentlySelected); i = i+1;)
		{
			if(array_contains(techTree[$ currentlySelected[i]].prereqs, id))
			{
				return false;
			}
		}
		return true;
	}
}

function initializeTechTree()
{
	techTree = {};
	techTree[$ "1"] = {
		prereqs : []	
	};
	
	techTree[$ "2"]= {
		prereqs: ["1"]	
	};
	techTree[$ "3"]= {
		prereqs: ["1"]	
	};
	techTree[$ "4"]= {
		prereqs: ["2", "3"]	
	};
}