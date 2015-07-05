// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <bearing.scad>
use <polyholes.scad>
rod_distance = 45;

module x_end_base(){
// Main block
height = 58;
translate(v=[-15,9,height/2]) cube(size = [17,39,height], center = true);
// Bearing holder
 vertical_bearing_base();	
//Nut trap
 // Cube
 translate(v=[-3.45,-18,7.5]) cube(size = [13,16,15], center = true);
 // Hexagon
 translate(v=[0,-30,0]) rotate([0,0,30]) cylinder(h = 15, r=11.5, $fn = 6);
 //Brace
 translate([0,-10,15]) rotate([45,0,0]) cube([4,20,20], center=true);
}

module x_end_holes(){
 vertical_bearing_holes();
// Belt hole
translate(v=[-1,0,0]){
// Stress relief
translate(v=[-5.5-10+1.5,-10-1,30]) cube(size = [20,1,28], center = true);
difference(){
	translate(v=[-5.5-10+1.5,-10,30]) cube(size = [10,100,28], center = true);

	

	// Nice edges
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,45,0]) cube(size = [10,100,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,-45,0]) cube(size = [10,100,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,45,0]) cube(size = [10,100,28], center = true);
	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,-45,0]) cube(size = [10,100,28], center = true);

}
}

// Bottom pushfit rod
translate(v=[-15,-41.5,6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,68);
// Top pushfit rod
translate(v=[-15,-41.5,rod_distance+6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,68);
// Nut trap
 translate(v=[0,-30,6.8]) poly_cylinder(h = 20, r=10/2, $fn=25);
 translate(v=[0,-30,-0.5]) rotate([0,0,30]) cylinder(h = 7, r=15.2/2, $fn = 6);
}


// Final prototype
module x_end_plain(){
 difference(){
  x_end_base();
  x_end_holes();
 }
}

x_end_plain();


module pushfit_rod(diameter,length){
 poly_cylinder(h = length, r=diameter/2);
 difference(){
 	translate(v=[0,-diameter/2.85,length/2]) rotate([0,0,45]) cube(size = [diameter/2,diameter/2,length], center = true);
 	translate(v=[0,-diameter/4-diameter/2-0.4,length/2]) rotate([0,0,0]) cube(size = [diameter,diameter/2,length], center = true);
 }
 //translate(v=[0,-diameter/2-2,length/2]) cube(size = [diameter,1,length], center = true);
}

