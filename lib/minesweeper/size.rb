require_relative('./position')

class Size < Position


  def initialize(width, height)
    raise IndexOutOfBoundError.new unless valid?(width, 1) && valid?(height, 1)
    super(width, height)
  end

  def valid_position?(pos)
    @x > pos.x && @y > pos.y
  end

  def near_squares_each(position)
    arr = Array.new
    arr = @size.near_squares(position);

    arr.each do |square|
      begin
         yield square
      rescue

      end
    end
  end

  def near_positions_each(position)
    position.near_positions(position) do |position|
      yield position if valid_position?(position)
    end
  end
end