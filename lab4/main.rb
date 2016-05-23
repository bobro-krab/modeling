#!/usr/bin/env ruby

second = \
 [
    [0.3, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2], \
    [0.2, 0.3, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.2, 0.3, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.2, 0.3, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.2, 0.3, 0.5, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.2, 0.3, 0.5, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.3, 0.5, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.3, 0.5, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.3, 0.5], \
    [0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.3]  \
  ]

mat_event = \
[
    [0.5, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.5, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.5, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.5, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.0, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.0, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.0, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.0], \
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5], \
    [0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5]  \
]


def get_next arr
    temp = arr.clone
    summ = 0
    0.upto(temp.size - 1) do |i|
        summ += temp[i]
        temp[i] = summ
    end
    rand = Random.rand
    0.upto(temp.size - 1) do |i|
        if temp[i] >= rand
            return i
        end
    end
    temp
end

def plot (hash, filename="temp")
    File.open(filename, 'w') { |file|
        hash.each { |hash, val| file.puts "#{hash}\t#{val}" }
    }
end

def test markov_matrix, count = 10000
    a = 0
    hist = {}
    0.upto(9) do |i| hist[i] = 0 end
    1.upto(count) do |i|
        a = get_next(markov_matrix[a])
        hist[a] += 1
    end
    p hist
    hist
end

def megatest markov_matrix
    hist = {}
    0.upto(9) do |i| hist[i] = 0 end
    1.upto(100) do |i|
        hist[test markov_matrix] += 1
    end
    p "lol"
    hist
end

plot(test(mat_event), "first")
plot(test(second), "second")
