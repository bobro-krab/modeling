verticle_count = 10
max_degeee = 5

list = Array.new(verticle_count).map!{Array.new{1}}

def addVerticlesToGraph(list, verticle, verticle2)
    list[verticle][list[verticle].size]=verticle2
    list[verticle2][list[verticle2].size]=verticle
end

def printGraph list
    p "list"
    verticle_index = 1
    list.each do |l|
        print(verticle_index, " ", l, "\n")
        verticle_index+=1
    end
end

vericle_degrees = {}
1.upto(verticle_count) do |e|
    vericle_degrees[e] =  Random.rand(max_degeee) + 1
end
p "degrees:"
p  vericle_degrees

# while vericle_degrees.size > 1
#     random_index = Random.rand(vericle_degrees.size)
#     vericle_degrees[random_index] -= 1
#     random_verticle = Random.rand(verticle_count)
#     addVerticlesToGraph(list, random_index, random_verticle)
# end

printGraph list

