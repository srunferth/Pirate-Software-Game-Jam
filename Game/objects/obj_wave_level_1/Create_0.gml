/// @description Wave Manager  Level 1


// Inherit the parent event
event_inherited();

// Choose which path to follow
level_path = pth_level_1;

/*
	Use the following form to create a new wave: array_push(wave_array, new WaveData(_enemy_array, _wave_delay));
	
	We are using the built-in array_push function to add a new wave to our wave_array,
	and we are calling the WaveData constructor function directly inside of this function
	and creating the array directly inside of that function.
	
	This is the same as doing:
	
	var _enemies_in_wave = [obj_zombie, obj_zombie, obj_zombie, obj_zombie, obj_zombie, obj_frankenstein];
	var _new_wave_struct = new WaveData(_enemies_in_wave, 180);
	array_push(wave_array, _new_wave_struct);
*/

// Wave 1
array_push(wave_array, new WaveData(
	[obj_zombie, obj_zombie, obj_zombie, obj_zombie, obj_zombie, obj_frankenstein],
	(room_speed * 3)
));

// Wave 2
array_push(wave_array, new WaveData(
	[obj_zombie, obj_zombie, obj_frankenstein, obj_zombie, obj_zombie, 
	obj_zombie, obj_zombie, obj_frankenstein,	obj_frankenstein, obj_frankenstein],
	room_speed * 1.75
));

// Wave 3
array_push(wave_array, new WaveData(
	[obj_zombie, obj_zombie, obj_frankenstein, obj_zombie, obj_zombie, 
	obj_zombie, obj_zombie, obj_frankenstein,	obj_frankenstein, obj_frankenstein, 
	obj_zombie, obj_zombie, obj_zombie,	obj_zombie, obj_zombie, 
	obj_frankenstein, obj_frankenstein, obj_frankenstein,	obj_frankenstein, obj_frankenstein],
	(room_speed  * 1.55)
));

