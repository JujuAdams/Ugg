if (keyboard_check(ord("U"))) quaternion = UggQuatRotateLocalX(quaternion,  0.5);
if (keyboard_check(ord("J"))) quaternion = UggQuatRotateLocalX(quaternion, -0.5);
if (keyboard_check(ord("I"))) quaternion = UggQuatRotateLocalY(quaternion,  0.5);
if (keyboard_check(ord("K"))) quaternion = UggQuatRotateLocalY(quaternion, -0.5);
if (keyboard_check(ord("O"))) quaternion = UggQuatRotateLocalZ(quaternion,  0.5);
if (keyboard_check(ord("L"))) quaternion = UggQuatRotateLocalZ(quaternion, -0.5);