require 'test/unit'
require 'position'

class PositionTest < Test::Unit::TestCase

  test '0<= 행 < Board.row_num' do
    assert_true Position.new(1, 1).valid?
    assert_true Position.new(0, 1).valid?
    assert_true Position.new(Board.row_num-1, 0).valid?
    assert_false Position.new(Board.row_num, 1).valid?
  end

  test '0<= 열 < Row.cell_num' do
    assert_true Position.new(1, 1).valid?
    assert_true Position.new(0, 1).valid?
    assert_true Position.new(Board.row_num-1, Row.cell_num-1).valid?
    assert_false Position.new(Board.row_num-1, Row.cell_num).valid?
  end

  test '주변 행 찾기' do
    assert_equal 3, Position.new(1, 1).near_rows_pos.count
    assert_equal 2, Position.new(Board.row_num-1, 1).near_rows_pos.count
    assert_equal 1, Position.new(Board.row_num, 1).near_rows_pos.count
  end

  test '주변 열 찾기' do
    assert_equal 3, Position.new(1, 1).near_cells_pos.count
    assert_equal 2, Position.new(1, Row.cell_num-1).near_cells_pos.count
    assert_equal 1, Position.new(1, Row.cell_num).near_cells_pos.count
  end

end