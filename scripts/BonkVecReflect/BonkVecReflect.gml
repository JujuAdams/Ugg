/// @param vector
/// @param normal

function UggVecReflect(_vector, _normal)
{
    return UggVecSubtract(_vector, UggVecMultiply(_normal, 2*UggVecDot(_vector, _normal)));
}