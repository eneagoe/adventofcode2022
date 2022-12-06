#!/usr/bin/env ruby -w

require 'set'

File.open(ARGV[0]).readlines.each do |line|
  # 1st puzzle
  line.chomp.chars.each_cons(4).with_index do |chars, i|
    if Set.new(chars).size == 4
      puts i + 4
      break
    end
  end

  # 2nd puzzle
  line.chomp.chars.each_cons(14).with_index do |chars, i|
    if Set.new(chars).size == 14
      puts i + 14
      puts
      break
    end
  end
end
