x1 = x + 4;
y1 = y - 4;
x2 = x - 4;
y2 = y + 4;
x3 = x + 4;
y3 = y + 4;


//rise = (y2 * image_yscale) - (y1 * image_yscale);
//run = (x2 * image_xscale) - (x2 * image_xscale);
//slope = rise/run;
hypot = point_distance(x1, y1, x2, y2);
flatside = point_distance(x2, y2, x3, y3);
var _cos = cos(flatside/hypot);
//radian = slope * pi/180;
//var _argue = (slope-0)/(1 + (0 * slope));
angle = abs(arccos(flatside/hypot));
degree = (angle * 180) / pi;












