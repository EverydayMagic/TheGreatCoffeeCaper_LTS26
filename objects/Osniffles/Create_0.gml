//x = 24;
//y = 105;

idle_spr = Ssniffles_idle;
sniff_spr = Ssniffles_snif;
sneeze_spr = Ssniffles_sneeze;
idle_talk_spr = Ssniffles_talk;






sniff_time = time_source_create(time_source_global, 2, time_source_units_seconds, function(){
	if (moveOrder < 8)
	{
		if (sprite_index != sniff_spr)
			sprite_index = sniff_spr;
		else
			sprite_index = idle_spr;
	}
	
});



moveOrder = 0;
holdTime = 0;


