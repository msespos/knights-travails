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
    puts "knight_moves return:"
    p knight_moves(@root, [4,2])
  end

  def print_filled_board
    board = Board.new
    board.fill_board(@spaces_visited)
    board.print_board
  end

  def on_board?(position)
    position.all? { |coordinate| coordinate > -1 && coordinate < 8 }
  end

  def knight_moves(start, destination)
    return start if start.nil?

    DIRECTIONS.each_key do |direction|
      node = start.send("#{direction}")
      DIRECTIONS.each do |direction, shifts|
        candidate = start.position.map.with_index { |coordinate, i| coordinate + shifts[i] }
        next unless on_board?(candidate) && !@spaces_visited.include?(candidate)

        node = start.send("#{direction}=", Knight.new)
        node.position = candidate
        node.path_to = start.path_to.clone.push(node.position)
        @spaces_visited.push(node.position)
        puts "path to:" if candidate == destination

        p node.path_to if candidate == destination

        puts "candidate:" if candidate == destination

        return candidate if candidate == destination
      end
      knight_moves(node, destination)
    end
    start
  end
end
