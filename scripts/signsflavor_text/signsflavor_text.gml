function signsflavor_text(_text_id){
	switch(_text_id)
	{
		case "logoutsideclawdines":
			Text("It seems that this log is blocking your path to protect the plot.");
			if (instance_exists(Ocharliemouse))
			{
				Text("Charlie, what is a 'plot'?", "Hoots Curious");
					pause(18, 18, 5);
				Text("Let's just keep going Hootsworth...", "Charlie Confused");
			}
		break;
		
		case "sign_beforeneighborhood":
			Text("'Sniffles: yor howse iz thees way...&-Sniffles'");
				pause(33, 35, 5);
				pause(36, 36, 10);
		break;
		
		case "sign_outsidehooters":
			Text("'Detective Hootsworth's Mystery Solving Head... Headcoo... Headquar...'");
				pause(44, 46, 5);
				pause(47, 47, 10);
				pause(55, 57, 5);
				pause(58, 58, 10);
				pause(67, 69, 5);
			Text("What a difficult word...", "Hoots Curious");
		break;
		
		case "sign_outcoffeehouse":
			Text("'Cup O' Joe'");
		break;
		
		case "sign_stage":
			Text("'Talent show later today!'");
		break;
		
		case "sign_outchophouse":
			Text("'Clawdine's One Stop Wood Chop Shop'");
		break;
		
		case "sign_behind":
			Text("There's nothing written on the back.", "Hoots Regular");
		break;
	}
}