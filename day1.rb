#!/usr/bin/env ruby -w

elf = 1
max = 0
current = 0

elves = []

File.open(ARGV[0]).readlines.each do |line|
  line.chomp!

  if line.empty?
    max = current if max < current

    elves.append(current)

    current = 0
    elf += 1
  end

  current += line.to_i
end
elves.append(current)

# first puzzle
puts max

# second puzzle
puts elves.sort[-3..].sum
