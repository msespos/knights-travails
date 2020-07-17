class Tree
  attr_reader :root, :spaces_visited

  DIRECTIONS =  { :nnw => [-1, 2],
                  :nne => [1, 2],
                  :wnw => [-2, 1],
                  :ene => [2, 1],
                  :wsw => [-2, -1],
                  :ese => [2, -1],
                  :ssw => [-1, -2],
                  :sse => [1, -2]
                }

  def initialize(position)
    @root = Knight.new
    @root.position = position
    @spaces_visited = [@root.position]
    build_level(@root)
  end

  def print_spaces_visited
    board = Board.new
    board.possibilities(@spaces_visited)
    board.print_board
  end

  def on_board?(position)
    position.all? { |coordinate| coordinate > -1 && coordinate < 8 }
  end

  def build_level(root)
    return root if root.nil?

    DIRECTIONS.each do |direction, shifts|
      temp = root.position.map.with_index do |coordinate, i|
        i == 0 ? coordinate += shifts[0] : coordinate += shifts[1]
      end
      if on_board?(temp) && !@spaces_visited.include?(temp)
        node = root.send("#{direction}=", Knight.new)
        node.position = temp
        @spaces_visited.push(node.position)
        DIRECTIONS.each do |direction, shifts|
          temp = node.position.map.with_index do |coordinate, i|
            i == 0 ? coordinate += shifts[0] : coordinate += shifts[1]
          end
          if on_board?(temp) && !@spaces_visited.include?(temp)
            node2 = node.send("#{direction}=", Knight.new)
            node2.position = temp
            @spaces_visited.push(node2.position)
          end
        end
      end
    end
    root
  end
end
