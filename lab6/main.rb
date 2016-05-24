#!/usr/bin/env ruby

StepsLimit = 150

global_queue = []
n = 0
steps = 0

def distirbution
    return rand.round(4)
end

def schedule (event, queue)
    queue.push(event)
    queue.sort! {|a, b|
        a[:time] <=> b[:time]
    }
end

def simulate queue
    while queue.size > 0 do
        key = queue.shift
        p queue
        # у каждой задачи уменьшаем время оставшееся в очереди
        queue.each { |element| element[:time] -= key[:time] }
        print " minus #{ key[:time]}\n"
        p queue
        key[:call].call(queue)
        queue.delete(key)
    end
end

E2 = Proc.new { |queue|
    if steps >= StepsLimit
        next
    end
    steps += 1
    n -= 1
    print "E2 n is #{n}\n"
    schedule({:time => distirbution, :call => E2}, queue)
}

E1 = Proc.new do |queue|
    if steps >= StepsLimit
        next
    end
    steps += 1
    n += 1
    print "E1 n is #{n} \n"
    schedule({:time => distirbution, :call => E1}, queue)
end

schedule({:time => distirbution, :call => E2}, global_queue)
schedule({:time => distirbution, :call => E1}, global_queue)
p global_queue

simulate(global_queue)
print "Steps is #{steps}"
