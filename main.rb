require_relative 'board.rb'
require_relative 'knight.rb'

Board.new
knight = Knight.new([0,0])
p knight.position
p knight.possibilities