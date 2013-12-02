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
    str.split(/,\s*/)
  end

  def run
    @board.mine!(2, 2)
    while true
      puts @board
      puts '어느 곳을 열어보시겠습니까?'
      x, y = parse(gets)
      x = x.to_i
      y = y.to_i
      break if @board.mine?(x, y)
      @board.open(x, y)
      @board.set_mark(x, y)
      @board.open_near(x, y) if @board.get_mark(x, y) == 0
    end
    puts '< Game Over >'
  end
end