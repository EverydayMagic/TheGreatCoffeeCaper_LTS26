
function set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//variables for every letter/character
	for (var c = 0; c < 200; c++)
		{
			color_1[c, page_number] = white_col;
			color_2[c, page_number] = white_col;
			color_3[c, page_number] = white_col;
			color_4[c, page_number] = white_col;
			
			float_text[c, page_number] = 0;
			float_dir[c, page_number] = c*20;
			
			shake_text[c, page_number] = 0;
			shake_dir[c, page_number] = irandom(360);
			shake_timer[c, page_number] = irandom(4);
			
			pausing[c, page_number] = 0;
			text_pause_count_onpage[page_number] = 0;
			
			//text_pause_time[c] = 0;
			
			skipping[page_number] = 0;
			
			auto_move[page_number] = 0;
			auto_move_input_allowed[page_number] = true;
			next_box_time[page_number] = 0;
			
			inline_spr[c, page_number] = noone;
		}
	
	txtb_spr[page_number] = global.txtbox;
	speaker_sprite[page_number] = noone;
	speaker_imgindex[page_number] = 0;
	speaker_side[page_number] = 1;
	talkturn[page_number] = false;
	talkturn_inst[page_number] = 0;
	ovr_spr[page_number] = 0;
	txtspd_change[page_number] = false;
	txtsnd_change[page_number] = false;
	snd_change[page_number] = noone;
	//This is for voice sounds (default voice sound)
	snd[page_number] = default_voice;
	snd_pitch[page_number] = 1;
	//To implement this you can go to the character's case statement and add
	//snd[page_number] = example_voice_1;
	txtbubble_spr[page_number] = 0;
	txtbubble_obj[page_number] = noone;
	txtbubble_active[page_number] = false;
	
}


//- - - - - - text VFX - - - - - - -//
///@param 1st_char
///@param last_char
///@param color1
///@param color2
///@param color3
///@param color4
function text_color(_start, _end, _color1, _color2, _color3, _color4){
	
	for (var c = _start; c<= _end; c++)
		{
			color_1[c, page_number-1] = _color1;
			color_2[c, page_number-1] = _color2;
			color_3[c, page_number-1] = _color3;
			color_4[c, page_number-1] = _color4;
		}
}

///@param 1st_char
///@param last_char
function text_wave(_start, _end){
	
	for (var c = _start; c<= _end; c++)
		{
			float_text[c, page_number-1] = true;
		}
	
}

///@param 1st_char
///@param last_char
function text_shake(_start, _end){
	
	for (var c = _start; c<= _end; c++)
		{
			shake_text[c, page_number-1] = true;
		}
	
}

///@param 1st_char
///@param last_char
///@param [length]
function pause(_start, _end){

	for (var c = _start; c <= _end; c++)
	{
		var _length = 10;
		pausing[c, page_number - 1] = true;
		text_pause_count_onpage[page_number - 1]++;
		if (argument_count > 2)
		{
			_length = argument[2];
			if (_length mod 1 = 0)
			{
				text_pause_time[text_pause_count] = _length;
				text_pause_count++;
			} else {
				show_error("PAUSE ARGUMENT TYPE NOT SUPPORTED!", false);	
			}
		} else {
			text_pause_time[text_pause_count] = _length;
			text_pause_count++;
		}
		
	}
}

function skip(){
	
	skipping[page_number - 1] = true;
	
}

///@param length_in_frames
function auto(_length, _input = false){
	
	auto_move[page_number - 1] = true;
	auto_move_input_allowed[page_number - 1] = _input;
	next_box_time[page_number - 1] = _length;
	
}

