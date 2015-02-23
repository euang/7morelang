--[[ Using coroutines, write a fault-tolerant function retry(count, body) that works
as follows:
– Call the body() function.
– If body() yields a string with coroutine.yield(), consider this an error message
and restart body() from its beginning.
– Don’t retry more than count times; if you exceed count, print an error
message and return.
– If body() returns without yielding a string, consider this a success.

Example usage:
retry(
    5,
    function()
        if math.random() > 0.2 then
            coroutine.yield('Something bad happened')
        end
        print('Succeeded')
    end
)
Most of the time, the inner function will fail; retry() should keep trying until
it’s achieved success or tried five times.
Hint: You may need to create more than one coroutine.]]

function retry(count, body)
    code = coroutine.create(body)
    succeeded, value = coroutine.resume(code)

    if value
    print(value)

end

math.randomseed(os.time())

retry(
    5,
    function()
        if math.random()> 0.2 then
            coroutine.yield('Something bad happened')
        end
        print('Succeeded')
    end
)