#!/usr/bin/env ruby -w

stacks = []
stacks2 = []

# 1st puzzle
File.open(ARGV[0]).readlines.count do |line|
  line.chomp!

  # just because I rarely get to use the flip flop operator
  if (line !~ /\[/)..(line =~ /^[\d\s]*$/)
    # move crates
    if line =~ /^move\s+(\d+)\s+from\s+(\d+)\s+to\s+(\d+)\s*$/
      from = $2.to_i - 1
      to = $3.to_i - 1

      $1.to_i.times do
        stacks[to].insert(0, stacks[from].shift(1))
      end

      moving = stacks2[from].shift($1.to_i)
      stacks2[to].unshift(*moving)
    end
  else
    # initialize stacks
    line.chomp.chars.each_slice(4).with_index do |s, idx|
      stacks.append([]) if stacks.size <= idx
      stacks2.append([]) if stacks2.size <= idx

      stacks[idx].append(s[1]) unless s[1] == " "
      stacks2[idx].append(s[1]) unless s[1] == " "
    end
  end
end

puts stacks.map(&:first).join("")
# 2nd puzzle
puts stacks2.map(&:first).join("")
