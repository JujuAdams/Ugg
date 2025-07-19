/// Draws an axis-aligned bounding box
/// 
/// @param  xCentre   x-coordinate of the centre of the AABB
/// @param  yCentre   y-coordinate of the centre of the AABB
/// @param  zCentre   z-coordinate of the centre of the AABB
/// @param  xSize     Size of the AABB in the x-axis
/// @param  ySize     Size of the AABB in the y-axis
/// @param  zSize     Size of the AABB in the z-axis
/// @param  [color]   Colour of the AABB (standard GameMaker 24-integer)

function UggAABB(_x, _y, _z, _xSize, _ySize, _zSize, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    __UGG_GLOBAL
    __UGG_COLOR_UNIFORMS
    static _volumeAABB    = _global.__volumeAABB;
    static _wireframeAABB = _global.__wireframeAABB;
    
    static _staticMatrix = [1, 0, 0, 0,
                            0, 1, 0, 0,
                            0, 0, 1, 0,
                            0, 0, 0, 1];
    
    _staticMatrix[@  0] = _xSize;
    _staticMatrix[@  5] = _ySize;
    _staticMatrix[@ 10] = _zSize;
    _staticMatrix[@ 12] = _x;
    _staticMatrix[@ 13] = _y;
    _staticMatrix[@ 14] = _z;
    
    matrix_stack_push(_staticMatrix);
    matrix_set(matrix_world, matrix_stack_top());
    
    if (_global.__wireframe)
    {
        shader_set(__shdUggWireframe);
        shader_set_uniform_f(_shdUggWireframe_u_vColor, color_get_red(  _color)/255,
                                                        color_get_green(_color)/255,
                                                        color_get_blue( _color)/255);
        vertex_submit(_wireframeAABB, pr_linelist, -1);
        shader_reset();
    }
    else
    {
        shader_set(__shdUggVolume);
        shader_set_uniform_f(_shdUggVolume_u_vColor, color_get_red(  _color)/255,
                                                     color_get_green(_color)/255,
                                                     color_get_blue( _color)/255);
        vertex_submit(_volumeAABB, pr_trianglelist, -1);
        shader_reset();
    }
    
    matrix_stack_pop();
    matrix_set(matrix_world, matrix_stack_top());
}