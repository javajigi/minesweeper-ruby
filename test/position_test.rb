require 'test/unit'
require '../src/position'
require '../src/index_out_of_bound_error'

class MyTest < Test::Unit::TestCase

  setup do

  end

  test "position 초기화" do
    pos = Position.new(1, 2)
    assert_equal(1, pos.x)
    assert_equal(2, pos.y)
  end

  test "유요한 객체 생성" do
    assert_equal(Position.new(1, 2), Position.new(1, 2))
  end

  test "0보다 작거나 num보다 크면 에러" do
    assert_raise IndexOutOfBoundError do
      Position.new(-1, -1)
    end
  end
end