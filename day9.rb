#!/usr/bin/env ruby -w

require 'set'

def touching?(x1, y1, x2, y2)
  (x1 - x2).abs <= 1 && (y1 - y2).abs <= 1
end

def move_knot(x1, y1, x2, y2)
  return [x1, y1] if touching?(x1, y1, x2, y2)

  x, y = x1, y1

  if x2 > x1
    x += 1
  elsif x2 < x1
    x -= 1
  end

  if y2 > y1
    y += 1
  elsif y2 < y1
    y -= 1
  end

  [x, y]
end

head = [0, 0]
tail = [0, 0]

snake = Array.new(10) { [0, 0] }

visited = Set.new
visited << tail

snake_visited = Set.new
snake_visited << snake[-1]

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
    head = [head[0] + dirs[dir][0], head[1] + dirs[dir][1]]

    visited << tail
    tail = move_knot(*tail, *head)

    snake[0] = [snake[0][0] + dirs[dir][0], snake[0][1] + dirs[dir][1]]
    snake[1..].each_with_index do |s, i|
      snake[i + 1] = move_knot(*s, *snake[i])
    end

    snake_visited << snake[-1]
  end
end
visited << tail

puts visited.size
puts snake_visited.size
