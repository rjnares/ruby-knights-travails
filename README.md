# Ruby Knights Travail

This is my implementation of the [Knights Travail](https://www.theodinproject.com/lessons/ruby-knights-travails) project assigned in the [Computer Science](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#a-bit-of-computer-science) section of the [Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) course which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from [The Odin Project](https://www.theodinproject.com/).

## Project Description

The main goal of this project was to generate the shortest path that a knight piece on a chess board can take from one square to another on a standard 8 x 8 chess grid. The constraints were that the knight must move in the typical "L" shape from one square to another, and that any square the knight moves to must be within the bounds of the chess grid. The underlying concept applied in this project was to use search algorithms, such as BFS, on graph data structures to generate the shortest path from a source to a destination.

#### Classes

My implementation includes the following classes:
* A `Node` class consisting of a data value and an array of `Node` neighbor objects 
* A `Graph` class representing an undirected, unweighted graph of `Node` objects connected by edges

#### Node Class

The `Node` class contains the following instance methods:
* `#value` reads the `value` instance variable value, which in this project, is an `[x, y]` array where `x` and `y` are the coordinates of a square on the chess grid
* `#neighbors` reads the `neighbors` instance variable value, which in this project, is an array of `Node` objects that are connected by an edge to/from the current `Node` instance
* `#add_edge(node)` creates an edge between two nodes by adding the `node` to the current `Node` instance's `neighbors` array 

#### Graph Class

The `Graph` class contains the following instance methods:
* `#nodes` reads the `nodes` instance variable value, which in this project, is an array containing all `Node` objects
* `#add_node(value)` creates a `Node` for the given `value` and adds it to `nodes`
* `#add_edges(node, values)` creates an edge between the given `node` and the `Node` objects of all given `values`
* `#shortest_path(from, to)` returns an array containing the shortest path between the given source value `from` to the given destination value `to` in the format `[[from_x, from_y], ... , [to_x, to_y]`