/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param [color]
/// @param [thickness]

function UggLine(_x1, _y1, _z1, _x2, _y2, _z2, _color = UGG_DEFAULT_DIFFUSE_COLOR, _thickness = UGG_LINE_THICKNESS)
{
    __UGG_GLOBAL
    __UGG_COLOR_UNIFORMS
    static _volumeLine            = _global.__volumeLine;
    static _wireframeVertexFormat = _global.__wireframeVertexFormat;
    static _staticMatrix          = matrix_build_identity();
    
    if (_global.__wireframe)
    {
    	var _vertexBuffer = vertex_create_buffer();
    	vertex_begin(_vertexBuffer, _wireframeVertexFormat);
        
    	vertex_position_3d(_vertexBuffer, _x1, _y1, _z1); vertex_color(_vertexBuffer, c_white, 1);
    	vertex_position_3d(_vertexBuffer, _x2, _y2, _z2); vertex_color(_vertexBuffer, c_white, 1);
        
    	vertex_end(_vertexBuffer);
        
        shader_set(__shdUggWireframe);
        shader_set_uniform_f(_shdUggWireframe_u_vColor, color_get_red(  _color)/255,
                                                        color_get_green(_color)/255,
                                                        color_get_blue( _color)/255);
        vertex_submit(_vertexBuffer, pr_linelist, -1);
        
        vertex_delete_buffer(_vertexBuffer);
    }
    else
    {
        var _dx = _x2 - _x1;
        var _dy = _y2 - _y1;
        var _dz = _z2 - _z1;
        
        var _length = sqrt(_dx*_dx + _dy*_dy + _dz*_dz);
        if (_length == 0) return false;
        
        if ((_dx == 0) && (_dy == 0) && (abs(_dz) == _length))
        {
            var _ix = 0;
            var _iy = _thickness;
            var _iz = 0;
        }
        else
        {
            var _ix = 0;
            var _iy = 0;
            var _iz = _thickness;
        }
        
        _staticMatrix[@  0] = (_dz*_iy - _dy*_iz) / _length;
        _staticMatrix[@  1] = (_dx*_iz - _dz*_ix) / _length;
        _staticMatrix[@  2] = (_dy*_ix - _dx*_iy) / _length;
        
        _staticMatrix[@  4] = _ix;
        _staticMatrix[@  5] = _iy;
        _staticMatrix[@  6] = _iz;
        
        _staticMatrix[@  8] = _dx;
        _staticMatrix[@  9] = _dy;
        _staticMatrix[@ 10] = _dz;
        
        _staticMatrix[@ 12] = _x1;
        _staticMatrix[@ 13] = _y1;
        _staticMatrix[@ 14] = _z1;
        
        matrix_stack_push(_staticMatrix);
        matrix_set(matrix_world, matrix_stack_top());
        
        shader_set(__shdUggVolume);
        shader_set_uniform_f(_shdUggVolume_u_vColor, color_get_red(  _color)/255,
                                                     color_get_green(_color)/255,
                                                     color_get_blue( _color)/255);
        vertex_submit(_volumeLine, pr_trianglelist, -1);
        
        matrix_stack_pop();
        matrix_set(matrix_world, matrix_stack_top());
    }
    
    shader_reset();
}