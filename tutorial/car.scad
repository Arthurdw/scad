$fa = 1;
$fs = 0.4;

// Car body
cube([ 60, 20, 10 ], center = true);
translate([ 5, 0, 10 - 0.001 ]) cube([ 30, 20, 10 ], center = true);

// Front weels
translate([ -20, -11.5 + 0.001, -4 ]) rotate([ 90, 0, 0 ])
    cylinder(h = 3, r = 8, center = true);
translate([ -20, 11.5 - 0.001, -4 ]) rotate([ 90, 0, 0 ])
    cylinder(h = 3, r = 8, center = true);

// Back weels
translate([ 20, -11.5 + 0.001, -4 ]) rotate([ 90, 0, 0 ])
    cylinder(h = 3, r = 8, center = true);
translate([ 20, 11.5 - 0.001, -4 ]) rotate([ 90, 0, 0 ])
    cylinder(h = 3, r = 8, center = true);

// Connection axle's
translate([ 20, 0, -5 + 0.001 ]) cube([ 5, 20, 5 ], center = true);
translate([ -20, 0, -5 + 0.001 ]) cube([ 5, 20, 5 ], center = true);
