/// @param vector
/// @param coefficient

function UggVecMultiply(_a, _scale)
{
    return [ _scale*_a[0],
             _scale*_a[1],
             _scale*_a[2] ];
}