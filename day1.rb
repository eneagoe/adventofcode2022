#!/usr/bin/env ruby -w

elf = 1
strongest = nil
max = 0
current = 0

# first part
File.open(ARGV[0]).readlines.each do |line|
  line.chomp!

  if line.empty?
    if max < current
      max = current
      strongest = elf
    end

    current = 0
    elf += 1
  end

  current += line.to_i
end

puts max, strongest