function talk_turn(_obj, _spr, _img_index = -1, _flip = false, _text_char = 0)
{
	talkturn[page_number - 1] = true;
	var _img_spd = 1;
	if (_img_index != -1){ _img_spd = 0; }
	
	if (_text_char > 0)
	{
		for (var i = 0; i < _text_char; i++)
		{
			ovr_spr[page_number - 1][talkturn_inst[page_number - 1]][i] = 0;	
		}
	}
	
	ovr_spr[page_number - 1][talkturn_inst[page_number - 1]][_text_char] = {
		obj: _obj,
		spr: _spr,
		img_index: _img_index,
		img_spd: _img_spd,
		flip: _flip,
	}
	
	talkturn_inst[page_number - 1]++;
}

///@param _object
///@param _zero_dir
///@param _one_dir
///@param _two_dir
///@param _three_dir
///@param [_sprite]
function talk_turn_auto(_object){
	var _player = Oplayer;
	if (!instance_exists(_player))
	{
		if (instance_exists(Ohoots_cutscene))
		{
			_player = Ohoots_cutscene;	
			
		} else return false;
	}
	
	var _sprite = -1;
	if (argument_count = 6){ _sprite = argument[5]; }
	
	var _player_dir = round(_player.direction/90);
	
	if (_sprite = -1)
	{
		_object.sprite_index = argument[(_player_dir + 1)];
	} else {
		_object.sprite_index = _sprite;
		_object.image_index = argument[(_player_dir + 1)];
		_object.image_speed = 0;
	}
}

function textspeed_change(_spd){
	txtspd_change[page_number - 1] = true;
	text_spd[page_number - 1] = _spd;
}

function textvoice_change(_sound, _pitch = 1){
	txtsnd_change[page_number - 1] = true;
	snd_change[page_number - 1] = _sound;
	snd_pitch[page_number - 1] = _pitch;
}

function textbox_change(_spr){
	if (sprite_exists(_spr))
	{
		txtb_spr[page_number - 1] = _spr;	
	}
}


