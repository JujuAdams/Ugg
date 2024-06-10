if (showDepth)
{
    shader_set(shdLinearizeDepth);
    shader_set_uniform_f(shader_get_uniform(shdLinearizeDepth, "u_fZNear"), 1);
    shader_set_uniform_f(shader_get_uniform(shdLinearizeDepth, "u_fZFar"), 1000);
    draw_surface_depth(application_surface, 0, 0);
    shader_reset();
}