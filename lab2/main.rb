verticle_count = 10
max_degeee = 5

list = Array.new(verticle_count).map!{Array.new{1}}

def addVerticlesToGraph(list, verticle, verticle2)
    list[verticle][list[verticle].size]=verticle2
    list[verticle2][list[verticle2].size]=verticle
end

def printGraph list
    p "list"
    i = 1
    list.each do |l|
        print(i, " ", l, "\n")
        i+=1
    end
end

vericle_degrees =%w[]
1.upto(verticle_count) do |e|
    vericle_degrees.insert(0,  Random.rand(max_degeee) + 1)
end
p "degrees:"
p  vericle_degrees
vericle_degrees.delete(2)

while vericle_degrees.size > 1
    random_index = Random.rand(vericle_degrees.size)
    vericle_degrees[random_index] -= 1
    random_verticle = Random.rand(verticle_count)
    addVerticlesToGraph(list, random_index, random_verticle)
    vericle_degrees.delete(0)
end

printGraph list

