#!/usr/bin/env ruby

global_queue = []
n = 0

def schedule (event, queue)
    queue.push(event)
    queue = queue.sort {|a, b|
        a[:time] <=> b[:time]
    }
end

def simulate queue
    p queue
    queue.each do |key|
        print "trying to call "
        p key
        key[:call].call(queue)
    end
end

E2 = Proc.new { |queue|
    n -= 1
    print "E2 n is #{n}\n"
    if n < 3
        exit
    end
    schedule({:time => rand.round(2), :call => E2}, queue)
}

E1 = Proc.new do |queue|
    n += 1
    if n > 3
        exit
    end
    print "E1 n is #{n} \n"
    schedule({:time => rand.round(2), :call => E1}, queue)
end

schedule({:time => rand.round(2), :call => E1}, global_queue)
schedule({:time => rand.round(2), :call => E2}, global_queue)
simulate(global_queue)
