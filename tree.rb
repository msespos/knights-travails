class Tree
  def initialize#(position)
  #  @root = build_tree(position)
  end

  def on_board?(position)
    position.all? { |e| e > -1 && e < 8 }
  end

  def build
    root = Knight.new
    root.position = [3, 3]
    root.nnw = Knight.new
    root.nne = Knight.new
    root.wnw = Knight.new
    root.ene = Knight.new
    root.wsw = Knight.new
    root.ese = Knight.new
    root.ssw = Knight.new
    root.sse = Knight.new
    temp = root.position.map.with_index { |e, i| i == 0 ? e -= 1 : e += 2 }
    root.nnw.position = temp if on_board?(temp)
    temp = root.position.map.with_index { |e, i| i == 0 ? e += 1 : e += 2 }
    root.nne.position = temp if on_board?(temp)
    temp = root.position.map.with_index { |e, i| i == 0 ? e += -2 : e += 1 }
    root.wnw.position = temp if on_board?(temp)
    temp = root.position.map.with_index { |e, i| i == 0 ? e += 2 : e += 1 }
    root.ene.position = temp if on_board?(temp)
    temp = root.position.map.with_index { |e, i| i == 0 ? e += -2 : e += -1 }
    root.wsw.position = temp if on_board?(temp)
    temp = root.position.map.with_index { |e, i| i == 0 ? e += 2 : e += -1 }
    root.ese.position = temp if on_board?(temp)
    temp = root.position.map.with_index { |e, i| i == 0 ? e += -1 : e += -2 }
    root.ssw.position = temp if on_board?(temp)
    temp = root.position.map.with_index { |e, i| i == 0 ? e += 1 : e += -2 }
    root.sse.position = temp if on_board?(temp)
    p root
    p root.nnw
    p root.nne
    p root.wnw
    p root.ene
    p root.wsw
    p root.ese
    p root.ssw
    p root.sse
  end
end
