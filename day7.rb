#!/usr/bin/env ruby -w

Node = Struct.new("Node", :name, :parent, :children, :size) do
  include Enumerable

  def child(d)
    children.find { _1.name == d }
  end

  def total_size
    return size if children.nil?

    children.sum(&:total_size)
  end

  def each(&block)
    yield self

    children.each do
      if _1[:children]
        _1.each do |c|
          yield c
        end
      end
    end
  end
end

LIMIT = 100000

root = Node.new("/", nil, [], 0)
cwd = root

# build the tree
File.open(ARGV[0]).readlines.each do |line|
  if line =~ /^\$\s+cd\s+(.*)\s*$/
    if $1 == "/"
      cwd = root
    elsif $1 == ".."
      cwd = cwd[:parent]
    else
      cwd = cwd.child($1)
    end
  elsif line =~ /^\$\s+ls\s*$/
    # pass - just listing files/directories
  elsif line =~ /^dir\s+(.*)$/
    cwd[:children] << Node.new($1, cwd, [], 0) unless cwd.child($1)
  else
    size, name = line.split(/\s+/)
    cwd[:children] << Node.new(name, cwd, nil, size.to_i) unless cwd.child(name)
  end
end

# 1st puzzle
puts root.find_all { _1 if _1.children && _1.total_size <= LIMIT }.sum { _1.total_size }
