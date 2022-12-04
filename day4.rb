#!/usr/bin/env ruby -w

# 1st puzzle
inc = File.open(ARGV[0]).readlines.count do |line|
  a, b = line.chomp.split(",").map { _1.split("-").map(&:to_i) }

  a[0] <= b[0] && b[1] <= a[1] || b[0] <= a[0] && a[1] <= b[1]
end

puts inc

# 2nd puzzle
overlaps =  File.open(ARGV[0]).readlines.count do |line|
  a, b = line.chomp.split(",").map { _1.split("-").map(&:to_i) }

  a[0] <= b[0] && b[0] <= a[1] || b[0] <= a[0] && a[0] <= b[1]
end

puts overlaps
