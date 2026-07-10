function PlayerStateFree(){

//Movement
if (Oladder.ladder = true)
{
	hSpeed = speedWalkH;
	vSpeed = speedWalkV;
	//hSpeed = lengthdir_x(inputMagnitude*speedWalkH, inputDirection);
	//vSpeed = lengthdir_y(inputMagnitude*speedWalkV, inputDirection);
} else {
	hSpeed = round(speedWalkH);
	vSpeed = round(speedWalkV);
	//hSpeed = round(lengthdir_x(inputMagnitude*speedWalkH, inputDirection));
	//vSpeed = round(lengthdir_y(inputMagnitude*speedWalkV, inputDirection));
}

PlayerCollision();

//Update Sprite Index
image_xscale = 1;
var _oldSprite = sprite_index;
if (inputMagnitude != 0){
	if (Oladder.ladder != true)
		direction = inputDirection;
	sprite_index = spriteWalk;
} else sprite_index = spriteIdle;
if (_oldSprite != sprite_index)
	localFrame = 0;
	
//Updating Image Index
PlayerAnimateSprite();

}

function PlayerStateLocked(){
	//do nothing
}

function PlayerStateSleep(){
	beating = true;
	switch (beat)
	{
		case 0:
			if (global.playerIdle = Splayer_idle)
				sprite_index = Splayer_nocapsit_sleep;
			else
				sprite_index = Splayer_capsit_sleep;
			
			image_speed = 1;
		break;
	}
}

function PlayerStateRun(){
	
	//hoots hops up, charlie moves to old hoots pos
	//they run in hoots direction, constantly checking for collision
	//if collide, hoots falls back to party point, charlie stops where he is
	//party point resets
	switch (beat)
	{
		case 0:
			beating = true;
			//switch to fliping sprite
			switch (CARDINAL_DIR)
			{
				case 0: sprite_index = Splayer_flip_side; break;
				case 1: sprite_index = Splayer_flip_b; break;
				case 2: sprite_index = Splayer_flip_side; image_xscale = -1; break;
				case 3: sprite_index = Splayer_flip_f; break;
			}
			image_speed = 2;
			if (image_index >= image_number - 1)
			{
				image_speed = 0;
				beat++;	
			}
		break;
		case 1:
			switch (CARDINAL_DIR)
			{
				case 0: sprite_index = Splayer_cmouse_run_side; break;
				case 1: sprite_index = Splayer_cmouse_run_b; break;
				case 2: sprite_index = Splayer_cmouse_run_side; image_xscale = -1; break;
				case 3: sprite_index = Splayer_cmouse_run_f; break;
			}
			image_speed = 1;
			
			beat++;
		break;
		case 2:
			var _spd = 2;
			switch (CARDINAL_DIR)
			{
				case 0: hSpeed = _spd; vSpeed = 0; break;
				case 1: hSpeed = 0; vSpeed = -_spd; break;
				case 2: hSpeed = -_spd; vSpeed = 0; break;
				case 3: hSpeed = 0; vSpeed = _spd; break;
			}
			
			if (PlayerCollision())
			{
				beat = 3;

				with (Oscreenshake)
				{
					shake = true;
					shake_time = 10;
					shake_magnitude = 0.5;
					shake_fade = 0.25;
					dontadd = true;
				}
			}
		break;
		case 3:
			//hoots falls off
			switch (CARDINAL_DIR)
			{
				case 0: sprite_index = Splayer_cmouse_run_hootsfall_side; break;
				case 1: sprite_index = Splayer_cmouse_run_hootsfall_b; break;
				case 2: sprite_index = Splayer_cmouse_run_hootsfall_side; image_xscale = -1; break;
				case 3: sprite_index = Splayer_cmouse_run_hootsfall_f; break;
			}
			//change hoots pos
			var _xmod = 0;
			var _ymod = 0;
			switch (CARDINAL_DIR)
			{
				case 0: _ymod = -8; break;
				case 1: _ymod = -9; break
				case 2: _ymod = -8; break;
				case 3: _ymod = -9; break;
			}
			Ocharliemouse.visible = true;
			Ocharliemouse.x = x;
			Ocharliemouse.y = y;
			
			x += _xmod;
			y += _ymod;
			
			beat = 4;
		break;
		case 4:
			//hoots falls to party point
			if (instance_exists(Opartypoint))
			{
				if (!instance_exists(Opath_arc) && (x != Opartypoint.x || y != Opartypoint.y))
				{
					var _x = x;
					var _y = y;
					
					with (Opartypoint){ freeze_point = true; }
					
					with (instance_create_depth(0, 0, 0, Opath_arc))
					{
						curving = true;
						x1 = _x;
						y1 = _y;
						x2 = Opartypoint.x;
						y2 = Opartypoint.y;
						curve_height = 16;
						max_points_per_side = 4;
						obj = Oplayer;
						spd = 4;
						cut_dontadd = true;
						destroy_afterward = true;
					}
				} else if (x = Opartypoint.x && y = Opartypoint.y) {
					state = PlayerStateFree;
					Opartypoint_manager.reset_points();
					beat = 0;
					beating = false;
					with (Opartypoint){ freeze_point = false; }
				}
			}
		break;
	}
	
}