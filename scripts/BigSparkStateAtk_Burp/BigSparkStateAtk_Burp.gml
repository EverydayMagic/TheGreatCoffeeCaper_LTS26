function BigSparkStateAtk_Burp(){
	#region preburp
	
		if (!attacking)
		{
			if (!preburp)
			{
				emotion = "preburp";
		
				if (face = Sbigsparkboss_bubbleface && face_dir >= (sprite_get_number(face) - 1))
				{
					with (Ocharshake)
					{
						if (!shake)
						{
							shake = true;
							shake_time = round(Obigsparkboss.preburp_time/2);
							shake_magnitude = 0.5;
							shake_fade = 0.25;
							char = [Obigsparkboss];
							cut_dontadd = true;
							dir = "horz";
						}
					}
					if (alarm[3] = -1)
					{ 
						alarm[3] = preburp_time; 
						
						//sound effect
						play_sfx(snd_rumble, 1, 30/preburp_time);
					}
				}
			}
		}
	
	#endregion
	
	#region burp
		
		if (attacking)
		{
			//stop preburp sfx
			if (audio_is_playing(snd_rumble)){ audio_stop_sound(snd_rumble); }
			
			emotion = "burp";
			
			//create bullets
			for (var i = 0; i < burp_max_shots; i++)
			{
				var _bmax = burp_max_shots;
				with (instance_create_depth(x, y, depth - 50, Obigsparkbullet_burp_big))
				{
					var _dir_modcheck = instance_number(Obigsparkbullet_burp_big) mod 2;
					if (_dir_modcheck = 0){ var _dir_mod = 1; } else { var _dir_mod = -1; }
					direction = 0 + (0 + (_dir_mod * ((270/_bmax) * instance_number(Obigsparkbullet_burp_big))));
					if (_bmax > 1)
					{
						direction = 0 + (_dir_mod * (270/instance_number(Obigsparkbullet_burp_big)));	
					}

				}
				burp_shots++;
			}
			//play sfx
			play_sfx(snd_sparkpatooey, 1, 0.5);
			
			//burp done
			attacking = false;
			if (alarm[4] = -1){ alarm[4] = burp_after_time; }
		}
		
	#endregion
}