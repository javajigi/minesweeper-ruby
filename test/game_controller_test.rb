require 'test/unit'
require 'game_controller'
require 'board'

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

  test '입력값을 파싱하여 x, y값을 구한다' do
    x, y = @gc.parse('1, 2')
    assert_equal '1', x
    assert_equal '2', y
  end
end