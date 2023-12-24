// Feather disable all

/// @param viewMatrix
/// @param projMatrix

function CbFrustrumCoordsGet(_viewMatrix, _projMatrix)
{
    static _result = {
        tlNear: undefined,
        trNear: undefined,
        blNear: undefined,
        brNear: undefined,
        tlFar:  undefined,
        trFar:  undefined,
        blFar:  undefined,
        brFar:  undefined,
    };
    
    var _vpMatrixInverse = __CbMatrixInvert(matrix_multiply(_viewMatrix, _projMatrix));
    
    with(_result)
    {
        tlNear = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse, -1, -1, 0, 1);
        trNear = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse,  1, -1, 0, 1);
        blNear = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse, -1,  1, 0, 1);
        brNear = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse,  1,  1, 0, 1);
        
        tlFar  = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse, -1, -1, 1, 1);
        trFar  = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse,  1, -1, 1, 1);
        blFar  = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse, -1,  1, 1, 1);
        brFar  = __UggMatrixTransformVertex4DDivW(_vpMatrixInverse,  1,  1, 1, 1);
    }
    
    return _result;
}