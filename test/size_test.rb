require 'test/unit'
require '../src/size'

class SizeTest < Test::Unit::TestCase
  test "초기화" do
    assert_equal(Size.new(2, 2), Size.new(2, 2))
  end

  test '유효하지 않은 객체 생성' do
    assert_raise IndexOutOfBoundError do
      Size.new(0, 0)
    end
  end

  test '사이즈에 유효한 포지션 체크' do
    size = Size.new(5, 5)
    pos = Position.new(3, 3)

    assert_true(size.valid_position?(pos))
  end
end