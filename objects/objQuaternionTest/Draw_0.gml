matrix_set(matrix_world, UggMatrixTranslate(x, y, 0, UggQuatGetRotationMatrix(quaternion)));
UggAABB(0, 0, 0, 100, 150, 200, c_white);
UggMatrixResetWorld();