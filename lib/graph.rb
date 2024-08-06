# frozen_string_literal: true

require_relative 'node'

# Class for undirected, unweighted graph
class Graph
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def add_node(value)
    nodes << Node.new(value)
  end

  def add_edges(node, values)
    values.each { |v| node.add_edge(find(v)) }
  end

  def print
    nodes.each { |n| puts n }
  end

  private

  def find(value)
    nodes.each { |n| return n if n.value == value }
    nil
  end
end
