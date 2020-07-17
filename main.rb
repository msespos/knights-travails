require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'tree.rb'

tree = Tree.new([0, 0])
p tree.root
p tree.spaces_visited
tree.print_spaces_visited