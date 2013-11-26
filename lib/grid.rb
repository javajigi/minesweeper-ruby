require 'square'

class Grid
  def initialize(row_size, column_size)
    @squares = Array.new(row_size){Array.new(column_size) { |index| Square.closed_not_mine }}
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

    row_start = row_of_position == 0 ? row_of_position : row_of_position - 1
    row_end = row_of_position == size_of_row - 1 ? row_of_position : size_of_row - 1
    column_start = column_of_position == 0 ? column_of_position : column_of_position - 1
    column_end = column_of_position == size_of_column - 1 ? column_of_position : size_of_column - 1

    for i in row_start..row_end
      for j in column_start..column_end
        puts "row : #{i}, column : #{j}"
        get_square(i, j).put_neighbor_mine
      end
    end
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