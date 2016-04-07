verticle_count = 10
max_degeee = 5

list = Array.new(verticle_count).map!{Array.new{1}}

def printGraph list
    p "list"
    verticle_index = 1
    list.each do |l|
        print(verticle_index, " ", l, "\n")
        verticle_index+=1
    end
end

def addVerticlesToGraph(list, verticle, verticle2)
    list[verticle][list[verticle].size]=verticle2
    list[verticle2][list[verticle2].size]=verticle
end


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

def traverse current, parent, depth = 0
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


unused_verticles = %w[]
used_verticles = %w[]
1.upto(verticle_count) do |e|
    unused_verticles.push(Pair.new(e, Random.rand(max_degeee) +1))
end
# p "degrees:"
# p unused_verticles

# select random verticle
verticle = unused_verticles[Random.rand(unused_verticles.size)]
start = verticle
unused_verticles.delete(verticle)
used_verticles.push(verticle)
p unused_verticles

# add to allowed its neighbor/
while unused_verticles.size > 0
    # select random verticle from allowed
    new_verticle = unused_verticles[Random.rand(unused_verticles.size)]

    # add it into the graph
    unused_verticles.delete(new_verticle)
    verticle.linked_with.push(new_verticle)
    new_verticle.linked_with.push(verticle)

    # remove merged verticles from allowed
    # add newly linked verticles to allowed
    verticle = new_verticle
end

traverse start, nil, 1

# printGraph list

