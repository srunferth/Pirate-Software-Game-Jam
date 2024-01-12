/// @description Arc Hit

// Decrease the image alpha each frame
image_alpha -= 0.1;

// Check if the image alpha is equal to or less than zero
if (image_alpha <= 0) {
	// If the image alpha is equal to or less than zero destroy this instance
	instance_destroy(id);
}
