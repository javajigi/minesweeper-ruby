require '../src/index_out_of_bound_error'

class Position
  attr_reader :x, :y

  def initialize(x, y)
    raise IndexOutOfBoundError unless (valid?(x, 0) and valid?(y, 0))
    @x = x
    @y = y
  end

  def ==(other)
    super
    @x == other.x && @y == other.y
  end

  private
  def valid?(value, i)
    value >= i
  end
end