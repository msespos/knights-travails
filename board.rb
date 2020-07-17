# frozen_string_literal: true

# stores methods for creating and displaying the board
class Board
  def initialize
    @board = Array.new(8) { Array.new(8) { ' - ' } }
  end

  def print_board
    puts
    puts @board.reverse_each.map(&:join)
    puts
  end

  def fill_board(coordinates)
    coordinates.each do |coordinate|
      @board[coordinate[0]][coordinate[1]] = ' @ '
    end
  end
end
