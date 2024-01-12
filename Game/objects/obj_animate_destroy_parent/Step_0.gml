/// @description Animate Destroy Parent


// Check if fade out is true (this is set in the Animation End event)
if (fade_out) 
{
	// Decrease the image_alpha
	image_alpha -= 0.2;
	
	// Check if the image_alpha is less than or equal to zero
	if (image_alpha <= 0) 
	{
		// Destroy this instance
		instance_destroy(id);
	}
}
