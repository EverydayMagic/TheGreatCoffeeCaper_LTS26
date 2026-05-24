/// @description create countdown obj
var txt = "";
switch (beat)
{
	case 9: txt = "3"; break;
	case 12: txt = "2"; break;
	case 15: txt = "1"; break;
}


with (instance_create_depth(0, 0, -bbox_bottom, Ocluebattle_countdown))
{
	text = txt;
}
countdown_texted++;

















