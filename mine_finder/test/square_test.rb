require 'test/unit'
require '../src/square'

class SquareTest < Test::Unit::TestCase
  setup do
    @square = Square.new
  end


  test '초기화 테스트' do
    assert_true(true, @square != nil)
  end

  #Square 초기화 한다. => close 상태, mine이 아닌 상태
  test '스퀘어 open, close 테스트' do
    assert_false (@square.opened?)
    @square.open!
    assert_true (@square.opened?)
  end

  test '스퀘어 마인 설치테스트' do
    assert_false (@square.mine?)
    @square.mine!
    assert_true (@square.mine?)
  end
end