require 'test/unit'
require '../src/square'

class SquareTest < Test::Unit::TestCase

  test "열리지 않은 심볼 출력" do
    square = Square.new
    assert_equal(' ', square.symbol)
  end

  test "열리고, 지뢰일 때 심볼 출력" do
    square = Square.new
    square.mined = true
    square.opened = true
    assert_equal('*', square.symbol)
  end

  test "열리고, 지뢰가 아닐 때 심볼 출력" do
    square = Square.new
    square.mined = false
    square.opened = true
    assert_equal("0", square.symbol)
  end

  test "열리지 않고, 깃발일 때 심볼" do
    square = Square.new

  end
end