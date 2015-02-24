function retry(count, body)
    local success = false
    code = coroutine.create(body)
    for i = 1, count do
        succeeded, value = coroutine.resume(code)

        if value ~= nil then
            print(value)
            code = coroutine.create(body)
        else
            success = true
            break
        end
    end

    if success == false then
        print("exceeded retry count")
    end
end

math.randomseed(os.time())

retry(5,
    function()
        if math.random() > 0.2 then
            coroutine.yield('Something bad happened')
        end
        print('Succeeded')
    end)