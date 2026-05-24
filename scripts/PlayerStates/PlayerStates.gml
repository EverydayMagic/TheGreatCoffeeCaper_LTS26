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