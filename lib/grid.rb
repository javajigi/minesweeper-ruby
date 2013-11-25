require 'square'

class Grid
  def initialize(row_size, column_size)
    @squares = Array.new(row_size, Square.closed_not_mine){Array.new(column_size, Square.closed_not_mine)}
  end

  def size_of_row
    @squares.length
  end

  def size_of_column
    @squares[0].length
  end

  def get_square(row_of_position, column_of_position)
    @squares[row_of_position][column_of_position]
  end

  def set_mine(row_of_position, column_of_position)
    get_square(row_of_position, column_of_position).change_to_mine
  end

  def open_square(row_of_position, column_of_position)
    get_square(row_of_position, column_of_position).open
  end
end

=begin
    @squares.each do |row|
      row.each do |square|
        square.open
      end
    end
=end