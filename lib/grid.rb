require 'square'

class Grid
  def initialize(row, column)
    @squares = Array.new(row, Square.new){Array.new(column, Square.new)}
  end

  def row
    @squares.length
  end

  def column
    @squares[0].length
  end

  def get_square(row, column)
    @squares[row][column]
  end
end