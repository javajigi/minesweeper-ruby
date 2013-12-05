require '../src/square'
require '../src/direction'

class Board
  include Direction
  # To change this template use File | Settings | File Templates.
  attr_accessor :squares
  attr_accessor :state # win or lose
  attr_accessor :mine_num
  attr_accessor :spot_num
  attr_accessor :open_num
  attr_accessor :rows

  def initialize(num)
    @rows = num
    @state = "lose"
    @open_num = 0
    @mine_num = 0
    @spot_num = num * num

    #@pan = Array.new(num) { Array.new(num, Unit.new) }
    @squares = Array.new(num) { Array.new(num) }
    @squares.collect! do |e|
      e.collect do |e|
        e = Square.new
      end
    end
  end

  def is_valid?(x, y)
    if ((x >= 0 && x < @rows) && (y >=0 && y < @rows))
      return true
    else
      return false
    end
  end

  def count_around_mine(x, y)
    num = 0
    num += 1 if ((self.is_valid? x + NORTH[0], y + NORTH[1]) && @squares[x + NORTH[0]][y + NORTH[1]].mined?)
    num += 1 if ((self.is_valid? x + NORTH_EAST[0], y + NORTH_EAST[1]) && @squares[x + NORTH_EAST[0]][y + NORTH_EAST[1]].mined?)
    num += 1 if ((self.is_valid? x + EAST[0], y + EAST[1]) && @squares[x + EAST[0]][y + EAST[1]].mined?)
    num += 1 if ((self.is_valid? x + SOUTH_EAST[0], y + SOUTH_EAST[1]) && @squares[x + SOUTH_EAST[0]][y + SOUTH_EAST[1]].mined?)
    num += 1 if ((self.is_valid? x + SOUTH[0], y + SOUTH[1]) && @squares[x + SOUTH[0]][y + SOUTH[1]].mined?)
    num += 1 if ((self.is_valid? x + SOUTH_WEST[0], y + SOUTH_WEST[1]) && @squares[x + SOUTH_WEST[0]][y + SOUTH_WEST[1]].mined?)
    num += 1 if ((self.is_valid? x + WEST[0], y + WEST[1]) && @squares[x + WEST[0]][y + WEST[1]].mined?)
    num += 1 if ((self.is_valid? x + NORTH_WEST[0], y + NORTH_WEST[1]) && @squares[x + NORTH_WEST[0]][y + NORTH_WEST[1]].mined?)
    @squares[x][y].num_around_mine = num
  end

  def init_mine_count
    for i in 0...@rows
      for j in 0...@rows
        count_around_mine(i, j) unless get_square(i, j).mined?
      end
    end
  end

  def open(x, y)
    return if @squares[x][y].opened == true
    @squares[x][y].opened=true
    @open_num += 1
    open(x + NORTH[0], y + NORTH[1]) if ((is_valid? x + NORTH[0], y + NORTH[1]) && @squares[x + NORTH[0]][y + NORTH[1]].num_around_mine == 0)
    open(x + NORTH_EAST[0], y + NORTH_EAST[1]) if ((is_valid? x + NORTH_EAST[0], y + NORTH_EAST[1]) && @squares[x + NORTH_EAST[0]][y + NORTH_EAST[1]].num_around_mine == 0)
    open(x + EAST[0], y + EAST[1]) if ((is_valid? x + EAST[0], y + EAST[1]) && @squares[x + EAST[0]][y + EAST[1]].num_around_mine == 0)
    open(x + SOUTH_EAST[0], y + SOUTH_EAST[1]) if ((is_valid? x + SOUTH_EAST[0], y + SOUTH_EAST[1]) && @squares[x + SOUTH_EAST[0]][y + SOUTH_EAST[1]].num_around_mine == 0)
    open(x + SOUTH[0], y + SOUTH[1]) if ((is_valid? x + SOUTH[0], y + SOUTH[1]) && @squares[x + SOUTH[0]][y + SOUTH[1]].num_around_mine == 0)
    open(x + SOUTH_WEST[0], y + SOUTH_WEST[1]) if ((is_valid? x + SOUTH_WEST[0], y + SOUTH_WEST[1]) && @squares[x + SOUTH_WEST[0]][y + SOUTH_WEST[1]].num_around_mine == 0)
    open(x + WEST[0], y + WEST[1]) if ((is_valid? x + WEST[0], y + WEST[1]) && @squares[x + WEST[0]][y + WEST[1]].num_around_mine == 0)
    open(x + NORTH_WEST[0], y + NORTH_WEST[1]) if ((is_valid? x + NORTH_WEST[0], y + NORTH_WEST[1]) && @squares[x + NORTH_WEST[0]][y + NORTH_WEST[1]].num_around_mine == 0)
    checkState
    return @squares[x][y].num_around_mine if !@squares[x][y].mined?
  end

  def set_mine(x, y)
    get_square(x, y).mined = true
    @mine_num += 1
  end

  def get_square(x, y)
    @squares[x][y]
  end

  def checkState
    if (@spot_num - @open_num == @mine_num)
      @state = "win"
    else
      @state = "lose"
    end
  end
end