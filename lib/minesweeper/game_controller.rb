require_relative 'board'
require_relative 'row'

class GameController
  def set_row_num(i)
    Board.row_num = i
  end
  def set_cell_num(i)
    Row.cell_num = i
  end
end