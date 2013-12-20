require 'test/unit'
require '../src/board'
require '../src/size'
require '../src/position'

class TwoByTwoTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @board = Board.new(Size.new(2, 2))
    assert_equal 4, @board.spot_num
  end

  test "2X2일 때, 모두 지뢰인 경우 자동 win" do
    @board.set_mine(Position.new(0, 0))
    @board.set_mine(Position.new(0, 1))
    @board.set_mine(Position.new(1, 0))
    @board.set_mine(Position.new(1, 1))
    @board.checkState
    assert_equal "win", @board.state
  end

  test "Unit의 값, 즉 주변 지뢰 갯수 새기" do
    assert_equal 0, @board.count_around_mine(Position.new(0, 0))
  end

  test "누른 칸 주변이 공백일 때 같이 열림" do
    @board.init_mine_count
    @board.open(Position.new(0, 0))
    assert_equal 4, @board.open_num
  end

  test "2X2일 때, 모두 지뢰가 아닌 경우 아무거나 오픈하면 win" do
    @board.init_mine_count
    @board.open(Position.new(1, 0))
    assert_equal "win", @board.state
  end

  test "(0, 0)하나만 지뢰일 때, 지뢰 오픈하면 패" do
    @board.set_mine(Position.new(0, 0))
    assert_true @board.get_square(Position.new(0, 0)).mined?

    @board.open(Position.new(0, 0))
    assert_equal "lose", @board.state
  end

  test "(0, 0)하나만 지뢰일 때, 지뢰를 제외한 세개 오픈해야 윈" do
    @board.set_mine(Position.new(0, 0))

    @board.open(Position.new(0, 1))
    assert_equal "win", @board.state
  end
end