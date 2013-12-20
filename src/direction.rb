require '../src/position'

module Direction
  # To change this template use File | Settings | File Templates.
  def NORTH(pos)
    Position.new(pos.x, pos.y - 1)
  end
  def NORTH_EAST(pos)
    Position.new(pos.x + 1, pos.y - 1)
  end
  def EAST(pos)
    Position.new(pos.x + 1, pos.y)
  end
  def SOUTH_EAST(pos)
    Position.new(pos.x + 1, pos.y + 1)
  end
  def SOUTH(pos)
    Position.new(pos.x, pos.y + 1)
  end
  def SOUTH_WEST(pos)
    Position.new(pos.x - 1, pos.y + 1)
  end
  def WEST(pos)
    Position.new(pos.x - 1, pos.y)
  end
  def NORTH_WEST(pos)
    Position.new(pos.x - 1, pos.y - 1)
  end

  #NORTH_EAST = [1, -1]
  #EAST = [1, 0]
  #SOUTH_EAST = [1, 1]
  #SOUTH = [0, 1]
  #SOUTH_WEST = [-1, 1]
  #WEST = [-1, 0]
  #NORTH_WEST = [-1, -1]
end