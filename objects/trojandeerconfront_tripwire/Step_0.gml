///@description just the trip wire
//the trojan deer object executes cutscene every step
if (instance_exists(Otrojandeer) && !global.cutsceneActive)
{
	if (place_meeting(x, y, Otrojandeer))
	{
		ex_cutscene("Trojan Deer Confront");
		instance_destroy();
	}
}























