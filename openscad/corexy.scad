include <frame.scad>
include <MCAD/motors.scad>

/* [CoreXY] */

corexy_beams_offset = 80;
corexy_nema_width   = 40;

module corexy() {
    // left motor
    translate([frame_y_beam_width + corexy_nema_width/2, frame_x_beam_width + corexy_nema_width/2, frame_depth - frame_x_beam_height ])
        rotate([180, 0, 0])
            stepper_motor_mount(17);

    // right motor
    translate([frame_y_beam_length , frame_x_beam_width + corexy_nema_width/2, frame_depth - frame_x_beam_height ])
        rotate([180, 0, 0])
            stepper_motor_mount(17);

    // front beam
    translate([frame_support_width, frame_support_width + corexy_nema_width, frame_depth - frame_x_beam_height]) frame_x_beam();

    // left and right beams for rails
    translate([0, frame_support_height, frame_depth - corexy_beams_offset ]) frame_y_beam();
    translate([frame_right_x, frame_support_height, frame_depth - corexy_beams_offset ]) frame_y_beam();
}