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

# 2nd puzzle
max_scenic_score = 0
(1...rows - 1).each do |i|
  (1...cols - 1).each do |j|
    h = grid[i][j]
    scenic_score = 1

    # north
    visible = true
    (i - 1..0).step(-1).each do |row|
      if grid[row][j] >= h
        visible = false
        scenic_score *= (i - row)
        break
      end
    end
    if visible
      total_visible += 1
      scenic_score *= i
    end

    # south
    visible = true
    (i + 1...rows).each do |row|
      if grid[row][j] >= h
        visible = false
        scenic_score *= (row - i)
        break
      end
    end
    if visible
      total_visible += 1
      scenic_score *= (rows - i - 1)
    end

    # east
    visible = true
    (j + 1...cols).each do |col|
      if grid[i][col] >= h
        visible = false
        scenic_score *= (col - j)
        break
      end
    end
    if visible
      total_visible += 1
      scenic_score *= (cols - j - 1)
    end

    # west
    visible = true
    (j - 1..0).step(-1).each do |col|
      if grid[i][col] >= h
        visible = false
        scenic_score *= (j - col)
        break
      end
    end
    if visible
      total_visible += 1
      scenic_score *= j
    end

    max_scenic_score = scenic_score if scenic_score > max_scenic_score
  end
end

puts max_scenic_score
