// Feather disable all

/// @param frustrum
/// @param [color]
/// @param [thickness]

function UggFrustrumManual(_frustrum, _color = undefined, _thickness = undefined)
{
    with(_frustrum)
    {
        UggLine(tlNear.x, tlNear.y, tlNear.z,   trNear.x, trNear.y, tlNear.z, _color, _thickness);
        UggLine(blNear.x, blNear.y, blNear.z,   brNear.x, brNear.y, brNear.z, _color, _thickness);
        UggLine(tlNear.x, tlNear.y, tlNear.z,   blNear.x, blNear.y, blNear.z, _color, _thickness);
        UggLine(trNear.x, trNear.y, trNear.z,   brNear.x, brNear.y, brNear.z, _color, _thickness);
        
        UggLine(tlFar.x, tlFar.y, tlFar.z,   trFar.x, trFar.y, tlFar.z, _color, _thickness);
        UggLine(blFar.x, blFar.y, blFar.z,   brFar.x, brFar.y, brFar.z, _color, _thickness);
        UggLine(tlFar.x, tlFar.y, tlFar.z,   blFar.x, blFar.y, blFar.z, _color, _thickness);
        UggLine(trFar.x, trFar.y, trFar.z,   brFar.x, brFar.y, brFar.z, _color, _thickness);
        
        UggLine(tlNear.x, tlNear.y, tlNear.z,   tlFar.x, tlFar.y, tlFar.z, _color, _thickness);
        UggLine(blNear.x, blNear.y, blNear.z,   blFar.x, blFar.y, blFar.z, _color, _thickness);
        UggLine(tlNear.x, tlNear.y, tlNear.z,   tlFar.x, tlFar.y, tlFar.z, _color, _thickness);
        UggLine(trNear.x, trNear.y, trNear.z,   trFar.x, trFar.y, trFar.z, _color, _thickness);
    }
}