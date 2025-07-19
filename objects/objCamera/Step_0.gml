//Various toggles on the function keys
if (keyboard_check_released(vk_f1)) showInfo = !showInfo;
if (keyboard_check_released(vk_f2)) showDepth = !showDepth;
if (keyboard_check_released(vk_f3)) UggSetWireframe(not UggGetWireframe());
if (keyboard_check_released(vk_f4)) window_set_fullscreen(!window_get_fullscreen());

//Lock the mouse if we left click
if (mouse_check_button_released(mb_left))
{
    mouseLock = !mouseLock;
    mouseLockTimer = 0;
    
    //Hide the mouse if we're locked
    window_set_cursor(mouseLock? cr_none : cr_default);
}

//Always unlock the mouse if we press escape
if (mouseLock && keyboard_check_pressed(vk_escape))
{
    mouseLock = false;
    mouseLockTimer = 0;
    
    //Hide the mouse if we're locked
    window_set_cursor(cr_default);
}

//If we've got the mouse locked...
if (mouseLock)
{
    //Figure out where the centre of the window is
    var _centreX = window_get_width()/2;
    var _centreY = window_get_height()/2;
    
    //Increment a timer. Once that timer reaches 5, start pitching/panning the camera
    //There's a little bit of lag between pressing F3 and the mouse actually
    //centring in the window - this timer stops the camera freaking out!
    ++mouseLockTimer;
    if (mouseLockTimer > 4)
    {
        
        var _dX = window_mouse_get_x() - _centreX;
        var _dY = window_mouse_get_y() - _centreY;
        camYaw   -= 0.1*_dX;
        camPitch -= 0.1*_dY;
        
        camPitch = clamp(camPitch, -89, 89); //Make sure we can't gimbal lock the camera
    }
    
    //Now move the mouse
    window_mouse_set(_centreX, _centreY);
}

////Figure out where the camera is looking
camDX =  dcos(camYaw)*dcos(camPitch);
camDY = -dsin(camYaw)*dcos(camPitch);
camDZ =  dsin(camPitch);

//Move parallel/perpendicular to the camera
var _para = 2*(keyboard_check(ord("W")) - keyboard_check(ord("S")));
var _perp = 2*(keyboard_check(ord("A")) - keyboard_check(ord("D")));
var _sin  = dsin(camYaw);
var _cos  = dcos(camYaw);

camX +=  _para*_cos - _perp*_sin;
camY += -_para*_sin - _perp*_cos;
camZ += 2*(keyboard_check(vk_space) - keyboard_check(vk_shift));

//Calculate matrices that we'll want to use later
viewMatrix = matrix_build_lookat(camX, camY, camZ,
                                 camX+camDX, camY+camDY, camZ+camDZ,
                                 0, 0, 1);
projMatrix = matrix_build_projection_perspective_fov(90, room_width/room_height, zNear, zFar);