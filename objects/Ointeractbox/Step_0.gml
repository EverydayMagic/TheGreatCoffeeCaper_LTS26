if (!global.debugActive)
{ 
	visible = false; 
} else {
	if (instance_exists(Odebugperst))
	{
		visible = Odebugperst.ibox;	
	}
}
