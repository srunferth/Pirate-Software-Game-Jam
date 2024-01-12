/// @description Tower Top

// This variable holds the instance id of the archer tower that created it
// so that it can track that tower
my_base = noone;

// Use our custom function to animate this instance using a sequence
animate_with_sequence("Sequences", x, y, seq_tower_build_archer_top, obj_tower_archer_top_dummy);

