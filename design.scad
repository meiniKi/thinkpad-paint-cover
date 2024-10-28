
// Dimensions of the elements
width = 0.6;
length = 8.0;
height = 2.5;

// Spacing between the elements
pitch_y = 11.3;
pitch_x = 3.0;

$fn=30;

module element(x, y) {
    translate([x, y, 0])
        union() {
            translate([width/2,width/2,0])
                cylinder(height, width/2.0, width/2.0, center=false); 
            translate([width/2,length-width/2,0])
                cylinder(height, width/2.0, width/2.0, center=false); 
            translate([0,width/2,0])
                cube([width, length-width, height], center=false);
            translate([0,length/2,0])
                cube([pitch_x+1,0.8,1], center=false);
        }
}

for (x = [0 : 40]) {
    union (){
        element(x*pitch_x, 0);
    }
}

// Not accurate, will be broken off after printing
// Adhesion
translate([0,-pitch_y/2+1,0])
    cube([5,15,0.5]);

// Adhesion
translate([119,-pitch_y/2+2,0])
    cube([5,15,0.5]);