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

def calculate (tau, sigma)
    result = [-1]
    0.upto(tau.size - 1) { |i|
        result[i] = [result[i-1] + sigma[i-1] - tau[i], 0].max
    }
    result
end

distrib.each do |first_name, first|
    distrib.each do |second_name, second|
        if first_name == :const && second_name == :const
            next
        end
        tau = gen_array(10, first)
        sigma = gen_array(10, second)
        puts "#{first_name}-#{second_name}"
        omega = calculate(tau, sigma)
        p omega
        puts " "
    end
end
