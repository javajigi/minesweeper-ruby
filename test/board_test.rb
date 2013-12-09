require 'test/unit'
require 'board'

class BoardTest < Test::Unit::TestCase
  setup do
    @board = Board.new
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



  test '주변 셀 열기' do
    @board.open_near(Position.new(2, 1))
    assert_true @board.open?(Position.new(1, 2))
    assert_true @board.open?(Position.new(2, 1))
    assert_true @board.open?(Position.new(2, 2))
  end

  test '재귀적으로 주변 셀 열기' do
    @board.open_near(Position.new(0, 0))
    puts @board
    assert_true @board.open?(Position.new(2, 2))
    assert_true @board.open?(Position.new(1, 1))
    assert_true @board.open?(Position.new(0, 0))

  end

  test '셀에 주변 마인 수 읽기' do
    @board.mine!(Position.new(0, 0))
    @board.mine!(Position.new(0, 2))
    @board.mine!(Position.new(1, 1))

    assert_equal 2, @board.near_mine_num(Position.new(1, 0))
    assert_equal 3, @board.near_mine_num(Position.new(0, 1))
  end
end