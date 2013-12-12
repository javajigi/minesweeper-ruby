require 'test/unit'
require 'cell'

class CellTest < Test::Unit::TestCase
  setup do
    @cell = Cell.new
  end

  test '빈 셀로 초기화한다' do
    assert_true @cell.empty?
  end

  test '마인을 설치한다' do
    @cell.mine!
    assert_true @cell.mine?
  end

  test '셀을 오픈한다' do
    @cell.open
    assert_true @cell.open?
  end

  test '마인이면 이긴다' do
    @cell.mine!
    assert_true @cell.win?
  end

  test '열려있으면 이긴다' do
    @cell.open
    assert_true @cell.win?
  end

  test '플래그를 꼽는다' do
    @cell.flag!
    assert_true @cell.flag?
  end

end