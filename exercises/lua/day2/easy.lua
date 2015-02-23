function concatenate(a1, a2)
    local result = a1
    local a1length = #a1
    for i = 1, #a2 do
        result[a1length + i] = a2[i]
    end

    return result
end


arg = {
    [1] = "t1",
    [2] = "t2"
}
print(concatenate(arg,arg)[4])

function attachadd(t, key, value)
    setmetatable(value, { __add = concatenate })
    rawset(t, key, value)
end

setmetatable(_G, {__newindex = attachadd })
a1 = { 1, 2, 3 }
a2 = { 324, 4 }
print(#(a1 + a2))

