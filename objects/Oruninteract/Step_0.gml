if (instance_exists(Oplayer))
{
	if (place_meeting(x, y, Oplayer) && Oplayer.state = PlayerStateRun)
	{
		parent.action();
		instance_destroy();
	}
}