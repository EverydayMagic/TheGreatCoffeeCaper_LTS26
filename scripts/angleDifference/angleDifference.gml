/*
	usage:
		diff = angleDifference(angle1,angle2);
	
	given:
		angle1		first direction in degrees, real
		angle2		second direction in degrees, real
	
	returns:
		difference of the given angles in degrees, -180 to 180
*/
function angleDifference(){
	return ((((argument[0] - argument[1]) mod 360) + 540) mod 360) - 180;
}