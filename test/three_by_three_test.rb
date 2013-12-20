require 'test/unit'
require '../src/board'

class MyTest < Test::Unit::TestCase
  setup do
    @board = Board.new(3)
    assert_equal 9, @board.spot_num
  end

  test "지뢰 없을 때 아무거나 오픈하면 자동 승" do
    @board.init_mine_count
    assert_not_equal "win", @board.state
    @board.open(1, 1)
    assert_equal "win", @board.state
    end
  test "모두 지뢰일 때 자동 승" do
    for i in 0...@board.rows
      for j in 0...@board.rows
        @board.set_mine(i, j)
      end
    end
    @board.init_mine_count
    @board.checkState
    assert_equal "win", @board.state
  end

  test "3X3에서 (0, 1) (1, 0) (1, 1)이 지뢰일 때, (0, 0)의 지뢰 개수는 3개를 출력" do
    @board.set_mine(0, 1)
    @board.set_mine(1, 0)
    @board.set_mine(1, 1)
    assert_equal 3, @board.mine_num

    @board.init_mine_count
    @board.open(0, 0)
    assert_equal 3, @board.get_square(0, 0).num_around_mine
  end

  test "3X3에서 (1, 0) (1, 1) (2, 1)이 지뢰일 때, (2, 0)의 지뢰 개수는 3개를 출력" do
    @board.set_mine(1, 0)
    @board.set_mine(1, 1)
    @board.set_mine(2, 1)
    assert_equal 3, @board.mine_num

    @board.init_mine_count
    @board.open(2, 0)
    assert_equal 3, @board.get_square(2, 0).num_around_mine
  end

  test "3X3에서 (0, 0) (0, 1) (1, 0)이 지뢰이고, (2, 2)열었을 때 render" do
    @board.set_mine(0, 0)
    @board.set_mine(0, 1)
    @board.set_mine(1, 0)
    @board.init_mine_count
    @board.open(2, 2)

    assert_equal(4, @board.open_num)
    assert_equal("   \n 31\n 10\n", @board.render)
  end

  test ""
end