#!/usr/bin/env ruby -w

require 'set'

priorities = Hash[('A'..'Z').zip(27..52)].merge Hash[('a'..'z').zip(1..26)]

# 1st puzzle
priorities_sum = File.open(ARGV[0]).readlines.sum do |line|
  first, second = line.chars.each_slice(line.size / 2).map { Set.new _1 }

  (first & second).sum { priorities[_1] }
end

puts priorities_sum

# 2nd puzzle
badge_priorities = File.open(ARGV[0]).readlines.each_slice(3).map do |a, b, c|
  (Set.new(a.chomp.chars) & Set.new(b.chomp.chars) & Set.new(c.chomp.chars)).sum { priorities[_1] }
end.sum

puts badge_priorities
