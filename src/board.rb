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

  def initialize(size)
    @size = size
    @rows = size.x
    @state = "lose"
    @open_num = 0
    @mine_num = 0
    @spot_num = size.x * size.x

    @squares = Array.new(size.x) { Array.new(size.y) { Square.new } }
  end

  def is_valid?(x, y)
    if ((x >= 0 && x < @rows) && (y >=0 && y < @rows))
      return true
    else
      return false
    end
  end

  def count_around_mine(pos)
    num = 0
    begin
      num += 1 if ((@size.valid_position? NORTH(pos)) && !get_square(NORTH(pos)).mined?)
      num += 1 if ((@size.valid_position? NORTH_EAST(pos)) && !get_square(NORTH_EAST(pos)).mined?)
      num += 1 if ((@size.valid_position? EAST(pos)) && !get_square(EAST(pos)).mined?)
      num += 1 if ((@size.valid_position? SOUTH_EAST(pos)) && !get_square(SOUTH_EAST(pos)).mined?)
      num += 1 if ((@size.valid_position? SOUTH(pos)) && !get_square(SOUTH(pos)).mined?)
      num += 1 if ((@size.valid_position? SOUTH_WEST(pos)) && !get_square(SOUTH_WEST(pos)).mined?)
      num += 1 if ((@size.valid_position? WEST(pos)) && !get_square(WEST(pos)).mined?)
      num += 1 if ((@size.valid_position? NORTH_WEST(pos)) && !get_square(NORTH_WEST(pos)).mined?)
    rescue
    end
    @squares[pos.x][pos.y].num_around_mine = num
  end

  def init_mine_count
    for i in 0...@rows
      for j in 0...@rows
        count_around_mine(Position.new(i, j)) unless get_square(Position.new(i, j)).mined?
      end
    end
  end

  def open(pos)
    return if @squares[pos.x][pos.y].opened == true
    @squares[pos.x][pos.y].opened=true
    @open_num += 1
    if get_square(pos).num_around_mine == 0
      begin
        open(NORTH(pos)) if ((@size.valid_position? NORTH(pos)) && !get_square(NORTH(pos)).mined?)
        open(NORTH_EAST(pos)) if ((@size.valid_position? NORTH_EAST(pos)) && !get_square(NORTH_EAST(pos)).mined?)
        open(EAST(pos)) if ((@size.valid_position? EAST(pos)) && !get_square(EAST(pos)).mined?)
        open(SOUTH_EAST(pos)) if ((@size.valid_position? SOUTH_EAST(pos)) && !get_square(SOUTH_EAST(pos)).mined?)
        open(SOUTH(pos)) if ((@size.valid_position? SOUTH(pos)) && !get_square(SOUTH(pos)).mined?)
        open(SOUTH_WEST(pos)) if ((@size.valid_position? SOUTH_WEST(pos)) && !get_square(SOUTH_WEST(pos)).mined?)
        open(WEST(pos)) if ((@size.valid_position? WEST(pos)) && !get_square(WEST(pos)).mined?)
        open(NORTH_WEST(pos)) if ((@size.valid_position? NORTH_WEST(pos)) && !get_square(NORTH_WEST(pos)).mined?)
      rescue
      end
    end
    checkState
  end

  def set_mine(pos)
    get_square(pos).mined = true
    @mine_num += 1
  end

  def get_square(pos)
    @squares[pos.x][pos.y]
  end

  def checkState
    #puts "#{@spot_num} - #{@open_num} = #{@mine_num}"
    if (@spot_num - @open_num == @mine_num)
      @state = "win"
    else
      @state = "lose"
    end
  end

  def render
    status = ""

    @squares.each do |row|
      row.each do |square|
        puts square.symbol
        status += square.symbol
      end
      status += "\n"
    end

    return status
  end
end