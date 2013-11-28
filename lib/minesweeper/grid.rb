require_relative './square'
require_relative './index_out_of_bound_error'

class Grid
  attr_reader :rows

  def initialize (row, column)
    @rows = Array.new(row){Array.new(column) { |index| Square.new }}
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
    get_square(x, y).open
    get_square(0, 1).open
    get_square(1, 0).open
    get_square(1, 1).open
  end

  def out_of_index?(x, y)
    x < 0 or x >= row or y < 0 or y >= column
  end

  def win?
    true
  end
end