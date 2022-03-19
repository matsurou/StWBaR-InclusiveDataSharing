local function DtB( double_in )

    local sign = ( double_in > 0) and 1 or -1
    local exponent = math.floor( math.log( sign * double_in, 2 ) ) - 53 + 512
    local mantissa = math.floor( sign * double_in * ( 2 ^ ( - exponent + 512 ) ) )

    local boolMat_out = {}

    boolMat_out[1] = ( sign == 1 )
    for i = 0, 9 do
        boolMat_out[ i + 2 ] = ( exponent & 2 ^ i ~= 0 )
    end
    for i = 0, 51 do
        boolMat_out[ i + 12 ] = ( mantissa & 2 ^ i ~= 0 )
    end

    return boolMat_out
end
