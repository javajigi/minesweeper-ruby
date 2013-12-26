require_relative './square'
require_relative './index_out_of_bound_error'
require_relative './game_over_error'
require_relative './size'
require_relative './position'

class Grid
  attr_reader :rows

  def initialize (size)
    @size = size
    @rows = Array.new(size.x) { Array.new(size.y) { |index| Square.new } }
  end

  def row
    @rows.length
  end

  def column
    @rows[0].length
  end

  def get_square (position)
    raise IndexOutOfBoundError.new if out_of_index?(position)
    @rows[position.x][position.y]
  end

  def open(position)
    square = get_square(position)
    raise GameOverError.new if square.mined

    return if square.opened
    square.open
    return unless square.zero_near_mine_num

    @size.near_positions_each(position) do |position|
      open(position) unless out_of_index?(position)
    end
  end

  def out_of_index?(position)
    not @size.valid_position?(position)
  end


  def put_mine(position)
    get_square(position).mine!
    near_squares(position).each do |square|
      square.increase_near_mine_num
    end
  end

  def near_squares(position)
    arr = Array.new

    @size.near_positions_each(position) do |position|
      arr << get_square(position) unless out_of_index?(position)
    end

    return arr
  end

  def win?
    true
  end

  def render
    status = ""

    @rows.each do |row|
      row.each do |square|
        status += square.symbol
      end
      status += "\n"
    end

    return status
  end
end