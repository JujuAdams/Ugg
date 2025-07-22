// Feather disable all

/// @param steps

function __UggPrebuildWireframeSphere(_steps)
{
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, __Ugg().__wireframeVertexFormat);
    
    var _phi    = 180 / _steps;
    var _length = dsin(_phi);
    var _z      = dcos(_phi);
    
    var _x2 = _length;
    var _y2 = 0;
    
    var _i = 1;
    repeat(_steps+1)
    {
        var _x1 = _x2;
        var _y1 = _y2;
        
        var _theta = 360*(_i / (_steps+1));
        _x2 =  _length*dcos(_theta);
        _y2 = -_length*dsin(_theta);
        
        vertex_position_3d(_vertexBuffer,   0,   0,  1); vertex_color(_vertexBuffer, c_white, 1);
        vertex_position_3d(_vertexBuffer, _x1, _y1, _z); vertex_color(_vertexBuffer, c_white, 1);
        
        vertex_position_3d(_vertexBuffer, _x1, _y1, _z); vertex_color(_vertexBuffer, c_white, 1);
        vertex_position_3d(_vertexBuffer, _x2, _y2, _z); vertex_color(_vertexBuffer, c_white, 1);
        
        vertex_position_3d(_vertexBuffer,   0,   0,  -1); vertex_color(_vertexBuffer, c_white, 1);
        vertex_position_3d(_vertexBuffer, _x1, _y1, -_z); vertex_color(_vertexBuffer, c_white, 1);
        
        vertex_position_3d(_vertexBuffer, _x1, _y1, -_z); vertex_color(_vertexBuffer, c_white, 1);
        vertex_position_3d(_vertexBuffer, _x2, _y2, -_z); vertex_color(_vertexBuffer, c_white, 1);
        
        ++_i;
    }
    
    //Borrow values from the cap calculations
    var _lengthB = _length;
    var _zB      = _z;
    
    var _j = 2;
    repeat(_steps-2)
    {
        var _lengthA = _lengthB;
        var _zA      = _zB;
        
        var _phi     = 180*(_j / _steps);
        var _lengthB = dsin(_phi);
        var _zB      = dcos(_phi);
        
        var _x2A = _lengthA;
        var _y2A = 0;
        var _x2B = _lengthB;
        var _y2B = 0;
        
        var _i = 1;
        repeat(_steps+1)
        {
            var _x1A = _x2A;
            var _y1A = _y2A;
            var _x1B = _x2B;
            var _y1B = _y2B;
            
            var _theta = 360*(_i / (_steps+1));
            var _cos = dcos(_theta);
            var _sin = dsin(_theta);
            _x2A =  _lengthA*_cos;
            _y2A = -_lengthA*_sin;
            _x2B =  _lengthB*_cos;
            _y2B = -_lengthB*_sin;
            
            vertex_position_3d(_vertexBuffer, _x1A, _y1A, _zA); vertex_color(_vertexBuffer, c_white, 1);
            vertex_position_3d(_vertexBuffer, _x2A, _y2A, _zA); vertex_color(_vertexBuffer, c_white, 1);
            
            vertex_position_3d(_vertexBuffer, _x2A, _y2A, _zA); vertex_color(_vertexBuffer, c_white, 1);
            vertex_position_3d(_vertexBuffer, _x2B, _y2B, _zB); vertex_color(_vertexBuffer, c_white, 1);
            
            vertex_position_3d(_vertexBuffer, _x2B, _y2B, _zB); vertex_color(_vertexBuffer, c_white, 1);
            vertex_position_3d(_vertexBuffer, _x1B, _y1B, _zB); vertex_color(_vertexBuffer, c_white, 1);
            
            vertex_position_3d(_vertexBuffer, _x1B, _y1B, _zB); vertex_color(_vertexBuffer, c_white, 1);
            vertex_position_3d(_vertexBuffer, _x1A, _y1A, _zA); vertex_color(_vertexBuffer, c_white, 1);
            
            ++_i;
        }
        
        ++_j;
    }
    
    /*
    var _rows = 0.5*_steps + 0.5;
    
    // Create sin and cos tables
    var _cc;
    var _ss;
    _cc[_steps] = 0;
    _ss[_steps] = 0;
    
    for( var _i = 0; _i <= _steps; _i++)
    {
        var _rad = _i*360/_steps;
        _cc[_i] = dcos(_rad);
        _ss[_i] = dsin(_rad);
    }
    
    for(var _j = 0; _j < _rows; _j++)
    {
        var _row1rad = (_j  )*180/_rows;
        var _row2rad = (_j+1)*180/_rows;
        var _rh1 = dcos(_row1rad);
        var _rd1 = dsin(_row1rad);
        var _rh2 = dcos(_row2rad);
        var _rd2 = dsin(_row2rad);
        
        var _i = 0;
        var _this_a = [_rd1*_cc[_i], _rd1*_ss[_i], _rh1,    _rd1*_cc[_i], _rd1*_ss[_i], _rh1];
        var _this_b = [_rd2*_cc[_i], _rd2*_ss[_i], _rh2,    _rd2*_cc[_i], _rd2*_ss[_i], _rh2];
        
        for(var _i = 1; _i <= _steps; _i++ )
        {
            var _prev_a = _this_a;
            
            var _this_a = [_rd1*_cc[_i], _rd1*_ss[_i], _rh1,    _rd1*_cc[_i], _rd1*_ss[_i], _rh1];
            var _this_b = [_rd2*_cc[_i], _rd2*_ss[_i], _rh2,    _rd2*_cc[_i], _rd2*_ss[_i], _rh2];
            
            vertex_position_3d(_vertexBuffer, _this_a[0], _this_a[1], _this_a[2]); vertex_color(_vertexBuffer, c_white, 1);
            vertex_position_3d(_vertexBuffer, _this_b[0], _this_b[1], _this_b[2]); vertex_color(_vertexBuffer, c_white, 1);
            
            vertex_position_3d(_vertexBuffer, _prev_a[0], _prev_a[1], _prev_a[2]); vertex_color(_vertexBuffer, c_white, 1);
            vertex_position_3d(_vertexBuffer, _this_a[0], _this_a[1], _this_a[2]); vertex_color(_vertexBuffer, c_white, 1);
        }
    }
    */
    
    vertex_end(_vertexBuffer);
	vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}