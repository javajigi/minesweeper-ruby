require 'minesweeper/position'
require 'minesweeper/index_out_of_bound_error'
require './helper'

class PositionTest < Test::Unit::TestCase
  test '유효한 Position 객체 생성' do
    assert_equal(Position.create(1, 2), Position.create(1, 2))
    assert_not_equal(Position.new(1, 1), Position.new(0, 0))
  end

  test '유효하지 않은 Position 객체 생성' do
    assert_raise IndexOutOfBoundError do
      Position.new(-1, -1)
    end
  end

  test '(0, 0)포지션의 주변 포지션 배열 생성' do
    pos = Position.new(0, 0)

    posArr = Array.new
    posArr << Position.new(0, 1)
    posArr << Position.new(1, 0)
    posArr << Position.new(1, 1)

    pos.near_positions.each do |position|
      assert_true(posArr.include?(position))
    end
  end

  test '(1, 1)포지션의 주변 포지션 배열 생성' do
    pos = Position.new(1, 1)

    posArr = Array.new
    (0..2).each do |x|
      (0..2).each do |y|
        posArr << Position.new(x, y)
      end
    end

    posArr.delete(pos)

    near_positions = pos.near_positions
    puts near_positions.inspect
    posArr.each do |position|
      assert_true(near_positions.include?(position))
    end
  end
end