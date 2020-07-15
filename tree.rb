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
    @root = build_tree(position)
  end

  def on_board?(position)
    position.all? { |e| e > -1 && e < 8 }
  end

  def build_tree(position)
    root = Knight.new
    root.position = position
    DIRECTIONS.each do |k, v|
      temp = root.position.map.with_index { |e, i| i == 0 ? e += v[0] : e += v[1] }
      if on_board?(temp)
        node = root.send("#{k}=", Knight.new)
        node.position = temp
      end
    end
    root
  end
end
