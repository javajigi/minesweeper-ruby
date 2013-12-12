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

    (x-1..x+1).each do |row|
      (y-1..y+1).each do |col|
        get_square(row, col).increase_near_mine_num unless out_of_index?(row, col)
      end
    end

  end

  def open!(x, y)
    square = get_square(x, y)
    square.open!
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
end