function woodshopflavor_text(_text_id){
	switch (_text_id)
	{
		case "woodshop_plotlog":
			Text("No longer protecting the plot, this tired log decides to rest here.");
				pause(30, 30, 10);
		break;
		
		case "woodshop_workbench":
			Text("Now where could that hammer have gone...", "Hoots Think");
		break;
		
		case "woodshop_bed":
			Text("Is it possible your hammer is amidst all this fluff?", "Hoots Curious");
			Text("Maybe...&I'm always losing track of it...", "Clawdine Depressed");
				pause(8, 8, 10);
		break;
		
		case "woodshop_charliesearch":
			Text("I'm searching over here if you want to look elsewhere.", "Charlie Curious");
		break;
	}
}