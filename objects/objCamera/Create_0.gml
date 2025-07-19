//Mouse lock variables (press F3 to lock the mouse and use mouselook)
mouseLock      = false;
mouseLockTimer = 0;

//F1 toggles the info panel
showInfo  = true;
showDepth = false;

camera = new ClassCamera()
         .SetPosition(450, 230, 200)
         .SetRotation(120, -45)
         .SetPerspective(90, room_width/room_height, 1, 2_000);