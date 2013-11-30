require_relative 'board'
require_relative 'row'

class GameController
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def set_row_num(i)
    Board.row_num = i
  end

  def set_cell_num(i)
    Row.cell_num = i
  end

  def parse(str)
    str.split(', ')
  end

  def open(x, y)
    @board.open(x.to_i, y.to_i)
  end

  def print
    board.to_s
  end
end


