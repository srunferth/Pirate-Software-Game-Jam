/// @description Arrow


// Deal damage to the enemy 
deal_damage(other, 1);

// Destroy this arrow
instance_destroy(id);

// Play a random arrow impact sound
audio_play_sound(choose(snd_impact_archer_01, snd_impact_archer_02, snd_impact_archer_03), 1, false);

