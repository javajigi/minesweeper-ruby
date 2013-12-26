require './helper'

require 'minesweeper/square'

class SquareTest < Test::Unit::TestCase

  setup do
    @square = Square.new
  end

  test '스퀘어가 닫혀있는 심볼을 출력' do
    assert_equal ' ', @square.symbol
  end

  test '스퀘어가 오픈된 심볼을 출력' do
    @square.open!
    assert_equal '0', @square.symbol
  end

  test '지뢰인 스퀘어를 오픈했을 때의 심볼을 출력' do
    @square.mine!
    @square.open!
    assert_equal '*', @square.symbol

  end

  test 'open되지 않은 스퀘어에 flag설치, symbol값 출력' do
    @square.flag!
    assert_true(@square.flaged)
    assert_equal('?',@square.symbol)
  end

  test 'open된 스퀘어에 flag설치, symbol값 출력' do
    @square.open!
    @square.flag!
    assert_false(@square.flaged)
    assert_equal('0',@square.symbol)
  end
end