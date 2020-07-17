class Board
  def initialize
    @board = Array.new(8) { Array.new(8) { " - " } }
  end

  def print_board
    puts
    puts @board.reverse_each.map { |row| row.join }
    puts
  end

  def possibilities(coordinates)
    coordinates.each do |coordinate|
      @board[coordinate[0]][coordinate[1]] = " @ "
    end
  end
end
