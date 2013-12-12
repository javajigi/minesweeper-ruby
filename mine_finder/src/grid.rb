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
    return @rows[x][y]
  end

  def mine!(x, y)
    square = get_square(x, y)
    square.mine!
  end

  def open!(x, y)
    square = get_square(x, y)
    square.open!
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