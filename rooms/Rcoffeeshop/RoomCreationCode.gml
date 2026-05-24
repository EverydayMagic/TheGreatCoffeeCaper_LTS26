//layer visibility changing
if (global.saveslot_story[global.saveslot][STORY_PACE.OPENING_CUTSCENE] = 1) //if the prologue has been completed
{	
	if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 1)//If Invest CupOJoe has been completed
	{
		if (global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 1)//If we've found all the clues
		{
			//push block broken chair, pushed out of way
			with (instance_create_layer(112, 80, "Instances", Opushblock))
			{
				sprite_index = Sbroken_chair	
			}
			//tile of regular wood, where broken chair would normally go
			tile_replace("BrokenDec", 62, 6, 6, 5, true);
			
			/*
			if (global.saveslot_story[global.saveslot][29][1] = 1)//If the First Act has been completed
			{
				layer_destroy("Col_Broken");	
			} else layer_destroy("Col");
			*/
			
			layer_destroy("Col");
		} else layer_destroy("Col");
	} else layer_destroy("Col");
	
	//light mode
	layer_set_visible("BrokenDec", true);
	layer_set_visible("OtherDec", true);
	layer_set_visible("Base", true);
	layer_set_visible("windowfloorforopen", false);
	
	//dark mode
	layer_set_visible("OtherDarkDec", false);
	layer_set_visible("DarkDec", false);
	layer_set_visible("DarkBase", false);
} else {
	//light mode
	layer_set_visible("BrokenDec", false);
	layer_set_visible("OtherDec", true);
	layer_set_visible("Base", true);
	layer_set_visible("windowfloorforopen", true);
	
	//dark mode
	///these will be set true by the cutscene when it is time
	layer_set_visible("OtherDarkDec", false);
	layer_set_visible("DarkDec", false);
	layer_set_visible("DarkBase", false);
}

if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 0 || global.saveslot_story[global.saveslot][STORY_PACE.MUSICSHEET_FOUND] = 0)
{
	if (global.saveslot_story[global.saveslot][STORY_PACE.OPENING_CUTSCENE] = 1)//if prologue is done
	{
		if (global.saveslot_story[global.saveslot][10][1] = 0) //if cloud puff not yet found
		{
			//pushable chair
			with (instance_create_layer(96, 80, "Instances", Opushblock))
			{
				sprite_index = Sbroken_chair	
			}
			tile_replace("BrokenDec", 62, 6, 6, 5, true);
		
			//push block goal
			instance_create_layer(112, 80, "Instances", Opushblock_goal);
		} else {
			//push block broken chair, pushed out of way
			with (instance_create_layer(112, 80, "Instances", Opushblock))
			{
				sprite_index = Sbroken_chair	
			}
			//tile of regular wood, where broken chair would normally go
			tile_replace("BrokenDec", 62, 6, 6, 5, true);	
		}
	}
	
	//create collisions where Joe and Charlie will be
	with (instance_create_layer(80, 64, "Col_Broken", Ocol)){ image_xscale = 2; image_yscale = 2; } //Joe Col (joe cool)
	if (global.saveslot_story[global.saveslot][10][1] = 0) {
		with (instance_create_layer(90, 104, "Col_Broken", Ocol)){ image_xscale = 2; image_yscale = 1; } //Charlie Col
	}
	
	
	
	//create invisible textboxes
	with (instance_create_layer(80, 64, "Instances", Oinvissign)){ text_id = "outofbusiness"; }
	if (global.saveslot_story[global.saveslot][10][1] = 0) {
		with (instance_create_layer(90, 104, "Instances", Oinvissign)){ text_id = "hootsworthhelpfromcharlie"; dir_needed = [0, 3]; image_xscale = 1; image_yscale = 0.5; }
	}
}

//create characters that may be needed
if (global.saveslot_story[global.saveslot][STORY_PACE.INVESTIGATE_CUPOJOE] = 1 && global.saveslot_story[global.saveslot][STORY_PACE.MUSICSHEET_FOUND] = 0) //If "Invest CupOJoe" has been done but all items haven't been found
{
	
	with (instance_create_depth(0, 0, 200, Ojoeturtle))
	{
		x = 88;
		y = 78;
		sprite_index = Sjoeturtle_flatmouth;
		image_index = 3;
		image_speed = 0;
	}
	
	if (global.saveslot_story[global.saveslot][10][1] = 0) //if charlie is not currently in closet
	{
		with (instance_create_depth(0, 0, 200, Ocharliemouse_cutscene))
		{
			x = 99;
			y = 108;
			sprite_index = Scmouse_idle;
			image_index = 2;
			image_speed = 0;
		}	
	}
}

if (global.saveslot_story[global.saveslot][STORY_PACE.MUSICSHEET_FOUND] = 1)
{
	with (instance_create_depth(0, 0, 200, Ojoeturtle))
	{
		x = 72;
		y = 47;
		sprite_index = Sjoeturtle;
		image_index = 3;
		image_speed = 0;
	}
	
	//create way to get out of room
	
	//create collisions
	with (instance_create_layer(65, 32, "Col_Broken", Ocol)){ image_xscale = 1.75; image_yscale = 2; }
	//create invisible textboxes
	with (instance_create_layer(64, 32, "Instances", Oinvissign)){ text_id = "joeaftercloset"; }
}