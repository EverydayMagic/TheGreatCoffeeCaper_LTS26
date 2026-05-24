///@description what characters in room?
global.char_in_room = [];
for (var i = 0; i < array_length(global.char_list); i++)
{
	if (instance_exists(global.char_list[i]))
	{
		array_push(global.char_in_room, global.char_list[i]);
	}
}
alarm_set(0, 1);















