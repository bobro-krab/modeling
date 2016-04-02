verticle_count = 10
max_degeee = 5

vericle_degrees =%w[]
1.upto(verticle_count) do |e|
    vericle_degrees.insert(0,  Random.rand(max_degeee) + 1)
end
p "degrees:"
p  vericle_degrees

matrix = Array.new(verticle_count ).map!{Array.new(verticle_count)}

p "matrix:"
(0..verticle_count - 1).each do |i|
    (0..verticle_count - 1).each do |j|
        matrix[i][j] = 0
    end
    p matrix[i]
end
