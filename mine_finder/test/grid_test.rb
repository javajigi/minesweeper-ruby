require 'test/unit'
require '../src/grid'
require '../src/square'
#require './helper'

class GridTest < Test::Unit::TestCase

  setup do
    @grid = Grid.new(2,2)
  end

  test 'Grid를 2x2로 초기화한다.' do
    assert_true(@grid !=nil)
    assert_equal(2, @grid.row)
    assert_equal(2, @grid.column)
  end

  test '(1, 1)이 지뢰이고, (1, 1)을 open하면 게임에 진다.' do
    square = @grid.get_square(1,1);
    square.mine!
    square.open!
    assert_false(square.win?)
  end
end