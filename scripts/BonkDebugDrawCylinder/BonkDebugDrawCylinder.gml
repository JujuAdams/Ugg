/// @param x
/// @param y
/// @param z
/// @param height
/// @param radius
/// @param [color]

function BonkDebugDrawCylinder(_x, _y, _z, _height, _radius, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    __UGG_GLOBAL
    
    var _worldMatrix = matrix_get(matrix_world);
    var _matrix = matrix_build(_x, _y, _z,   0, 0, 0,   _radius, _radius, _height);
        _matrix = matrix_multiply(_matrix, _worldMatrix);
    matrix_set(matrix_world, _matrix);
    
    shader_set(__shdBonk);
    shader_set_uniform_f(_global.__bonkUniform_shdBonk_u_vColor, color_get_red(  _color)/255,
                                                                 color_get_green(_color)/255,
                                                                 color_get_blue( _color)/255);
    vertex_submit(_global.__bonkCylinder, pr_trianglelist, -1);
    shader_reset();
    
    matrix_set(matrix_world, _worldMatrix);
}