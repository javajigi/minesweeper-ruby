require './helper'

require 'minesweeper/grid'
require 'minesweeper/index_out_of_bound_error'
require 'minesweeper/game_over_error'

class GridTest < Test::Unit::TestCase
  setup do
    @grid = Grid.create(Size.new(2,2))
    @zero_by_zero = Position.create(0, 0)
  end

  test '2 by 2로 초기화' do
    assert_equal 2, @grid.row
    assert_equal 2, @grid.column
  end

  test '(0, 0) 스퀘어를 찾아서 닫혀 있는 심볼을 출력' do
    assert_equal ' ', @grid.get_square( @zero_by_zero ).symbol
  end

  test '(0, 0) 스퀘어를 찾아서 마인이 아닌 열려있는 심볼을 출력' do
    @grid.open(@zero_by_zero)
    assert_equal '0', @grid.get_square( @zero_by_zero ).symbol
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
    @grid.open(@zero_by_zero)

    @grid.rows.each do |row|
      row.each do |square|
        assert_true square.opened
      end
    end
  end

  test '좌표 범위를 벗어나면 에러' do
    assert_raise IndexOutOfBoundError do
      @grid.open(Position.create(2, 2))
    end
  end

  test '지뢰를 열었을때 게임에 패배' do
    @grid.put_mine(@zero_by_zero)

    assert_raise GameOverError do
      @grid.open(@zero_by_zero)
    end
  end

  test '마인 설치시 주변 스퀘어의 마인 개수를 1증가' do
    @grid.put_mine(@zero_by_zero)
    assert_equal 1, @grid.get_square(Position.create(0, 1)).near_mine_num
    assert_equal 1, @grid.get_square(Position.create(1, 0)).near_mine_num
    assert_equal 1, @grid.get_square(Position.create(1, 1)).near_mine_num
  end

  test '그리드의 현재 상태를 출력' do
    @grid = Grid.create( Size.new(3,3) )
    @grid.put_mine(@zero_by_zero)
    @grid.open(Position.create(2, 2))

    assert_equal " 10\n110\n000\n", @grid.render
  end

  test '그리드에 랜덤마인 설치개수 테스트' do

    should_generate_mine_num = 6

    @grid = Grid.create_with_rand_mine(
        Size.new(should_generate_mine_num, should_generate_mine_num),
        should_generate_mine_num
    )

    did_generate_mine_num = 0

    (0...@grid.row).each do |row|
      (0...@grid.column).each do |col|
        did_generate_mine_num+=1 if @grid.get_square(Position.new(row, col)).mined
      end
    end

    assert_equal(did_generate_mine_num, should_generate_mine_num)
  end

end