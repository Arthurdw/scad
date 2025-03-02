$fa = 1;
$fs = 0.1;

weel_radius = 8;

axile_x_offset = 20;

scale([ 1, 1, 1 ]) {
    // Car body
    rotate([ 5, 0, 0 ]) {
        cube([ 60, 20, 10 ], center = true);
        translate([ 5, 0, 10 - 0.001 ]) cube([ 30, 20, 10 ], center = true);
    }

    // Front weels
    translate([ -axile_x_offset, -15, -4 ]) rotate([ 90, 0, -15 ])
        cylinder(h = 3, r = weel_radius, center = true);
    translate([ -axile_x_offset, 15 - 0.001, -4 ]) rotate([ 90, 0, -15 ])
        cylinder(h = 3, r = weel_radius, center = true);

    // Back weels
    translate([ axile_x_offset, -15 + 0.001, -4 ]) rotate([ 90, 0, 0 ])
        cylinder(h = 3, r = weel_radius, center = true);
    translate([ axile_x_offset, 15 - 0.001, -4 ]) rotate([ 90, 0, 0 ])
        cylinder(h = 3, r = weel_radius, center = true);

    // Connection axle's
    translate([ axile_x_offset, 0, -4 + 0.001 ]) rotate([ 90, 0, 0 ])
        cylinder(h = 30, r = 1.5, center = true);
    translate([ -axile_x_offset, 0, -4 + 0.001 ]) rotate([ 90, 0, 0 ])
        cylinder(h = 30, r = 1.5, center = true);
}
