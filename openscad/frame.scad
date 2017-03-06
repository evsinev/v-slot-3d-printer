
frame_x_beam_length  = 400;
frame_x_beam_width   = 20;
frame_x_beam_height  = 20;

frame_y_beam_length  = 400;
frame_y_beam_width   = 20;
frame_y_beam_height  = 20;

frame_support_width  = 20;
frame_support_height = 20;
frame_support_length = 550;

frame_width  = frame_support_width  * 2 + frame_x_beam_width;
frame_height = frame_support_height * 2 + frame_y_beam_width;
frame_depth  = frame_support_length;

frame_rear_y = frame_support_height + frame_support_height - frame_x_beam_width  + frame_y_beam_length;
frame_right_x = frame_y_beam_length + frame_support_width + frame_support_width - frame_y_beam_width;

module frame_x_beam() {
   color([1,0,0]) cube([frame_x_beam_length, frame_x_beam_width, frame_x_beam_height]);
}

module frame_y_beam() {
   color([0,1,0]) cube([frame_y_beam_width, frame_y_beam_length, frame_y_beam_height]);
}

module frame_support() {
    cube([frame_support_width, frame_support_height, frame_depth]);
}

module main_frame() {
    // support
    for(x=[0, frame_support_width + frame_x_beam_length]) {
        for(y=[0, frame_support_height + frame_y_beam_length]) {
            translate([x, y, 0 ])  frame_support();
        }
    }

    // front and rear beams
    for(y=[0, frame_support_height + frame_support_height - frame_x_beam_width  + frame_y_beam_length ])
        for(z=[0, frame_depth - frame_x_beam_height]) {
            translate([frame_support_width, y, z]) frame_x_beam();
    }

    // right and left beams
    for(x=[0, frame_y_beam_length + frame_support_width + frame_support_width - frame_y_beam_width])
        for(z=[0, frame_depth - frame_y_beam_height]) {
            translate([x, frame_support_height, z]) frame_y_beam();
    }
}

