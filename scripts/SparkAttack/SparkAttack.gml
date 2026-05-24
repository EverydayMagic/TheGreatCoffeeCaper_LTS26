
function spark_attack(_atk, _parent){
	
	switch (_atk.name)
	{	
		case "DefaultPew":
			with (instance_create_depth(_parent.x, _parent.y, _parent.depth - 50, Ospark_defaultbullet))
			{
				direction = _parent.pt_dir;
				parent = _parent;
				image_xscale = _parent.image_xscale;
				image_yscale = _parent.image_yscale;
				
				switch (_parent.class)
				{
					case "normal": damage = 17; break;
					case "hard": damage = 3; break;
					case "realhard": damage = 3; break;
				}
				if (_parent.emotion = "scared"){ damage = round(damage/2); }
			}
		break;
		
		#region Normal Spark
		
			case "FastPew":
				with (instance_create_depth(_parent.x, _parent.y, _parent.depth - 50, Ospark_defaultbullet))
				{
					direction = _parent.pt_dir;
					image_xscale = _parent.image_xscale;
					image_yscale = _parent.image_yscale;
					parent = _parent;	
					spd = 0.3;
					min_dist = 24;
					damage = 17;
				}
			break;
		
			case "SpawnFlick":
				with (instance_create_depth(_parent.x, _parent.y, _parent.depth - 50, Ospark_flick))
				{
					direction = _parent.pt_dir;
					image_xscale = _parent.image_xscale;
					image_yscale = _parent.image_yscale;
					parent = _parent;
					state = FlickStateFly;
				}
			break;
		
		#endregion
		
		#region Hard Spark
			
			case "BounceBullet":
				with (instance_create_depth(_parent.x * 1, _parent.y * 1, _parent.depth - 50, Ospark_bouncebullet))
				{
					direction = _parent.pt_dir;
					image_xscale = _parent.image_xscale;
					image_yscale = _parent.image_yscale;
					parent = _parent;
				}
			break;
			
			case "BulletWall":
				with (instance_create_depth(_parent.x, _parent.y, _parent.depth - 50, Ospark_bulletwall_manager))
				{
					direction = _parent.pt_dir;
					image_xscale = _parent.image_xscale;
					image_yscale = _parent.image_yscale;
					parent = _parent;
				}
			break;
			
		#endregion
		
		#region RealHard Spark
			
			case "BombRain":
				with (instance_create_depth(_parent.x, _parent.y, _parent.depth - 50, Ospark_bombrain))
				{
					image_xscale = _parent.image_xscale;
					image_yscale = _parent.image_yscale;
					parent = _parent;	
					spd = 4;
					damage = 6;
				}
			break;
			
			case "MineRain":
				with (instance_create_depth(_parent.x, _parent.y, _parent.depth - 50, Ospark_minerain))
				{
					image_xscale = _parent.image_xscale;
					image_yscale = _parent.image_yscale;
					parent = _parent;
					spd = 4;
					damage = 2;
				}
			break;
		
		#endregion
	}
}