///This makes it easier to create lines of text
//Use Text("line of dialogue"); instead of text[0]="line of dialogue";
///@param text
///@param *face*
function Text(_text){

			set_defaults_for_text();
			text[page_number] = _text

			//get character info
			if argument_count > 1 {
				//speaker_sprite[page_number] = argument[1];
				if (is_string(argument[1]))
				{
					
					switch(argument[1])
					{	
						/////////////////////
						//Hootsworth No Hat//
						/////////////////////
						
							case "No Hat Hoots Regular": 
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 0;
							break;	
							case "No Hat Hoots Drowsy":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "No Hat Hoots Sleep":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "No Hat Hoots Starry":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "No Hat Hoots Curious":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "No Hat Hoots Read":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "No Hat Hoots Read Shocked":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 6;
							break;
							case "No Hat Hoots Read Flabergasted":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 7;
							break;
							case "No Hat Hoots Yawn":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 8;
							break;
							case "No Hat Hoots Happy":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 9;
							break;
							case "No Hat Hoots Shocked":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 10;
							break;
							case "No Hat Hoots Wide-Eyed":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_nocap_faces;
								speaker_imgindex[page_number] = 11;
							break;
							
						///////////////////////		
						//Hootsworth With Hat//
						///////////////////////
						
							case "Hoots Regular": 
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Hoots Drowsy":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "Hoots Sleep":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "Hoots Shocked":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "Hoots Curious":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "Hoots Happy":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "Hoots Yawn":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 6;
							break;
							case "Hoots Harumph":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 7;
							break;
							case "Hoots Harumph Eye":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 8;
							break;
							case "Hoots Whisper":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 9;
							break;
							case "Hoots Mmph":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 10;
							break;
							case "Hoots PaperRead":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 11;
							break;
							case "Hoots PaperReadTrouble1":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 12;
							break;
							case "Hoots PaperReadTrouble2":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 13;
							break;
							case "Hoots Squint":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 14;
							break;
							case "Hoots Think":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 15;
							break;
							case "Hoots PaperReadSquint":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 16;
							break;
							case "Hoots Wide-Eyed":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 17;
							break;
							case "Hoots Mad":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 18;
							break;
							case "Hoots Yell":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 19;
							break;
							case "Hoots Eyes Closed":
								snd[page_number] = hoots_talk;
								speaker_sprite[page_number] = Shoots_faces;
								speaker_imgindex[page_number] = 20;
							break;
						
						/////////////////
						//Charlie Mouse//
						/////////////////
							case "Charlie Regular":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Charlie Distressed":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "Charlie Confused":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "Charlie Shocked":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "Charlie Curious":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "Charlie Happy":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "Charlie Red":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 6;
							break;
							case "Charlie Um":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 7;
							break;
							case "Charlie InterogativeBean":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 8;
							break;
							case "Charlie Interrogative":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 9;
							break;
							case "Charlie YellBean":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 10;
							break;
							case "Charlie UmActually":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 11;
							break;
							case "Charlie Whisper":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 12;
							break;
							case "Charlie PumpedFist":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 13;
							break;
							case "Charlie Pumped":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 14;
							break;
							case "Charlie Heh":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 15;
							break;
							case "Charlie PaperRead":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 16;
							break;
							case "Charlie PaperReadRed":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 17;
							break;
							case "Charlie DoorBang":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 18;
							break;
							case "Charlie SweatSmile":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 19;
							break;
							case "Charlie FacePalm":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 20;
							break;
							case "Charlie RedShocked":
								snd[page_number] = charlie_talk;
								speaker_sprite[page_number] = Scmouse_faces;
								speaker_imgindex[page_number] = 21;
							break;
						
						//////////////
						//Joe Turtle//
						//////////////
							case "Joe Regular":
								snd[page_number] = joe_voice;
								speaker_sprite[page_number] = Sjoeturtle_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Joe Shocked":
								snd[page_number] = joe_voice;
								speaker_sprite[page_number] = Sjoeturtle_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "Joe Wide-Eyed":
								snd[page_number] = joe_voice;
								speaker_sprite[page_number] = Sjoeturtle_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "Joe Scared":
								snd[page_number] = joe_voice;
								speaker_sprite[page_number] = Sjoeturtle_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "Joe Shell":
								snd[page_number] = joe_voice;
								speaker_sprite[page_number] = Sjoeturtle_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "Joe DarkMode Scared":
								snd[page_number] = joe_voice;
								speaker_sprite[page_number] = Sjoeturtle_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "Joe DarkMode Shocked":
								snd[page_number] = joe_voice;
								speaker_sprite[page_number] = Sjoeturtle_faces;
								speaker_imgindex[page_number] = 6;
							break;
						
						///////////
						//Jitters//
						///////////
							case "Jitters Regular":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Jitters Regular MouthAjar":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "Jitters Coffee":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "Jitters Calm":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "Jitters Wild":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "Jitters Wild MouthClose":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "Jitters Wah":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 6;
							break;
							case "Jitters Scary":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 7;
							break;	
							case "Jitters Distressed":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 8;
							break;
							case "Jitters Drool":
								snd[page_number] = jitters_voice;
								speaker_sprite[page_number] = Sjitters_faces;
								speaker_imgindex[page_number] = 9;
							break;
							
						////////////
						//Sniffles//
						////////////
							case "Sniffles Regular":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Sniffles Uh":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "Sniffles Ah":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "Sniffles Achoo":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "Sniffles Happy":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "Sniffles Yo":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "Sniffles YoThug":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 6;
							break;
							case "Sniffles...":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 7;
							break;
							case "Sniffles CrazyYell":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 8;
							break;
							case "Sniffles Crazy":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 9;
							break;
							case "Sniffles CrazyYellEyeClosed":
								snd[page_number] = sniffles_voice;
								speaker_sprite[page_number] = Ssniffles_faces;
								speaker_imgindex[page_number] = 10;
							break;
						
						/////////
						//Puffy//
						/////////
							case "Puffy Regular":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Puffy Happy":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "Puffy Irritated":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "Puffy Distressed":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "Puffy NoSmile":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "Puffy Angry":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "Puffy Dark":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 6;
							break;
							case "Puffy Thunder":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 7;
							break;
							case "Puffy Devious":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 8;
							break;
							case "Puffy ...":
								snd[page_number] = puffy_voice;
								speaker_sprite[page_number] = Spuffy_faces;
								speaker_imgindex[page_number] = 9;
							break;
						
						/////////
						//Stump//
						/////////
							case "Stump Regular":
								speaker_sprite[page_number] = Sstump_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Stump Love":
								speaker_sprite[page_number] = Sstump_faces;
								speaker_imgindex[page_number] = 1;
							break;
						
						////////////
						//Clawdine//
						////////////
							case "Clawdine Regular":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 0;
							break;
							case "Clawdine Happy":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 1;
							break;
							case "Clawdine HappyOpen":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 2;
							break;
							case "Clawdine BigSmile":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 3;
							break;
							case "Clawdine Stars":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 4;
							break;
							case "Clawdine Fire":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 5;
							break;
							case "Clawdine HmmCrossed":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 6;
							break;
							case "Clawdine HmmHips":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 7;
							break;
							case "Clawdine Depressed":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 8;
							break;
							case "Clawdine HappyNoStars":
								snd[page_number] = clawdine_voice;
								speaker_sprite[page_number] = Sclawdine_faces;
								speaker_imgindex[page_number] = 9;
							break;
					}
					
					if (argument_count > 2)
					{
						txtbubble_active[page_number] = true;
						txtbubble_obj[page_number] = argument[2];
						txtbubble_spr[page_number] = argument[3];	
						
					} else txtbubble_active[page_number] = false;
				} else {
					if (argument_count > 1)
					{
						txtbubble_active[page_number] = true;
						switch (argument[1])
						{
							default: txtbubble_obj[page_number] = argument[1];
						}
						switch (argument[2])
						{
							default: txtbubble_spr[page_number] = argument[2];	
						}
					} else txtbubble_active[page_number] = false;
				}
			}
	
			page_number++;
		//}
	//}

}

	
	


