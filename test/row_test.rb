require 'test/unit'
require_relative '../lib/minesweeper/row'

class RowTest < Test::Unit::TestCase
  row = nil
  setup do
    row = Row.new
  end

  test '주변 지뢰의 수를 준다' do
    row.fake_init2
    assert_equal(1, row.mine_num(0))
  end

  test '전부 지뢰이면 이긴다' do
    row.fake_init1
    assert_equal(true, row.clear?)
    row.fake_init2
    assert_equal(false, row.clear?)
  end

  test '"***"로 초기화한다' do
    row.fake_init1
    assert_equal('***', row.to_s)
  end
  test '" **"로 초기화한다' do
    row.fake_init2
    assert_equal(' **', row.to_s)
  end
  test '"* *"로 초기화한다' do
    row.fake_init3
    assert_equal('* *', row.to_s)
  end
  test '"** "로 초기화한다' do
    row.fake_init4
    assert_equal('** ', row.to_s)
  end
  test '"*  "로 초기화한다' do
    row.fake_init5
    assert_equal('*  ', row.to_s)
  end
  test '" * "로 초기화한다' do
    row.fake_init6
    assert_equal(' * ', row.to_s)
  end
  test '"  *"로 초기화한다' do
    row.fake_init7
    assert_equal('  *', row.to_s)
  end
  test '"   "로 초기화한다' do
    row.fake_init8
    assert_equal('   ', row.to_s)
  end
end