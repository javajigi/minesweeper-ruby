require './helper'
require 'minesweeper/size'
require 'minesweeper/index_out_of_bound_error'

class SizeTest < Test::Unit::TestCase
  test '유효한 사이즈 객체 생성' do
    assert_equal(Size.new(2,2), Size.new(2,2))
  end

  test '유효하지 않은 사이즈 객체 생성' do
    assert_raise IndexOutOfBoundError do
      Size.new(0, 0)
    end
  end

  test '사이즈에 유효한 포지션을 체크' do
    size = Size.new(5,5)
    pos = Position.new(3,3)

    assert_true(size.valid_position?(pos))
  end

  #test '주변 square의 유효성을 판단하고, 유효한 스퀘어들의 배열을 생성' do
  #  size = Size.new(3,3)
  #  arr = Array.new
  #
  #  size.near_squares_each(new Position(0,0)) do |square|
  #    arr << square
  #  end
  #
  #  assert_true(arr.include?(new Position(0,0)));
  #  assert_true(arr.include?(new Position(0,1)));
  #  assert_true(arr.include?(new Position(1,0)));
  #  assert_true(arr.include?(new Position(1,1)));
  #end
end