#!/usr/bin/env ruby

distrib = {}
distrib[:uniform] = Proc.new do |math_exp|
    Random.rand * math_exp
end

distrib[:exponentioal] = Proc.new do |math_exp|
    - Math.log2(Random.rand) * math_exp
end

distrib[:const] = Proc.new do |math_exp|
    math_exp
end

def gen_array (length, distribution)
    res = []
    1.upto(length) {|i|
        res << distribution.call(1)
    }
    res
end

distrib.values.each do |first|
    distrib.values.each do |second|
        tau = gen_array(10, first)
        sigma = gen_array(10, second)
    end
end
