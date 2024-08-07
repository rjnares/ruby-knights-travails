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

  def shortest_path(from, to)
    start = find(from)
    target = find(to)

    traversal = bfs(start, target)
    reconstruct_path(start, target, traversal)
  end

  private

  def find(value)
    nodes.each { |n| return n if n.value == value }
    nil
  end

  def bfs(start, target)
    traversal = Array.new(nodes.length)

    return traversal if start.nil?

    queue = [start]

    visited = Array.new(nodes.length, false)
    node_index = nodes.index(start)
    visited[node_index] = true

    until queue.empty?
      node = queue.shift
      node.neighbors.each do |n|
        node_index = nodes.index(n)

        next if visited[node_index]

        queue << n
        visited[node_index] = true
        traversal[node_index] = node

        return traversal if n == target
      end
    end

    traversal
  end

  def reconstruct_path(start, target, traversal)
    path = []

    return path if start.nil? || target.nil?

    current = target

    until current.nil?
      path << current.value
      node_index = nodes.index(current)
      current = traversal[node_index]
    end

    return path.reverse if path.last == start.value

    []
  end
end
