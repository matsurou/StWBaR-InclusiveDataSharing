local function BtD( boolMat_out )

    local sign = boolMat_out[1] and 1 or -1

    local exponent = 0
    for i = 0, 9 do
        exponent = exponent + ( boolMat_out[ i + 2 ] and 2 ^ i or 0 )
    end

    local mantissa = 2 ^ 53
    for i = 0, 51 do
        mantissa = mantissa + ( boolMat_out[ i + 12 ] and 2 ^ i or 0 )
    end

    local double_out = sign * mantissa * ( 2 ^ ( exponent - 512 ) )

    return double_out
end
