#!/usr/bin/env ruby -w

require 'set'

def touching?(x1, y1, x2, y2)
  (x1 - x2).abs <= 1 && (y1 - y2).abs <= 1
end

head = [0, 0]
tail = [0, 0]

visited = Set.new
visited << tail

dirs = {
  'R' => [1, 0],
  'L' => [-1, 0],
  'D' => [0, -1],
  'U' => [0, 1]
}

# 1st puzzle
File.open(ARGV[0]).readlines.each do |line|
  dir, speed = line.chomp.split(/\s+/)
  speed = speed.to_i

  speed.times do
    prev = head.dup
    head = [head[0] + dirs[dir][0], head[1] + dirs[dir][1]]

    visited << tail

    next if touching?(*head, *tail)

    tail = prev.dup
  end
end
visited << tail

puts visited.size
