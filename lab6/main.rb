#!/usr/bin/env ruby

StepsLimit = 1500

global_queue = []
n = 0
steps = 0
file = File.open("log.txt", 'w');
t = 0
histohram = Hash.new(0)

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
        # у каждой задачи уменьшаем время оставшееся в очереди
        queue.each { |element| element[:time] -= key[:time] }
        # print " minus #{ key[:time]}\n"
        # p queue
        p key
        key[:call].call(queue)
        # queue.delete(key)
    end
end

E2 = Proc.new { |queue|
    if steps >= StepsLimit
        next
    end
    steps += 1
    t+= 1
    n -= 1
    if n == 0
        histohram[t] += 1
        t = 0
    end
    file.print("#{steps} #{n}\n")
    schedule({:name => "E2", :time => distirbution, :call => E2}, queue)
}

E1 = Proc.new do |queue|
    if steps >= StepsLimit
        next
    end
    steps += 1
    t+= 1
    n += 1
    if n == 0
        histohram[t] += 1
        t = 0
    end
    file.print("#{steps} #{n}\n")
    schedule({ :name => "E1", :time => distirbution, :call => E1 }, queue)
end

schedule({:time => distirbution, :call => E2, :name => "E2"}, global_queue)
schedule({:time => distirbution, :call => E1, :name => "E1"}, global_queue)
p global_queue

simulate(global_queue)
print "Steps is #{steps}"
file.close()
p histohram.sort {|a, b| a[0] <=> b[0] }

hist_file = File.open("hist.txt", "w")
histohram.sort {|a, b| a[0] <=> b[0] }.each do |element|
    hist_file.print("#{element[0]} #{element[1]}\n")
end
hist_file.close()
