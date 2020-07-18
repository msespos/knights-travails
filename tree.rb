# frozen_string_literal: true

# the tree which describes the possible trips the knight can take
# starting from any square
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
    @spaces_visited = [@root.position]
    build_tree(@root)
  end

  def print_filled_board
    board = Board.new
    board.fill_board(@spaces_visited)
    board.print_board
  end

  def on_board?(position)
    position.all? { |coordinate| coordinate > -1 && coordinate < 8 }
  end

  def build_tree(root)
    return root if root.nil?

    DIRECTIONS.each_key do |root_direction|
      node = root.send(root_direction.to_s)
      DIRECTIONS.each do |node_direction, shifts|
        candidate = root.position.map.with_index { |coordinate, i| coordinate + shifts[i] }
        next unless on_board?(candidate) && !@spaces_visited.include?(candidate)

        node = root.send("#{node_direction}=", Knight.new)
        node.position = candidate
        @spaces_visited.push(node.position)
      end
      build_tree(node)
    end
    root
  end
end
