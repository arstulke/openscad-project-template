module halveObj(x, y, z, size) {
    translate_x = x ? -25: 0;
    translate_y = y ? -25: 0;
    translate_z = z ? -25: 0;

    size_x = x ? (size / 2) : size;
    size_y = y ? (size / 2) : size;
    size_z = z ? (size / 2) : size;

    intersection() {
        translate([translate_x, translate_y, translate_z]) {
            resize([size_x, size_y, size_z]) {
                cube(1, center=true);
            }
        }
        children();
    }
}

module ring(d_outer, d_inner, h) {
    difference() {
        anti_glitch(false, false, false) 
        cylinder(   d = d_outer,
                    h = h,
                    center = true);

        anti_glitch(false, false, true) 
        cylinder(   d = d_inner,
                    h = h,
                    center = true);
    }
}

module anti_glitch(x, y, z) {
    scale_factor = 1.01;
    x_scale = x ? scale_factor : 1;
    y_scale = y ? scale_factor : 1;
    z_scale = z ? scale_factor : 1;
    
    scale([ x_scale, y_scale, z_scale ]) 
        children();
}
