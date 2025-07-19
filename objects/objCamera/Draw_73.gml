//Reset draw state
matrix_set(matrix_world, oldWorldMatrix);
matrix_set(matrix_view, oldViewMatrix);
matrix_set(matrix_projection, oldProjMatrix);

gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);
gpu_set_cullmode(cull_noculling);