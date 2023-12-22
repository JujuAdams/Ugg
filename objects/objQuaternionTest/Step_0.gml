if (keyboard_check(ord("U"))) quaternion = QuatRotateLocalX(quaternion,  0.5);
if (keyboard_check(ord("J"))) quaternion = QuatRotateLocalX(quaternion, -0.5);
if (keyboard_check(ord("I"))) quaternion = QuatRotateLocalY(quaternion,  0.5);
if (keyboard_check(ord("K"))) quaternion = QuatRotateLocalY(quaternion, -0.5);
if (keyboard_check(ord("O"))) quaternion = QuatRotateLocalZ(quaternion,  0.5);
if (keyboard_check(ord("L"))) quaternion = QuatRotateLocalZ(quaternion, -0.5);