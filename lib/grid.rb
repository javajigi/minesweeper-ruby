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

  def open_square(row_point, column_point)
    @squares.each do |row|
      row.each do |square|
        square.open
      end
    end
  end

  def win()
    @squares.each do |row|
      row.each do |square|
         if !square.opened_and_not_mine?
             return false
         end
      end
    end

    return true;
  end
end