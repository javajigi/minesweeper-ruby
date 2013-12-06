require_relative './square'
require_relative './index_out_of_bound_error'
require_relative './game_over_error'

class Grid
  attr_reader :rows

  def initialize (row, column)
    @rows = Array.new(row) { Array.new(column) { |index| Square.new } }
  end

  def row
    @rows.length
  end

  def column
    @rows[0].length
  end

  def get_square (x, y)
    raise IndexOutOfBoundError.new if out_of_index?(x, y)
    @rows[x][y]
  end

  def open (x, y)
    raise IndexOutOfBoundError.new if out_of_index?(x, y)
    raise GameOverError.new if get_square(x, y).mined

    return if get_square(x, y).opened
    get_square(x, y).open
    return unless get_square(x, y).zero_near_mine_num

    near_squares_each(x, y) do |row, col|
      open(row, col) unless out_of_index?(row, col)
    end
  end

  def out_of_index?(x, y)
    x < 0 or x >= row or y < 0 or y >= column
  end

  def put_mine(x, y)
    get_square(x, y).mine!
    near_squares(x,y).each do |square|
      square.increase_near_mine_num
    end
  end

  def near_squares(x, y)
    arr = Array.new

    near_squares_each(x, y) do |row, col|
      arr << get_square(row, col) unless out_of_index?(row, col)
    end

    return arr
  end

  def near_squares_each(x, y)
    (x-1..x+1).each do |row|
      (y-1..y+1).each do |col|
        yield row, col
      end
    end
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