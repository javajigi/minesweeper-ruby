require 'test/unit'
require '../lib/minesweeper/game_controller'

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
end