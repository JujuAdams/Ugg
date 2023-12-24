/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2
/// @param [arrowSize]
/// @param [color]
/// @param [thickness]

function UggArrow(_x1, _y1, _z1, _x2, _y2, _z2, _arrowSize = undefined, _color = UGG_DEFAULT_DIFFUSE_COLOR, _thickness = UGG_LINE_THICKNESS)
{
    //TODO - Optimise
    
    if (_arrowSize == undefined) _arrowSize = 4*_thickness;
    
    static _line    = __Ugg().__line;
    static _pyramid = __Ugg().__pyramid;
    __UGG_COLOR_UNIFORM
    
    var _dx = _x2 - _x1;
    var _dy = _y2 - _y1;
    var _dz = _z2 - _z1;
    
    var _length = sqrt(_dx*_dx + _dy*_dy + _dz*_dz);
    if (_length == 0) return false;
    if (_length < _arrowSize)
    {
        _length = 0;
        
        var _ax = _x1;
        var _ay = _y1;
        var _az = _z1;
    }
    else
    {
        var _factor = (_length - _arrowSize) / _length;
        _length -= _arrowSize;
        
        var _ax = _x1 + _factor*_dx;
        var _ay = _y1 + _factor*_dy;
        var _az = _z1 + _factor*_dz;
    }
    
    var _planeLength = sqrt(_dx*_dx + _dy*_dy);
    var _zAngle = point_direction(0, 0, _planeLength, _dz);
    var _pAngle = point_direction(0, 0, _dx, _dy);
    
    var _worldMatrix = matrix_get(matrix_world);
    
    shader_set(__shdUgg);
    shader_set_uniform_f(_shdUgg_u_vColor, color_get_red(  _color)/255,
                                           color_get_green(_color)/255,
                                           color_get_blue( _color)/255);
                                           
    var _matrix = matrix_build(0,0,0,   0,0,0,   _thickness, _thickness, _length);
        _matrix = matrix_multiply(_matrix, matrix_build(0,0,0,   0, -90 - _zAngle, 0,   1,1,1));
        _matrix = matrix_multiply(_matrix, matrix_build(0,0,0,   0, 0, _pAngle,   1,1,1));
        _matrix = matrix_multiply(_matrix, matrix_build(_x1, _y1, _z1,   0,0,0,   1,1,1));
        _matrix = matrix_multiply(_matrix, _worldMatrix);
    matrix_set(matrix_world, _matrix);
    vertex_submit(_line, pr_trianglelist, -1);
    
    var _matrix = matrix_build(0,0,0,   0,0,0,   _arrowSize, _arrowSize, _arrowSize);
        _matrix = matrix_multiply(_matrix, matrix_build(0,0,0,   0, -90 - _zAngle, 0,   1,1,1));
        _matrix = matrix_multiply(_matrix, matrix_build(0,0,0,   0, 0, _pAngle,   1,1,1));
        _matrix = matrix_multiply(_matrix, matrix_build(_ax, _ay, _az,   0,0,0,   1,1,1));
        _matrix = matrix_multiply(_matrix, _worldMatrix);
    matrix_set(matrix_world, _matrix);
    vertex_submit(_pyramid, pr_trianglelist, -1);
    
    shader_reset();
    matrix_set(matrix_world, _worldMatrix);
}