require 'test/unit'
require '../lib/minesweeper/game_controller'
require '../lib/minesweeper/board'

class GameControllerTest < Test::Unit::TestCase

  def setup
    @gc = GameController.new
  end

  test '보드의 크기를 바꾼다' do
    @gc.set_row_num(5)
    @gc.set_cell_num(5)
    assert_equal 5, Board.row_num
    assert_equal 5, Row.cell_num
  end

  test '보드를 출력한다' do
    @gc.board.mine!(2, 2)
    @gc.board.open(1, 1)
    @gc.board.set_mark(1, 1)
    assert_equal("   \n 1 \n  *\n", @gc.print)
  end
end