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
end