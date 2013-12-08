require 'test/unit'
require 'row'

class RowTest < Test::Unit::TestCase
  setup do
    @row = Row.new
  end

  test '셀 3개로 초기화' do
    assert_equal 3, @row.cells.length
  end

  test '0번째 셀 열기' do
    @row.open(Position.new(0, 0))
    assert_true @row.open?(Position.new(0, 0))
    assert_false @row.open?(Position.new(0, 1))
    assert_false @row.open?(Position.new(0, 2))
  end

  test '1번째 셀 지뢰 심기' do
    @row.mine!(Position.new(0, 1))
    assert_false @row.mine?(Position.new(0, 0))
    assert_true @row.mine?(Position.new(0, 1))
    assert_false @row.mine?(Position.new(0, 2))
  end

  test '전부 열리거나 마인이면 이긴다' do
    @row.open(Position.new(0, 0))
    @row.mine!(Position.new(0, 1))
    @row.open(Position.new(0, 2))
    assert_true @row.win?
  end

  test '마인 심으면 주변 셀의 주변마인수를 올린다' do
    @row.increment_near_mine_num(Position.new(0, 0))
    assert_equal 1, @row.near_mine_num(Position.new(0, 0))
    assert_equal 1, @row.near_mine_num(Position.new(0, 1))
    assert_equal 0, @row.near_mine_num(Position.new(0, 2))
  end

  test '주변 셀 열기' do
    @row.open_near(Position.new(0, 2))
    assert_false @row.open?(Position.new(0, 0))
    assert_true @row.open?(Position.new(0, 1))
    assert_true @row.open?(Position.new(0, 2))
  end
end