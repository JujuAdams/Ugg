matrix_set(matrix_world, matrix_build(0, 0, 300,   0, 0, 45,   1, 1, 1));
UggFrustrum(viewMatrix, projMatrix);
matrix_set(matrix_world, matrix_build_identity());