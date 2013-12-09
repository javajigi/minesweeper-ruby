require 'test/unit'
require '../src/square'

class SquareTest < Test::Unit::TestCase
  setup do
    @square = Square.new
  end


  test '초기화 테스트' do
    assert_true(true, @square != nil)
  end

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

  test '스퀘어가 close 상태일 경우 공란문자를 반환한다.' do
    assert_false(@square.opened?)
    assert_equal(' ', @square.symbol)
  end

  #Square를 open할 때 mine이 아니면 숫자 '0'을 반환한다.
  test '스퀘어가 오픈상태일때 마인이 아니면 문자 0을 반환한다' do
    @square.open!
    assert_equal('0', @square.symbol)
  end

  test '스퀘어가 오픈상태일때 마인이면 문자 *을 반환한다' do
    @square.open!
    @square.mine!
    assert_equal('*', @square.symbol)
  end
end