require_relative './square'
require_relative './index_out_of_bound_error'
require_relative './game_over_error'
require_relative './size'
require_relative './position'

class Grid
  attr_reader :rows

  def initialize (size)
    @size = size
    @rows = Array.new(size.height) { Array.new(size.width) { Square.new } }
  end

  def row
    @size.height
  end

  def column
    @size.width
  end

  def get_square (position)
    raise IndexOutOfBoundError.new if @size.out_of_index?(position)
    @rows[position.x][position.y]
  end

  def open(position)
    square = get_square(position)
    raise GameOverError.new if square.mined

    return if square.opened
    square.open
    return unless square.zero_near_mine_num

    position.near_positions_each do |position|
      open(position) unless @size.out_of_index?(position)
    end
  end

  def put_mine(position)
    get_square(position).mine!
    position.near_positions_each do |position|
      get_square(position).increase_near_mine_num unless @size.out_of_index?(position)
    end
  end

  def all_squares_each
    @rows.each do |row|
      row.each do |square|
        yield square
      end
    end
  end

  def win?
    true
  end

  def render
    status = ""

    all_squares_each do |square|
      status += square.symbol
    end

    return insert_new_line(status)
  end

  def insert_new_line(status)
    range = 3..row*column
    range.step(4).each do |i|
      status.insert(i, "\n")
    end

    return status+"\n"
  end
end