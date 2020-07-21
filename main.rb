# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'tree.rb'

def knight_moves(start, destination)
  tree = Tree.new(start)
  solution = tree.knight_tree(nil, destination)
  puts "You made it in #{solution.path_to.length - 1} moves! Here's your path:"
  solution.path_to.each { |position| p position }
end

def intro
  puts 'Enter the x-coordinate of your starting position (0 to 7):'
  x_coord_start = gets.chomp
  puts 'Enter the y-coordinate of your starting position (0 to 7):'
  y_coord_start = gets.chomp
  puts 'Enter the x-coordinate of your destination (0 to 7):'
  x_coord_destination = gets.chomp
  puts 'Enter the y-coordinate of your destination (0 to 7):'
  y_coord_destination = gets.chomp
  start = [x_coord_start.to_i, y_coord_start.to_i]
  destination = [x_coord_destination.to_i, y_coord_destination.to_i]
  knight_moves(start, destination)
end

intro