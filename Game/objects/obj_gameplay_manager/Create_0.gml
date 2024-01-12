/// @description Gameplay Manager


// This variable stores the amount of money currently available to spend
money = 150;

// This variable stores the amount of health the village has
village_hp = 10;

// This variable stores the money_flash_alpha number,
// and is how we animate the money text in the HUD.
money_flash_alpha = 0;

// This variable stores the color we want the money to flash in the hud
money_flash_color = #E5D110;

// This variable stores the village_flash_alpha number,
// and is how we animate the village hp text in the HUD.
village_flash_alpha = 0;

// This variable stores the color we want the village hp to flash in the hud
village_flash_color = c_red;

// This variable tells whether the game is currently paused.
paused = false;

// This variable stores the id of the pause sequence if one exists, otherwise it stores negative 1.
pause_sequence = -1;

// Set alarm 0 to go off in 3 seconds. 
alarm[0] = room_speed * 3;

// This variable tells you whether or not the menu is locked.
// It is set to false when the gameplay starts
global.menu_lock = false

// This variable stores the current screenshot id if one exists. Otherwise, it will store -1.
// It is initialized in obj_persistent_manager, but reset here.
global.screen_shot_id = -1;

// This variable tells whether the game is currently over.
game_over = false;