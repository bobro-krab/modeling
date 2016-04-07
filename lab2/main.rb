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

verticle_degrees = %w[]
1.upto(verticle_count) do |e|
    verticle_degrees.push(Pair.new(e, Random.rand(max_degeee) +1))
end
p "degrees:"
p verticle_degrees

allowed_verticles = %w[]

# select random verticle
verticle = verticle_degrees[Random.rand(verticle_degrees.size)]
verticle_degrees.delete(verticle)
p verticle_degrees
# add to allowed its neighbor/

# select random verticle from allowed
new_verticle = verticle_degrees[Random.rand(verticle_degrees.size)]
verticle_degrees.delete(new_verticle)
verticle.linked_with.push(new_verticle)
new_verticle.linked_with.push(verticle)
p verticle
p new_verticle
# add it into the graph
# remove merged verticles from allowed
# add newly linked verticles to allowed

# printGraph list

