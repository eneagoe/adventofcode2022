#!/usr/bin/env ruby -w

grid = File.open(ARGV[0]).readlines.map do |line|
  line.chomp.chars.map(&:to_i)
end

rows = grid.size
cols = grid[0].size

# 1st puzzle
# edges are always visible
total_visible = 2 * rows + 2 * (cols - 2)

(1...rows - 1).each do |i|
  (1...cols - 1).each do |j|
    h = grid[i][j]

    # north
    visible = true
    (i - 1..0).step(-1).each do |row|
      if grid[row][j] >= h
        visible = false
        break
      end
    end
    if visible
      total_visible += 1
      next
    end

    # south
    visible = true
    (i + 1...rows).each do |row|
      if grid[row][j] >= h
        visible = false
        break
      end
    end
    if visible
      total_visible += 1
      next
    end

    # east
    visible = true
    (j + 1...cols).each do |col|
      if grid[i][col] >= h
        visible = false
        break
      end
    end
    if visible
      total_visible += 1
      next
    end

    # west
    visible = true
    (j - 1..0).step(-1).each do |col|
      if grid[i][col] >= h
        visible = false
        break
      end
    end
    if visible
      total_visible += 1
      next
    end
  end
end

puts total_visible
