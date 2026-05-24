path = -1;


x = 80;
y = 32;
image_alpha = 0;

//GENERAL VARIABLES
///HP
	hp_total = 40;
	hp_current = hp_total;
///FACE
	emotion = "happy";
	face = Sbigsparkboss_smileface;
	face_dir = 0;
	face_xscale = 1;
	face_yscale = 1;
	sweat_index = 0;

//VARIABLES FOR STATES
///GENERAL
	state = BigSparkStateSpawn; //starting state
	reset_atk_vars = function(){
		attacking = false;
		shooting = false;
		atk_chosen = 0;
	}
	reset_atk_vars();
	atk_performed = 0;
	being_attacked = false;
///GO TO CENTER
	reset_goingtocenter_vars = function() {
		goingtocenter = false;
		gotocenter_origin_x = 0;
		gotocenter_origin_y = 0;
		gotocenter_target_x = 80;
		gotocenter_target_y = 32;
		gotocenter_speed_mod = 0;
		gotocenter_speed_mod_curve_percent = 0;
		gotocenter_speed_mod_curve = animcurve_get_channel(bigsparkboss_zoommod_animcurve, "curve1");
	}
	reset_goingtocenter_vars();
///TIRED
	tired_time = 3 * FRAME_RATE;
//LAUGH
	reset_laugh_vars = function() {
		laughed = false;
		laugh_time = 15;
		laugh_next_state = BigSparkStateIdle;
	}
	reset_laugh_vars();
///ATK_ZOOM
	reset_zoom_atk_vars = function(){
		zooming = false;
		zoom_origin_x = 0;
		zoom_origin_y = 0;
		zoom_target_x = 0;
		zoom_target_y = 0;
		zoom_cur_corner = 0;
		zoom_available_corners = [1, 2, 3, 4];
		zoom_travel_time = 15;
		zoom_speed_mod = 0;
		zoom_speed_mod_curve_percent = 0;
		zoom_speed_mod_curve = animcurve_get_channel(bigsparkboss_zoommod_animcurve, "curve1");
		zoom_warning_block_time = 10; //how long warning is (in frames)
		zoom_warning_block_alpha = -1;
		zoom_warning_block_dir = 0;
		zoom_shoot_time = 20;
		zoom_shoot_gap_time_const = 1;
		zoom_shoot_gap_time = 0;
		zoom_shots = 0;
		zoom_max_shots = 3;
		
		//sound effect
		if (audio_is_playing(snd_machinegun)){ audio_stop_sound(snd_machinegun); }
	}
	reset_zoom_atk_vars();
///ATK BURP
	reset_burp_atk_vars = function(){
		preburp = false;
		preburp_time = 15;
		burp_shots = 0;
		burp_max_shots = 3;
		burp_after_time = 15;
		burp_explode_range = [15, 60];
		
		//stop preburp sfx
		if (audio_is_playing(snd_rumble)){ audio_stop_sound(snd_rumble); }
	}
	reset_burp_atk_vars();
///ATK DVD
	reset_dvd_atk_vars = function(){
		dvd_set = false;
		dvd_time = 3 * FRAME_RATE;
		dvd_speed_mod = 0;
		dvd_speed_mod_curve_percent = 0;
		dvd_speed_mod_curve = animcurve_get_channel(bigsparkboss_zoommod_animcurve, "curve1");
		dvd_wind_up_time = 20;
		dvd_speed_choice = 4;
		damage = 2;
		hspeed = 0;
		vspeed = 0;
		image_angle = 0;
	}
	dvd_bullet_body_alpha = 0;
	reset_dvd_atk_vars();
	
	







