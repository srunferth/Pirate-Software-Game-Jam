// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function getTechTreeItemSprite(id){
	switch(id)
	{
		case "1":
			return spr_tower_unlock_aoe;
		case "11":
			return spr_tower_unlock_melee;
		case "12":
			return spr_tower_unlock_range;
		case "13":
			return spr_tower_unlock_range_aoe;
		case "111":
			return spr_attack_speed_up;
		case "112":
			return spr_damage_up;
		case "121":
			return spr_attack_speed_up;
		case "122":
			return spr_damage_up;
		case "131":
			return spr_attack_speed_up;
		case "132":
			return spr_damage_up;
		case "2":
			return spr_ability_unlock;
		case "21":
			return spr_damage_up;
		case "211":
			return spr_damage_up;
		default:
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
	
	techTree[$ "11"] ={ 
		prereqs: ["1"]	
	};
	
	techTree[$ "12"] ={ 
		prereqs: ["1"]	
	};
	
	techTree[$ "13"] ={ 
		prereqs: ["1"]	
	};
	
	techTree[$ "111"]= {
		prereqs: ["11"]	
	};
	techTree[$ "112"]= {
		prereqs: ["11"]	
	};
	
	techTree[$ "121"]= {
		prereqs: ["12"]	
	};
	techTree[$ "122"]= {
		prereqs: ["12"]	
	};
	
	techTree[$ "131"]= {
		prereqs: ["13"]	
	};
	techTree[$ "132"]= {
		prereqs: ["13"]	
	};
	
	techTree[$ "2"]= {
		prereqs: []	
	};
	
	techTree[$ "21"]= {
		prereqs: ["2"]	
	};
	
	techTree[$ "211"]= {
		prereqs: ["21"]	
	};
}