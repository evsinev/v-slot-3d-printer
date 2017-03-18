cat openscad/frame.scad   \
    openscad/z-axis.scad  \
    openscad/corexy.scad  \
    MCAD/constants.scad   \
    MCAD/math.scad        \
    MCAD/motors.scad      \
    | grep -v "^include " \
    > build/x-slot-3d-printer-gen.scad

echo "main_frame(); z_axis(); corexy();" >> build/x-slot-3d-printer-gen.scad

cp openscad/main.json build/x-slot-3d-printer-gen.json
