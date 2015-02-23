
--[[Using Lua’s built-in OO syntax, write a class called Queue that implements
a first-in, first-out (FIFO) queue as follows:
– q = Queue.new() returns a new object.
– q:add(item) adds item past the last one currently in the queue.
– q:remove() removes and returns the first item in the queue, or nil if the
queue is empty.]]

Queue = {
    fifo ={},
    start =0,
    last = -1 }

function Queue:new()
    local obj = setmetatable({}, self)
    self.__index = self
    return obj
end
function Queue:add(item)
    self.last = self.last + 1
    self.fifo[self.last] =item
end

function Queue:remove()
    if(self.start > self.last) then
        return nil
    else
        local result = self.fifo[self.start]
        self.fifo[self.start] = nil
        self.start = self.start +1
        return result
    end

end


q = Queue:new()
q:add("ab")
q:add("cd")
q:add("ef")
print(q:remove())
print(q:remove())
print(q:remove())
print(q:remove())
q:add("gh")
print(q:remove())
print(q:remove())
q:add("ij")
print(q:remove())
