require_relative('./position')

class Size < Position
  def initialize(width, height)
    raise IndexOutOfBoundError.new unless valid?(width, 1) && valid?(height, 1)
    super(width, height)
  end

  def width
    x
  end

  def height
    y
  end

  def out_of_index?(position)
    not valid_position?(position)
  end

  private
  def valid_position?(pos)
    @x > pos.x && @y > pos.y
  end
end