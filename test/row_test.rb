require 'test/unit'
require 'row'

class RowTest < Test::Unit::TestCase
  setup do
    @row = Row.new
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

  test '마인 심으면 주변 셀의 주변마인수를 올린다' do
    @row.increment_near_mine_num(Position.new(0, 0))
    assert_equal 1, @row.near_mine_num(Position.new(0, 0))
    assert_equal 1, @row.near_mine_num(Position.new(0, 1))
    assert_equal 0, @row.near_mine_num(Position.new(0, 2))
  end

  test '0번째 셀 플래그 꽂기' do
    @row.flag!(Position.new(0, 0))
    assert_true @row.flag?(Position.new(0, 0))
    assert_false @row.flag?(Position.new(0, 1))
    assert_false @row.flag?(Position.new(0, 2))
  end
end