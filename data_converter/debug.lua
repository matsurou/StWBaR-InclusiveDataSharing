local numberOfTrials = 128
local boolMat_in = {}
local boolMat_out = {}
local doubleFloat = 0
local errorCount = 0
local erroredValue = {}
local isErrored


for trial = 1, numberOfTrials do

    for i = 1, 63 do
        table.insert(
            boolMat_in, i, os.clock()
        )
    end

    doubleFloat = BtD(boolMat_in)
    boolMat_out = DtB(doubleFloat)


    isErrored = false
    for i = 1, 63 do
        isErrored = ( ( boolMat_in[i] ~= boolMat_out ) or ( isErrored ) )
    end

    if ( isErrored == true ) then
        table.insert(
            erroredValue, doubleFloat
        )
        errorCount = errorCount + 1
    end

end


print( 'error count :' .. tostring(errorCount) )

if ( errorCount ~= 0) then
    for i, v in ipairs(erroredValue) do
        print('error detected with the doubleFloat :' .. v)
    end
end
