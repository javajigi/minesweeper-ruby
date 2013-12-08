class Position
  attr_reader :row, :cell

  def initialize(x, y)
    @row = x
    @cell = y
  end

  def valid?
    valid_row? && valid_cell?
  end

  def near_rows_pos
    [Position.new(@row-1, @cell), self, Position.new(@row+1, @cell)]
  end

  def near_cells_pos
    [Position.new(@row, @cell-1), self, Position.new(@row, @cell+1)]
  end

  private
  def valid_row?
    (0 <= @row) && (@row < Board.row_num)
  end

  def valid_cell?
    (0 <= @cell) && (@cell < Row.cell_num)
  end
end