--
-- Created by IntelliJ IDEA.
-- User: euan
-- Date: 02/12/2014
-- Time: 12:18
-- To change this template use File | Settings | File Templates.
--
function ends_in_3(num)
    if (string.sub(num, -1) == '3') then
        return true
    else
        return false
    end
end

function is_prime(num)
    for i = num - 1, 2, -1 do
        local result = num / i
        local integral , fractional = math.modf(result)
        if (fractional == 0) then
            return false
        end
    end
    return true
end

function print_primes(num)
    local count = 0
    local prime = 1
    while count < num do
        if is_prime(prime) then
            if ends_in_3(prime) then
                print(prime)
                count = count + 1
            end
        end
        prime = prime + 1
    end
end

print(ends_in_3(23))
print('is prime? - ' .. tostring(is_prime(8)))
print_primes(25)


function for_loop(a, b, f)
    local index = a
    while index <= b do
        f(index)
        index = index + 1
    end
end

function p(i)
    print(i)
end

for_loop(10, 15, p)

function reduce(max, init, f)
    local result=init
    for i = init, max do
        result = f(result,i)
    end
    return result
end

function add(previous, next)
    return previous + next
end

function multiply(previous,next)
    return previous * next
end

function factorial(num)
    return reduce(num,1,multiply)
end

print(reduce(5, 0, add))
print(factorial(9))
