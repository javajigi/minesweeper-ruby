require 'test/unit'
require '../lib/minesweeper/cell'

class CellTest < Test::Unit::TestCase
  setup do
    @cell = Cell.new
  end

  test '빈 셀로 초기화한다' do
    assert_equal(' ', @cell.to_s)
  end

  test '마인을 설치한다' do
    @cell.mine!
    assert_true @cell.mine?
  end

  test '셀을 오픈한다' do
    @cell.open
    assert_true @cell.open?
  end
end