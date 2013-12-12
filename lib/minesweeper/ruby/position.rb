require 'board'
require 'row'

class Position
  attr_reader :row, :cell

  def initialize(x, y)
    @row = x.to_i
    @cell = y.to_i
  end

  def valid?
    valid_row? && valid_cell?
  end

  def near_rows_pos
    result = []
    result << Position.new(@row-1, @cell) if Position.new(@row-1, @cell).valid?
    result << Position.new(@row, @cell) if Position.new(@row, @cell).valid?
    result << Position.new(@row+1, @cell) if Position.new(@row+1, @cell).valid?
    result
  end

  def near_cells_pos
    result = []
    result << Position.new(@row, @cell-1) if Position.new(@row, @cell-1).valid?
    result << Position.new(@row, @cell) if Position.new(@row, @cell).valid?
    result << Position.new(@row, @cell+1) if Position.new(@row, @cell+1).valid?
    result
  end

  private
  def valid_row?
    (0 <= @row) && (@row < Board.row_num)
  end

  def valid_cell?
    (0 <= @cell) && (@cell < Row.cell_num)
  end
end