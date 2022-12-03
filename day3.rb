#!/usr/bin/env ruby -w

require 'set'

priorities = Hash[('A'..'Z').zip(27..52)].merge Hash[('a'..'z').zip(1..26)]

priorities_sum = File.open(ARGV[0]).readlines.sum do |line|
  first, second = line.chars.each_slice(line.size / 2).map { Set.new _1 }

  (first & second).sum { priorities[_1] }
end

puts priorities_sum
