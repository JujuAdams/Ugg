var _camZ     = 200;
var _camYaw   = 120;
var _camPitch = -45;
var _camDX    =  dcos(_camYaw)*dcos(_camPitch);
var _camDY    = -dsin(_camYaw)*dcos(_camPitch);
var _camDZ    =  dsin(_camPitch);

viewMatrix = matrix_build_lookat(x, y, _camZ,
                                 x + _camDX, y + _camDY, _camZ + _camDZ,
                                 0, 0, 1);
projMatrix = matrix_build_projection_perspective_fov(90, room_width/room_height, 10, 400);