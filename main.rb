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

graph = build_graph

graph.print

def knight_moves(from, to)
  # TODO
end
