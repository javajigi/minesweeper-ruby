require 'test/unit'
require '../lib/minesweeper/cell'

class CellTest < Test::Unit::TestCase
  cell = nil

  setup do
    cell = Cell.new
  end

  test '셀을 오픈한다' do
    puts cell.open
  end

  test '"*"로 초기화한다' do
    cell.fake_init '*'
    assert_equal('*', cell.to_s)
  end

  test '" "로 초기화한다' do
    cell.fake_init ' '
    assert_equal(' ', cell.to_s)
  end

end