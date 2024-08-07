# frozen_string_literal: true

require_relative 'lib/graph'

DIMENSIONS = (0..7).freeze
KNIGHT_MOVES = [
  [-2, 1],
  [-1, 2],
  [1, 2],
  [2, 1],
  [2, -1],
  [1, -2],
  [-1, -2],
  [-2, -1]
].freeze

def valid?(dimension)
  DIMENSIONS.include?(dimension)
end

def calculate_moves(value, possible_moves)
  possible_moves.each_with_object([]) do |m, valid_moves|
    x = value[0] + m[0]
    y = value[1] + m[1]

    valid_moves << [x, y] if valid?(x) && valid?(y)
  end
end

def build_graph
  graph = Graph.new

  DIMENSIONS.each do |x|
    DIMENSIONS.each { |y| graph.add_node([x, y]) }
  end

  graph.nodes.each do |n|
    moves = calculate_moves(n.value, KNIGHT_MOVES)
    graph.add_edges(n, moves)
  end

  graph
end

def knight_moves(from, to)
  graph = build_graph
  path = graph.shortest_path(from, to)
  puts "You made it in #{path.length} moves! Here's your path:"
  path.each { |value| p value }
end

knight_moves([0, 0], [1, 2])
knight_moves([0, 0], [3, 3])
knight_moves([3, 3], [0, 0])
knight_moves([0, 0], [7, 7])
knight_moves([3, 3], [4, 3])
