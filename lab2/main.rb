verticle_count = 20
max_degeee = 5

verticles =%w[]
1.upto(verticle_count) do |e|
    verticles.insert(0,  Random.rand(max_degeee))
    p verticles[0]
end
p verticles.size
