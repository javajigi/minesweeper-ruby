require '../src/index_out_of_bound_error' #현재 경로가 mine_finder라서 그렇다.

class Grid

  def initialize(row, column)
    @rows = Array.new(row){Array.new(column) { |index| Square.new }}
  end

  def row
    return @rows.length
  end

  def column
    return @rows[0].length
  end

  def get_square(x, y)
    raise IndexOutOfBoundError.new if out_of_index?(x, y)
    return @rows[x][y]
  end

  def mine!(x, y)
    square = get_square(x, y)
    square.mine!

    near_squares = Array.new
    near_squares = get_near_squares(x, y)

    near_squares.each do |square|
      square.increase_near_mine_num
    end
  end

  def open!(x, y)
    square = get_square(x, y)
    square.open!

    near_squares = Array.new
    near_squares = get_near_squares(x, y)

    near_squares.each do |square|
      square.open! if square.is_near_mine_num_zero?
    end

    # eternel loop!!!
    #(x-1..x+1).each do |row|
    #  (y-1..y+1).each do |col|
    #    next if out_of_index?(row, col)
    #    open!(row,col) if get_square(row, col).is_near_mine_num_zero?
    #  end
    #end
  end

  def out_of_index?(x, y)
    return (x < 0 or x >= row or y < 0 or y >= column)
  end

  def print
    grid_status = ""
    @rows.each do |row|
      row.each do |square|
        grid_status += square.symbol
      end
      grid_status +="\n"
    end
    puts grid_status
    return grid_status
  end

  def get_near_squares(x, y)
    arr = Array.new

    (x-1..x+1).each do |row|
      (y-1..y+1).each do |col|
        arr << get_square(row, col) unless out_of_index?(row, col)
      end
    end
    return arr
  end
end