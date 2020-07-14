class Knight
  attr_reader :position, :possibilities

  def initialize(position)
    @position = position
    @possibilities = build_tree(position)
  end

  def build_tree(position)
    [[0,1],[0,2]]
  end
end