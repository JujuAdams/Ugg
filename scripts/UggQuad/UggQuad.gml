/// @param x
/// @param y
/// @param z
/// @param xNormal
/// @param yNormal
/// @param zNormal
/// @param [color]

function UggQuad(_x, _y, _z, _xNormal, _yNormal, _zNormal, _color = UGG_DEFAULT_DIFFUSE_COLOR)
{
    __UGG_GLOBAL
    
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin( _vertexBuffer, _global.__uggVertexFormat);
    
    var _position = [_x, _y, _z];
    var _normal = UggVecNormalize([_xNormal, _yNormal, _zNormal]);
    
    if (!UggVecEqual(_normal, [0, 0, 1]) && !UggVecEqual(_normal, [0, 0, -1]))
    {
        var _tangent = UggVecCross(_normal, [0, 0, 1]);
    }
    else
    {
        var _tangent = UggVecCross(_normal, [1, 0, 0]);
    }
    
    var _bitangent = UggVecCross(_normal, _tangent);
    
    _tangent   = UggVecMultiply(_tangent,   UGG_PLANE_SIZE);
    _bitangent = UggVecMultiply(_bitangent, UGG_PLANE_SIZE);
    
    var _a = UggVecAdd(     UggVecAdd(     _position, _tangent), _bitangent);
    var _b = UggVecAdd(     UggVecSubtract(_position, _tangent), _bitangent);
    var _c = UggVecSubtract(UggVecAdd(     _position, _tangent), _bitangent);
    var _d = UggVecSubtract(UggVecSubtract(_position, _tangent), _bitangent);
    
    vertex_position_3d(_vertexBuffer, _a[0], _a[1], _a[2]); vertex_normal(_vertexBuffer, _xNormal, _yNormal, _zNormal);
    vertex_position_3d(_vertexBuffer, _b[0], _b[1], _b[2]); vertex_normal(_vertexBuffer, _xNormal, _yNormal, _zNormal);
    vertex_position_3d(_vertexBuffer, _d[0], _d[1], _d[2]); vertex_normal(_vertexBuffer, _xNormal, _yNormal, _zNormal);
    
    vertex_position_3d(_vertexBuffer, _a[0], _a[1], _a[2]); vertex_normal(_vertexBuffer, _xNormal, _yNormal, _zNormal);
    vertex_position_3d(_vertexBuffer, _d[0], _d[1], _d[2]); vertex_normal(_vertexBuffer, _xNormal, _yNormal, _zNormal);
    vertex_position_3d(_vertexBuffer, _c[0], _c[1], _c[2]); vertex_normal(_vertexBuffer, _xNormal, _yNormal, _zNormal);
    
    vertex_end(_vertexBuffer);
    
    shader_set(__shdUgg);
    shader_set_uniform_f(_global.__uggUniform_shdUgg_u_vColor, color_get_red(  _color)/255,
                                                                 color_get_green(_color)/255,
                                                                 color_get_blue( _color)/255);
    vertex_submit(_vertexBuffer, pr_trianglelist, -1);
    shader_reset();
    
    vertex_delete_buffer(_vertexBuffer);
}