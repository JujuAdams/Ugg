if (showDepth)
{
    shader_set(shdLinearizeDepth);
    shader_set_uniform_f(shader_get_uniform(shdLinearizeDepth, "u_fZNear"), zNear);
    shader_set_uniform_f(shader_get_uniform(shdLinearizeDepth, "u_fZFar"), zFar);
    draw_surface_depth(application_surface, 0, 0);
    shader_reset();
}