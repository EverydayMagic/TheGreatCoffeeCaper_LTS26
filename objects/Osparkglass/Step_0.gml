keyUp = InputCheck(INPUT_VERB.UP);
keyDown = InputCheck(INPUT_VERB.DOWN);
keyLeft = InputCheck(INPUT_VERB.LEFT);
keyRight = InputCheck(INPUT_VERB.RIGHT);
keySelect = InputPressed(INPUT_VERB.SELECT);

var _move_x = 0;
var _move_y = 0;

_move_x += spd * (keyRight - keyLeft);
_move_y += spd * (keyDown - keyUp);

repeat (abs(_move_x)){
	if (!place_meeting(x + sign(_move_x), y, Ocol)){
		x += sign(_move_x);
	}
}

repeat (abs(_move_y)){
	if (!place_meeting(x, y + sign(_move_y), Ocol)){
		y += sign(_move_y);
	}
}
/*
if (place_meeting(x + _h_spd_dir, y, Ocol)){ h_spd = 0; }
if (place_meeting(x, y + _v_spd_dir, Ocol)){ v_spd = 0; }

x += h_spd * _h_spd_dir;
y += v_spd * _v_spd_dir;