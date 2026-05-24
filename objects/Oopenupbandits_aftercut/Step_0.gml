if (instance_exists(Ointeractbox))
{
	if (place_meeting(x, y, Ointeractbox))
	{
		if (!instance_exists(Otextbox) && !global.gamePaused && !Ocluehunt.cluehunt_active && !Ocluehunt.trans_to_battle)
		{
			create_textbox("openupbandits_aftercut");
		}
	}
}






















