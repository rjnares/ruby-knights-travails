# frozen_string_literal: true

# Class for a graph node
class Node
  attr_reader :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_edge(node)
    neighbors << node
  end
end
