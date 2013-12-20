require_relative './index_out_of_bound_error'

class Position
  attr_reader :x, :y

  def initialize(x, y)
    raise IndexOutOfBoundError.new unless valid?(x, 0) && valid?(y, 0)
    @x = x
    @y = y
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def near_positions
    arr = Array.new
    (x-1..x+1).each do |x|
      (y-1..y+1).each do |y|
        begin
         arr << Position.new(x, y)
        rescue
        end
      end
    end

    arr.delete(self)
    return arr
  end

  private
  def valid?(value, i)
    value >= i
  end
end