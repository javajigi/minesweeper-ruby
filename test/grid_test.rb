require './helper'

require 'minesweeper/grid'

class GridTest < Test::Unit::TestCase
  setup do
    @grid = Grid.new(2, 2)
  end

  test '2 by 2로 초기화' do
    assert_equal 2, @grid.row
    assert_equal 2, @grid.column
  end

  test '(0, 0) 스퀘어를 찾아서 닫혀 있는 심볼을 출력' do
    assert_equal ' ', @grid.get_square(0, 0).symbol
  end

  test '(0, 0) 스퀘어를 찾아서 마인이 아닌 열려있는 심볼을 출력' do
    @grid.open(0, 0)
    assert_equal '0', @grid.get_square(0, 0).symbol
  end

end