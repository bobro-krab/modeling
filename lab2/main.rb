#!/usr/bin/env ruby
class Pair
    attr_accessor :verticle
    attr_accessor :degree
    attr_accessor :linked_with
    def initialize (a,b)
        @verticle = a
        @degree = b
        @linked_with = %w[]
    end
end

def traverse current, parent = nil, depth = 0
    1.upto(depth) do
        printf "  "
    end
    puts current.verticle
    current.linked_with.each do |sibling|
        if sibling == parent
        else
            traverse sibling, current, depth + 1
        end
    end
end


def randomGraph verticle_count, max_degeee
    unused_verticles = %w[]
    used_verticles = %w[]
    useless_verticles = %w[]
    1.upto(verticle_count) do |e|
        unused_verticles.push(Pair.new(e, Random.rand(max_degeee) +1))
    end

    # select random verticle
    verticle = unused_verticles[Random.rand(unused_verticles.size)]
    unused_verticles.delete(verticle)
    used_verticles.push(verticle)
    start = verticle

    # add to allowed its neighbor
    while unused_verticles.size > 0
        # select random verticle from allowed
        verticle     = used_verticles[Random.rand(used_verticles.size)]
        new_verticle = unused_verticles[Random.rand(unused_verticles.size)]

        verticle.degree -= 1
        new_verticle.degree -= 1
        if verticle.degree <= 0
            useless_verticles.push(verticle)
        end
        if new_verticle.degree <= 0
            useless_verticles.push(new_verticle)
        end


        # move new verticle to used
        unused_verticles.delete(new_verticle)
        used_verticles.push(new_verticle)

        # link verticles
        if verticle != nil; verticle.linked_with.push(new_verticle) end
        new_verticle.linked_with.push(verticle)
    end
    return start
end

traverse randomGraph(1000, 50)
