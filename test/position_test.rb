require 'minesweeper/position'
require 'minesweeper/index_out_of_bound_error'
require './helper'

class PositionTest < Test::Unit::TestCase
  test '유효한 Position 객체 생성' do
    assert_equal(Position.new(1, 2), Position.new(1, 2))
    assert_not_equal(Position.new(1, 1), Position.new(0, 0))
  end

  test '유효하지 않은 Position 객체 생성' do
    assert_raise IndexOutOfBoundError do
      Position.new(-1, -1)
    end
  end
end

