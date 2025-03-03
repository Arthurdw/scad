// Generic 3.5 inch caddy part
$fa = 1;
$fs = 0.1;

// Hard drive size
hdd_length = 145;
hdd_height = 20;

// Left and right screw offsets relative to the center screw
hdd_screw_l_off = 41;
hdd_screw_r_off = 60;
hdd_screw_radius = 1.5;
hdd_screw_inner_radius = 1;
hdd_screw_inner_depth = 3;

hdd_screw_offset = 5;

// Thickness of the base
thickness = 5;

// Connection offset
c = 0.001;

connected_length = hdd_length - 31;
connected_height = hdd_height - 6;

// Notch
notch_length = 10;
notch_top = notch_length / 3;

linear_extrude(thickness) polygon([
    [ 0, notch_top ], [ notch_length, 0 ], [ notch_length, connected_height ],
    [ 0, connected_height - notch_top ]
]);

// Screw holes
module screw_hole(location) {
    translate([ location, connected_height / 2, 0 ])
        cylinder(h = thickness * 1.1, r = hdd_screw_radius, center = true);
    translate([ location, connected_height / 2, thickness ])
        cylinder(h = thickness * 1.1, r = hdd_screw_radius * 2, center = true);
}

// Base
difference() {
    translate([ notch_length - c, 0, 0 ])
        cube([ connected_length - notch_length, connected_height, thickness ]);

    screw_hole(hdd_screw_offset + hdd_screw_l_off);
    screw_hole(hdd_screw_offset + hdd_screw_r_off);
}

// Latch
latch_length = 25;
latch_thickness = 2;
latch_lock_width = 7.5;

translate([ connected_length, 0, thickness * 0.6 ]) {
    rotate([ 0, -15, 0 ])
        cube([ latch_length, connected_height, latch_thickness ]);

    difference() {
        translate([
            (latch_length / 2) - latch_lock_width / 2,
            (connected_height / 2) - (latch_lock_width / 2), thickness / 2
        ]) {
            difference() {
                cube([ latch_lock_width, latch_lock_width, thickness * 2 ]);

                translate([
                    -latch_lock_width * 0.1, -latch_lock_width * 0.1,
                    (latch_lock_width * tan(10))
                ]) rotate([ 0, -30, 0 ])
                    cube([
                        latch_lock_width * 2, latch_lock_width * 1.2,
                        thickness * 2
                    ]);
            }
        }
        translate([ 0, 0, -2 ]) rotate([ 0, -15, 0 ])
            cube([ latch_length, connected_height, latch_thickness ]);
    }
}

// Drive screw pins
translate([
    hdd_screw_offset, (connected_height / 2), (-hdd_screw_inner_depth) + c
]) {
    cylinder(h = hdd_screw_inner_depth, r = hdd_screw_inner_radius);
}

translate([
    hdd_screw_offset + hdd_screw_l_off + hdd_screw_r_off,
    (connected_height / 2), (-hdd_screw_inner_depth) +
    c
]) {
    cylinder(h = hdd_screw_inner_depth, r = hdd_screw_inner_radius);
}
