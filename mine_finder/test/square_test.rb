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

  test '지뢰가 아닌 스퀘어를 열면 승리한다.' do
    @square.open!
    assert_true (@square.win?)
  end

  test '지뢰인 스퀘어를 열면 패배한다.' do
    @square.mine!
    @square.open!
    assert_false(@square.win?)
  end
end