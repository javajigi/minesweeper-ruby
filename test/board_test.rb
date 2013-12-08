require 'test/unit'
require 'board'

class BoardTest < Test::Unit::TestCase
  setup do
    @board = Board.new
  end

  test '행 3개로 초기화' do
    assert_equal 3, @board.rows.length
  end

  test '(0, 0) 셀 열기' do
    pos = Position.new(0, 0)
    @board.open(pos)
    assert_true @board.open?(Position.new(0, 0))
    assert_false @board.open?(Position.new(1, 0))
    assert_false @board.open?(Position.new(2, 1))
  end

  test '(1, 1) 마인 심기' do
    @board.mine!(Position.new(1, 1))
    assert_true @board.mine?(Position.new(1, 1))
    assert_false @board.mine?(Position.new(0, 0))
    assert_false @board.mine?(Position.new(2, 2))
  end

  test '각 셀이 전부 열리거나 마인이면 이긴다' do
    @board.open(Position.new(0, 0))
    @board.open(Position.new(0, 1))
    @board.open(Position.new(0, 2))
    @board.mine!(Position.new(1, 0))
    @board.mine!(Position.new(1, 1))
    @board.mine!(Position.new(1, 2))
    @board.open(Position.new(2, 0))
    @board.open(Position.new(2, 1))
    @board.open(Position.new(2, 2))
    assert_true @board.win?
  end

  test '주변 셀 열기' do
    @board.open_near(Position.new(2, 1))
    assert_false @board.open?(Position.new(0, 0))
    assert_true @board.open?(Position.new(1, 2))
    assert_true @board.open?(Position.new(2, 1))
    assert_true @board.open?(Position.new(2, 2))
  end

  #test '재귀적으로 주변 셀 열기' do
  #  @board.open_near(2, 2)
  #  assert_true @board.open?(2, 2)
  #  assert_true @board.open?(1, 1)
  #  assert_true @board.open?(0, 0)
  #end

  test '주변 셀 마크 표시하기' do

  end

  test '셀에 주변 마인 수 읽기' do
    @board.mine!(Position.new(0, 0))
    @board.mine!(Position.new(0, 2))
    @board.mine!(Position.new(1, 1))

    @board.open(Position.new(1, 0))
    assert_equal 2, @board.get_mark(Position.new(1, 0))

    @board.open(Position.new(0, 1))
    assert_equal 3, @board.get_mark(Position.new(0, 1))
  end
end