//depth stuff
if (instance_exists(Otextbox))
	depth = Otextbox.depth + 1;
else
	depth = Omenu.depth + 1;

	
//Movement of Leaves
var _settingsmenu_active = false;
if (!Ocluehunt.cluehunt_active && !_settingsmenu_active)
{
	if (image_alpha > 0)
		image_alpha += 0.1;
		
	if (x > 0 && y < camera_get_view_height(VIEW))
	{
		if (!instance_exists(Ofade))
		{
			x -= 0.75;
			y += 0.5;
		}
	} else instance_destroy();	
} else if (!_settingsmenu_active){
	if (image_alpha > 0)
		image_alpha -= 0.1;
}





