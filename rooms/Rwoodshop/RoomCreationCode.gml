if (global.saveslot_story[global.saveslot][STORY_PACE.MEET_CLAWDINE] = 0) //is Meet Clawdine not done?
{
	//create collisions where charlie and clawdine will be after 'Meet Clawdine'
		with (instance_create_layer(40, 106, "Col", Ocol)) //charlie collision
		{
			image_xscale = 2.25;
			image_yscale = 0.75;
			special = true;
		}
		
		with (instance_create_layer(72, 77, "Col", Ocol))//clawdine collision
		{
			image_xscale = 2;
			image_yscale = 0.75;
			special = true;
		}
		
	//create clawdine invis text
		with (instance_create_layer(71, 71, "Invis_Text", Oinvissign))
		{
			image_xscale = 1.125;
			image_yscale = 0.5;
			text_id = "dontleaveclawdinehouse";
		}
	//create charlie invis text
		with (instance_create_layer(40, 104, "Invis_Text", Oinvissign))
		{
			image_xscale = 1.125;
			image_yscale = 0.5;
			text_id = "woodshop_charliesearch";
		}	
	
	//create plot protecting log
		instance_create_layer(72, 48, "Instances", Olog_scratch);
	//collision for plot protecting log
		with (instance_create_layer(64, 46, "Col", Ocol))
		{
			image_xscale = 2.25;
			image_yscale = 0.75;
		}
	
	//flavor text by bed
		with (instance_create_layer(128, 16, "Invis_Text", Oinvissign))
		{
			image_xscale = 1;
			image_yscale = 2;
			text_id = "woodshop_bed";
			dir_needed = 0;
		}
	
	//flavor text by work bench
		with (instance_create_layer(16, 56, "Invis_Text", Oinvissign))
		{
			image_xscale = 1;
			image_yscale = 0.5;
			text_id = "woodshop_workbench";
			dir_needed = 1;
		}
		
} else if (global.saveslot_story[global.saveslot][STORY_PACE.HAMMER_FOUND] = 0) { //if Hammer Found not done
	
	//create clawdine
		with (instance_create_depth(81, 82, 100, Oclawdine))
		{
			sprite_index = Sclawdine_sad;
		}
	//create charlie
		with (instance_create_depth(48, 111, 100, Ocharliemouse_cutscene))
		{
			sprite_index = Scmouse_invest;
			image_speed = 1;
		}
		
		with (instance_create_layer(40, 106, "Col", Ocol)) //charlie collision
		{
			image_xscale = 2.25;
			image_yscale = 0.75;
			special = true;
		}
		
		with (instance_create_layer(72, 77, "Col", Ocol))//clawdine collision
		{
			image_xscale = 2;
			image_yscale = 0.75;
			special = true;
		}
		
	//create clawdine invis text
		with (instance_create_layer(71, 71, "Invis_Text", Oinvissign))
		{
			image_xscale = 1.125;
			image_yscale = 0.5;
			text_id = "dontleaveclawdinehouse";
		}
	//create charlie invis text
		with (instance_create_layer(40, 104, "Invis_Text", Oinvissign))
		{
			image_xscale = 1.125;
			image_yscale = 0.5;
			text_id = "woodshop_charliesearch";
		}	
	
	//create plot protecting log
		instance_create_layer(72, 48, "Instances", Olog_scratch);
	//collision for plot protecting log
		with (instance_create_layer(64, 46, "Col", Ocol))
		{
			image_xscale = 2.25;
			image_yscale = 0.75;
		}
	
	//flavor text by bed
		with (instance_create_layer(128, 16, "Invis_Text", Oinvissign))
		{
			image_xscale = 1;
			image_yscale = 2;
			text_id = "woodshop_bed";
			dir_needed = 0;
		}
	
	//flavor text by work bench
		with (instance_create_layer(16, 56, "Invis_Text", Oinvissign))
		{
			image_xscale = 1;
			image_yscale = 0.5;
			text_id = "woodshop_workbench";
			dir_needed = 1;
		}
	
}
