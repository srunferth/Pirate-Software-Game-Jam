/// @description Environment Parent

/*
	This is the parent object for environment objects.
	We need to control the depth of each instance of an object in the room
	so that it appears properly behind or in front of other instances.	
	Environment objects don't need to move, so we can do this once in the create event.
*/

// Set the depth of the instance relative to is y position
depth = -y;

