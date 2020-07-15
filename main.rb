require_relative 'board.rb'
require_relative 'knight.rb'
require_relative 'tree.rb'

tree = Tree.new([0, 0])
p tree.root
p tree.root.nnw
p tree.root.nne
p tree.root.wnw
p tree.root.ene
p tree.root.wsw
p tree.root.ese
p tree.root.ssw
p tree.root.sse
