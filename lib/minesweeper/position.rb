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

  private
  def valid?(value, i)
    value >= i
  end
end