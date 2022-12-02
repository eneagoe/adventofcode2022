#!/usr/bin/env ruby -w

def outcome(a, b)
  return 3 if a == b
  return 6 if [["rock", "scissors"], ["scissors", "paper"], ["paper", "rock"]].include?([a, b])
  0
end

opp = {"A" => "rock", "B" => "paper", "C" => "scissors"}
me = {"X" => "rock", "Y" => "paper", "Z" => "scissors"}
scores = {"rock" => 1, "paper" => 2, "scissors" => 3}

# 1st puzzle
total_score = File.open(ARGV[0]).readlines.map do |line|
  a, b = line.split(/\s+/)
  scores[me[b]] + outcome(me[b], opp[a])
end.reduce(:+)

puts total_score
