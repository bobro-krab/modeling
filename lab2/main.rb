#!/usr/bin/env ruby
class Pair
    attr_accessor :verticle
    attr_accessor :degree
    attr_accessor :depth
    attr_accessor :linked_with
    def initialize (a,b)
        @verticle = a
        @degree = b
        @depth = 0
        @linked_with = %w[]
    end
end



def traverse currentNode, parent = nil, depth = 0
    1.upto(depth) do
        printf "  "
    end
    puts currentNode.verticle
    currentNode.linked_with.each do |sibling|
        if sibling == parent
        else
            traverse sibling, currentNode, depth + 1
        end
    end
end



def graphWithMaxDepth verticle_count, max_depth
    unused_verticles   = %w[] # which not already added to graph
    internal_verticles = %w[] # verticles can be attached to
    external_verticles = %w[] # which reached max depth
    1.upto(verticle_count) do |e|
        unused_verticles.push(Pair.new(e, 0))
    end

    # select root
    root = unused_verticles[Random.rand(unused_verticles.size)]
    unused_verticles.delete(root)
    internal_verticles.push(root)

    while unused_verticles.size > 0
        verticle = internal_verticles[Random.rand(internal_verticles.size)]
        new_verticle = unused_verticles[Random.rand(unused_verticles.size)]

        # link verticles
        verticle.linked_with.push(new_verticle)
        new_verticle.linked_with.push(verticle)

        # place on edge or on internal plane
        new_verticle.depth = verticle.depth + 1
        if new_verticle.depth == max_depth
            external_verticles.push(new_verticle)
        else
            internal_verticles.push(new_verticle)
        end
        unused_verticles.delete(new_verticle)
    end

    return root
end



def graphWithMaxDegree verticle_count, max_degeee
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
            used_verticles.delete(verticle)
        end
        if new_verticle.degree <= 0
            useless_verticles.push(new_verticle)
            unused_verticles.delete(verticle)
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

puts "degree"
traverse graphWithMaxDegree(10, 2)
puts "depth"
traverse graphWithMaxDepth(10, 2)
