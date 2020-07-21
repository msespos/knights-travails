# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'tree.rb'

def knight_moves(start, destination)
  tree = Tree.new(start)
  solution = tree.knight_tree(nil, destination)
  p solution.path_to
  tree.print_filled_board
end

def start knight_moves([0, 0], [3, 3])
