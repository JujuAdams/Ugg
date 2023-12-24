// Feather disable all

function __UggPrebuildCone()
{
	var _vertexBuffer = vertex_create_buffer();
	vertex_begin(_vertexBuffer, __Ugg().__vertexFormat);
    
	var _bx = 1;
	var _by = 0;
    
    var _incr = 360 / UGG_CYLINDER_STEPS;
    var _angle = _incr;
    repeat(UGG_CYLINDER_STEPS)
    {
        var _cos = dcos(_angle);
        var _sin = dsin(_angle);
        
	    var _ax = _bx;
	    var _ay = _by;
	    var _bx = _cos;
	    var _by = _sin;
        
        //Bottom cap
	    vertex_position_3d(_vertexBuffer,   0  , 0, 0); vertex_normal(_vertexBuffer, 0, 0, -1);
	    vertex_position_3d(_vertexBuffer, _bx, _by, 0); vertex_normal(_vertexBuffer, 0, 0, -1);
	    vertex_position_3d(_vertexBuffer, _ax, _ay, 0); vertex_normal(_vertexBuffer, 0, 0, -1);
        
        //Wall
	    vertex_position_3d(_vertexBuffer, _ax, _ay, 0); vertex_normal(_vertexBuffer, 0.70710678118*_ax, 0.70710678118*_ay, 0.70710678118);
	    vertex_position_3d(_vertexBuffer, _bx, _by, 0); vertex_normal(_vertexBuffer, 0.70710678118*_bx, 0.70710678118*_by, 0.70710678118);
	    vertex_position_3d(_vertexBuffer,   0,   0, 1); vertex_normal(_vertexBuffer, 0.70710678118*_ax, 0.70710678118*_ay, 0.70710678118);
        
        _angle += _incr;
	}

	vertex_end(_vertexBuffer);
	vertex_freeze(_vertexBuffer);
	return _vertexBuffer;
}