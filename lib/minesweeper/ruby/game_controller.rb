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

  def run
    rand_mines
    until @board.win?
      puts @board, '어느 곳을 열어보시겠습니까?'
      position = Position.position_from_get
      break if @board.mine?(position)
      @board.open(position)
      @board.open_near(position) if @board.safe?(position)
    end
    puts @board, '< Game Over >'
  end

  def rand_mines
    5.times.each do
      position = Position.rand_position
      @board.mine!(position)
    end
  end
end