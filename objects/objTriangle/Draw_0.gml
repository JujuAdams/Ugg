matrix_set(matrix_world, matrix_build(0, 0, 300,   0, 0, 45,   1, 1, 1));
UggTriangle(x, y, 0,
            x + 100, y, 20,
            x, y + 120, -20);
matrix_set(matrix_world, matrix_build_identity());