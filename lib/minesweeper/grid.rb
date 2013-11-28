require_relative './square'

class Grid
  def initialize (row, column)
    @squares = Array.new(row){Array.new(column) { |index| Square.new }}
  end

  def row
    @squares.length
  end

  def column
    @squares[0].length
  end

  def get_square (x, y)
    @squares[x][y]
  end

  def open (x, y)
    get_square(x, y).open
  end
end