require_relative('./position')

class Size < Position


  def initialize(width, height)
    raise IndexOutOfBoundError.new unless valid?(width, 1) && valid?(height, 1)
    super(width, height)
  end

  def valid_position?(pos)
    @x > pos.x && @y > pos.y
  end

  def near_positions_each(position)
    position.near_positions.each do |position|
      begin
        yield position if valid_position?(position)
      rescue
      end
    end
  end
end