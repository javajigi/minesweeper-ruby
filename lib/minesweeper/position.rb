require_relative './index_out_of_bound_error'

class Position
  attr_reader :x, :y

  def initialize(x, y)
    raise IndexOutOfBoundError.new unless valid?(x, 0) && valid?(y, 0)
    @x = x
    @y = y
  end

  def near_each
    near_x.each do |row|
      near_y.each do |col|
        yield row, col
      end
    end
  end

  def near_positions_each
    near_x.each do |row|
      near_y.each do |col|
        begin
          yield Position.new(row, col)
        rescue
        end
      end
    end
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  private
  def near_x
    (x-1..x+1)
  end

  def near_y
    (y-1..y+1)
  end

  def valid?(value, i)
    value >= i
  end
end