///@param text
///@param link_id
function Option(_text, _link_id){
	
	option[option_number] = _text;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}







///@param text_id
///@param *object*
///@param *bottom_of_screen?*
///@param *optioning*
function create_textbox(_text_id) {
	global.textActive = true;
	if (argument_count > 1)
	{
		if (argument[1] != 0 && argument[1] != 1)
		{
			if (!instance_exists(Otextbox))
			{
				with (instance_create_depth(0, 0, -bbox_bottom, Otextbox))
				{
					Otextbox.down = argument[2];
						
					Game_Text(_text_id);
					setup();
				}
			}
		} else {
			//if we are only telling it to go up or down on the screen
			if (argument_count = 2)
			{
				if (!instance_exists(Otextbox))
				{
					with (instance_create_depth(0, 0, -bbox_bottom, Otextbox))
					{
						Otextbox.down = argument[1];
							
						Game_Text(_text_id);
						setup();
					}
				}
					
			//if there are options on the textbox, we have to tell it to create the textbox even if one currently exists
			} else if (argument_count > 2) {
				if (is_string(argument[2]))
				{
					with (instance_create_depth(0, 0, -bbox_bottom, Otextbox))
					{
						Otextbox.down = argument[1];
						
						Game_Text(_text_id);
						setup();
					}
				}
			}
		}
	} else {
		if (!instance_exists(Otextbox))
		{
			with (instance_create_depth(0, 0, -bbox_bottom, Otextbox))
			{
				Game_Text(_text_id);
				setup();
			}
		}
	}
	
}

function debug_create_textbox(text, face) {
	global.textActive = true;
	if (!instance_exists(Otextbox))
	{
		with (instance_create_depth(0, 0, -bbox_bottom, Otextbox))
		{
			down = true;
			Text(text, face);
			setup();
		}
	}
}