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

  def print_filled_board
    board = Board.new
    board.fill_board(@spaces_visited)
    board.print_board
  end

  def on_board?(position)
    position.all? { |coordinate| coordinate > -1 && coordinate < 8 }
  end

  def knight_tree(start, destination)
    start = @root if start.nil?
    return start if start.position == destination

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
    node = @unchecked_spaces.shift
    solution = knight_tree(node, destination)
    return solution unless solution.nil?

    nil
  end
end
