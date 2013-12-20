require 'test/unit'
require_relative '../src/board'
require '../src/size'

class BoardTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  setup do
    @board = Board.new(Size.new(1, 1))
  end
  # Customized test
  # Board test
  test "판 초기화" do
    puts "board.pan -> #{@board.squares}"
    assert_equal true, @board.squares[0][0].is_a?(Square)
  end
  # Called after every test method runs. Can be used to tear
  # down fixture information.

  test "판 출력" do
    puts @board.squares[0, 0]
  end

  test "전체 보드 개수 출력" do
    assert_equal 1, @board.spot_num
  end

  test "1X1일 때, 지뢰인 경우 자동 win" do
    @board.set_mine(Position.new(0, 0))
    assert_true @board.squares[0][0].mined
    @board.checkState
    assert_equal "win", @board.state
  end

  test "1X1일 때, 지뢰가 아닌 경우 open 하면 win" do
    assert_true @board.squares[0][0].is_a?(Square)
    assert_equal "lose", @board.state

    @board.open(Position.new(0, 0))
    @board.checkState
    assert_equal "win", @board.state
  end
end