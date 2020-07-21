# frozen_string_literal: true

# the tree which describes the possible trips the knight can take
# starting from a given square
class Tree
  attr_reader :root, :spaces_visited

  DIRECTIONS = { nnw: [-1, 2],
                 nne: [1, 2],
                 wnw: [-2, 1],
                 ene: [2, 1],
                 wsw: [-2, -1],
                 ese: [2, -1],
                 ssw: [-1, -2],
                 sse: [1, -2] }.freeze

  def initialize(position)
    @root = Knight.new
    @root.position = position
    @root.path_to = [@root.position]
    @spaces_visited = [@root.position]
    @unchecked_spaces = []
  end

  # for debugging purposes only
  def print_filled_board
    board = Board.new
    board.fill_board(@spaces_visited)
    board.print_board
  end

  # determine if a specific position is on the board
  def on_board?(position)
    position.all? { |coordinate| coordinate > -1 && coordinate < 8 }
  end

  # build the tree and searches as it builds for the destination location and the path to it
  def knight_tree(start, destination)
    start = @root if start.nil?
    return start if start.position == destination

    # search in all directions from a node (up to 8) and create new nodes if possible
    # then store the spaces which have been visited to @spaces_visited
    # add nodes to @unchecked_spaces for later use
    # and create a path_to attribute for each node to use if a node is the destination
    # check to see if the destination position has been located
    DIRECTIONS.each do |direction, shifts|
      candidate = start.position.map.with_index { |coordinate, i| coordinate + shifts[i] }
      next unless on_board?(candidate) && !@spaces_visited.include?(candidate)

      node = start.send("#{direction}=", Knight.new)
      node.position = candidate
      node.path_to = start.path_to.clone.push(node.position)
      # below line contributed by AA to change tree creation from depth-first to breadth-first
      @unchecked_spaces.push(node)
      @spaces_visited.push(node.position)
      return node if candidate == destination
    end
    # below 4 lines contributed by AA to change tree creation from depth-first to breadth-first
    # make a recursive call to knight_tree on the first node in @unchecked_spaces
    # return the result of that call if it is not nil, and return nil otherwise
    node = @unchecked_spaces.shift
    solution = knight_tree(node, destination)
    return solution unless solution.nil?

    nil
  end
end
