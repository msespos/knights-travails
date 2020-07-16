class Tree
  attr_reader :root

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
    build_tree(@root)
  end

  def on_board?(position)
    position.all? { |e| e > -1 && e < 8 }
  end

  def build_tree(root)
    return root if root.nil?

    DIRECTIONS.each do |direction, shifts|
      temp = root.position.map.with_index do |coordinate, i|
        i == 0 ? coordinate += shifts[0] : coordinate += shifts[1]
      end
      if on_board?(temp)
        node = root.send("#{direction}=", Knight.new)
        node.position = temp
      end
    end
    root
  end
end
