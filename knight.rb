# frozen_string_literal: true

# a knight is a node in the knights travails tree
class Knight
  attr_accessor :position, :nnw, :nne, :wnw, :ene, :wsw, :ese, :ssw, :sse, :path_to

  def initialize
    @position = nil
    @nnw = nil
    @nne = nil
    @wnw = nil
    @ene = nil
    @wsw = nil
    @ese = nil
    @ssw = nil
    @sse = nil
    @path_to = []
  end
end
