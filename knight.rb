class Knight
  attr_reader :position, :possibilities

  def initialize(position)
    @position = position
    @north_northwest = nil
    @north_northeast = nil
    @west_northwest = nil
    @east_northeast = nil
    @west_southwest = nil
    @east_southeast = nil
    @south_southwest = nil
    @south_southeast = nil
  end

  def build_tree(position)
    [[0,1],[0,2]]
  end
end