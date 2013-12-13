require_relative('./position')

class Size < Position


  def initialize(width, height)
    raise IndexOutOfBoundError.new unless valid?(width, 1) && valid?(height, 1)
    super(width, height)
  end

  def valid_position?(pos)
    @x > pos.x && @y > pos.y
  end
end