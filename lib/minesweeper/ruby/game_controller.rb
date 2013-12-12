require 'board'
require 'row'

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
    str.split(/,\s*/)
  end

  def run
    until @board.win?
      puts @board, '어느 곳을 열어보시겠습니까?'
      x, y = parse(gets)
      position = Position.new(x, y)
      break if @board.mine?(position)
      @board.open(position)
      @board.open_near(position) if @board.safe?(position)
    end
    puts @board, '< Game Over >'
  end
end