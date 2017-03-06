include <frame.scad>
include <MCAD/motors.scad>

z_axis_nema_width = 46;
z_axis_nema_depth = 40;
z_axis_top_offset = 100;
z_axis_vertical_support_length = 350;
z_axis_vertical_support_width  = 20;
z_axis_vertical_support_height = 20;

module z_axis_vertical_support() {
    color([0,0,1])
    cube([z_axis_vertical_support_width, z_axis_vertical_support_height, z_axis_vertical_support_length]);
}

module z_axis_ball_screw_support() {
    // ball screw support
    for(y=[0, frame_rear_y]) {
        translate([frame_support_width, y, frame_depth - z_axis_top_offset]) frame_x_beam();
        translate([frame_support_width, y, frame_depth - z_axis_top_offset - z_axis_vertical_support_length - frame_x_beam_height ]) frame_x_beam();
        translate([100, y, frame_depth - z_axis_top_offset - z_axis_vertical_support_length ]) z_axis_vertical_support();
        translate([300, y, frame_depth - z_axis_top_offset - z_axis_vertical_support_length ]) z_axis_vertical_support();
    }

}


module z_axis_nema_support() {
    z = 100;
   // y
    translate([0, frame_support_height, z]) frame_y_beam();
    translate([frame_right_x, frame_support_height, z]) frame_y_beam();

   // x
   translate([frame_support_width, frame_y_beam_length / 2 - z_axis_nema_width/2, z]) frame_x_beam();
   translate([frame_support_width, frame_y_beam_length / 2 + z_axis_nema_width, z]) frame_x_beam();

    translate([frame_support_width + z_axis_nema_width/2
            , frame_y_beam_length / 2 + z_axis_nema_width/2
            , z + z_axis_nema_depth / 2])
            stepper_motor_mount(17);

}

module z_axis() {

    z_axis_ball_screw_support();
    z_axis_nema_support();

}

