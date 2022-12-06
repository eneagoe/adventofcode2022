#!/usr/bin/env ruby -w

require 'set'

# 1st puzzle
File.open(ARGV[0]).readlines.each do |line|
  line.chomp.chars.each_cons(4).with_index do |chars, i|
    if Set.new(chars).size == 4
      puts i + 4
      break
    end
  end
end
