#!/usr/bin/env ruby

class Array
    def math_exp
        summ = 0;
        self.each do |a|
            summ += a
        end
        return summ / self.size
    end
end

distrib = {}
distrib[:uniform] = Proc.new do |math_exp|
    Random.rand * math_exp
end

distrib[:exponentioal] = Proc.new do |math_exp|
    - Math.log2(Random.rand) * math_exp
end

distrib[:const] = Proc.new do |math_exp|
    2 * math_exp
end

def gen_array (length, distribution, math_exp)
    res = []
    1.upto(length) {|i|
        res << distribution.call(math_exp).round(2)
    }
    res
end

def calculate (tau, sigma)
    result = [-1]
    0.upto(tau.size - 1) { |i|
        result[i] = [result[i-1] + sigma[i-1] - tau[i], 0].max.round(2)
    }
    result
end

Count = 10000

distrib.each do |first_name, first|
    distrib.each do |second_name, second|
        if first_name == :const && second_name == :const
            next
        end
        filename = "#{first_name}-#{second_name}"
        puts filename
        File.open(filename + ".res", 'w') { |file|
            math_exp_tau = 0.1
            matrix = []
            while math_exp_tau < 1 do
                math_exp_sigma = 0.1
                tau = gen_array(Count, first, math_exp_tau)
                middle = []
                middle.push(1 - math_exp_tau)
                while math_exp_sigma < 1 do
                    sigma = gen_array(Count, second, math_exp_sigma)
                    omega = calculate(tau, sigma)
                    math_exp_sigma += 0.1
                    middle.push(omega.math_exp.round(2))
                end
                math_exp_tau += 0.1
                matrix.insert(0, middle)
            end
            matrix.each do |s|
                s.each do |elem|
                    file.printf "#{elem}\t"
                end
                file.puts ""
            end
        }
    end
end
