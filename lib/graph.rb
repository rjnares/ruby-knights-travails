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

  def add_edge(value1, value2)
    index1 = nodes.index(value1)
    index2 = nodes.index(value2)

    return if index1.nil? || index2.nil?

    nodes[index1].add_edge(nodes[index2])
    nodes[index2].add_edge(nodes[index1])
  end
end
