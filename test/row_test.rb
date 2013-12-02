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
    @row.open(0)
    assert_true @row.open?(0)
    assert_false @row.open?(1)
    assert_false @row.open?(2)
  end

  test '1번째 셀 지뢰 심기' do
    @row.mine!(1)
    assert_false @row.mine?(0)
    assert_true @row.mine?(1)
    assert_false @row.mine?(2)
  end

  test '전부 열리거나 마인이면 이긴다' do
    @row.open(0)
    @row.mine!(1)
    @row.open(2)
    assert_true @row.win?
  end

  test '주변 마인 수 세기' do
    @row.mine!(0)
    @row.mine!(1)
    assert_equal 2, @row.near_mine_num(0)
    assert_equal 2, @row.near_mine_num(1)
    assert_equal 1, @row.near_mine_num(2)
  end

  test '주변 셀 열기' do
    @row.open_near(2)
    assert_false @row.open?(0)
    assert_true @row.open?(1)
    assert_true @row.open?(2)
  end

end