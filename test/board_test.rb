require 'test/unit'
require_relative '../lib/minesweeper/board'

class BoardTest < Test::Unit::TestCase
  setup do
    @board = Board.new
  end

  test '행 3개로 초기화' do
    assert_equal 3, @board.rows.length
  end

  test '(0, 0) 셀 열기' do
    @board.open(0, 0)
    assert_true @board.open?(0, 0)
    assert_false @board.open?(1, 0)
    assert_false @board.open?(2, 1)
  end

  test '(1, 1) 마인 심기' do
    @board.mine!(1, 1)
    assert_true @board.mine?(1, 1)
    assert_false @board.mine?(0, 0)
    assert_false @board.mine?(2, 2)
  end

  test '각 셀이 전부 열리거나 마인이면 이긴다' do
    @board.open(0, 0)
    @board.open(0, 1)
    @board.open(0, 2)
    @board.mine!(1, 0)
    @board.mine!(1, 1)
    @board.mine!(1, 2)
    @board.open(2, 0)
    @board.open(2, 1)
    @board.open(2, 2)
    assert_true @board.win?
  end

  test '주변 마인수 세기' do
    @board.mine!(1, 1)
    @board.mine!(2, 0)
    @board.mine!(2, 2)
    assert_equal 1, @board.near_mine_num(0, 0)
    assert_equal 2, @board.near_mine_num(1, 0)
    assert_equal 3, @board.near_mine_num(2, 1)
  end

  test '주변 셀 열기' do
    @board.open_near(2, 1)
    assert_false @board.open?(0, 0)
    assert_true @board.open?(1, 2)
    assert_true @board.open?(2, 1)
    assert_true @board.open?(2, 2)
  end

  test '셀에 주변 마인 수 입력하기' do
    @board.mine!(0, 0)
    @board.mine!(0, 2)
    @board.mine!(1, 1)

    @board.set_mark(1, 0)
    assert_equal 2, @board.rows[1].cells[0].mark

    @board.set_mark(0, 1)
    assert_equal 3, @board.rows[0].cells[1].mark
  end
end