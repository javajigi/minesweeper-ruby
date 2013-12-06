require './helper'

require 'minesweeper/grid'
require 'minesweeper/index_out_of_bound_error'
require 'minesweeper/game_over_error'

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

  test '모두 지뢰 초기화' do
    put_all_square_mine()

    @grid.rows.each do |row|
      row.each do |square|
        assert_true square.mined
      end
    end
  end

  def put_all_square_mine
    @grid.rows.each do |row|
      row.each do |square|
        square.mine!
      end
    end
  end

  test '모두 지뢰일때 자동 승' do
    put_all_square_mine()

    assert_true @grid.win?
  end

  test '오픈하면 주변 오픈' do
    @grid.open(0, 0)

    @grid.rows.each do |row|
      row.each do |square|
        assert_true square.opened
      end
    end
  end

  test '좌표 범위를 벗어나면 에러' do
    assert_raise IndexOutOfBoundError do
      @grid.open(2, 2)
    end
  end

  test '지뢰를 열었을때 게임에 패배' do
    @grid.put_mine(0, 0)

    assert_raise GameOverError do
      @grid.open(0, 0)
    end
  end

  test '마인 설치시 주변 스퀘어의 마인 개수를 1증가' do
    @grid.put_mine(0, 0)
    assert_equal 1, @grid.get_square(0, 1).near_mine_num
    assert_equal 1, @grid.get_square(1, 0).near_mine_num
    assert_equal 1, @grid.get_square(1, 1).near_mine_num
  end

  test '그리드의 현재 상태를 출력' do
    @grid = Grid.new(3, 3)
    @grid.put_mine(0, 0)
    @grid.open(2, 2)

    assert_equal " 10\n110\n000\n", @grid.render
  end
end