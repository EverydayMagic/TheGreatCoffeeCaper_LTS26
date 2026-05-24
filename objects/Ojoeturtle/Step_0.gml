if (global.cutsceneActive && global.story_beat = 0 && monster_ani = true && moveOrder <= 0)
{
	monster_ani_frm += 3/FRAME_RATE;
	monster_spr = Smonster_atdoor_first_anim;
} else if (monster_ani_frm >= 3)
	monster_ani_frm = 3;

if (monster_ani && monster_ani_frm < 3 && moveOrder > 0)
	monster_ani_frm += 7/FRAME_RATE;
else if (monster_ani_frm >= 3)
	monster_ani_frm = 3;




if (global.cutsceneActive && global.story_beat = STORY_PACE.OPENING_CUTSCENE && sprite_index = shellin_spr)
{
	if (image_index > image_number - 1)
	{
		image_speed = 0;
		image_index = image_number - 1;
	} else {
		image_speed = 2;
	}
}

//after all clues found
if (global.saveslot_story[global.saveslot][STORY_PACE.FOUND_ALL_MAIN_CLUES] = 1)
{
	if (!instance_exists(Otextbox))
	{
		sprite_index = Sjoeturtle;
		image_index = 3;
		image_speed = 0;
	}
}

depth = -y;