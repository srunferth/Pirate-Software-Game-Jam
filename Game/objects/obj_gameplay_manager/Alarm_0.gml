/// @description Gameplay Manager - Get Money Alarm

// Check if the wave is running
if (wave_is_running()) 
{
	// If the wave is running, increase the amount of money the player has to spend
	adjust_money(1);
}

// Reset the alarm for three seconds
alarm[0] = room_speed * 3;
