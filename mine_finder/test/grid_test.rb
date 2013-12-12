require 'test/unit'
require '../src/grid'
require '../src/square'
require '../src/game_over_error'
#require './helper'

class GridTest < Test::Unit::TestCase

  setup do
    @grid = Grid.new(2,2,0)
  end

  test 'Grid를 2x2로 초기화한다.' do
    assert_true(@grid !=nil)
    assert_equal(2, @grid.row)
    assert_equal(2, @grid.column)
  end

  test '(1, 1)이 지뢰이고, (1, 1)을 open하면 게임에 진다.' do
    square = @grid.get_square(1,1)
    square.mine!

    assert_raise GameOverError do
      square.open!
    end
  end

  test 'Grid 출력 테스트' do

    #초기화 출력테스트
    expect_result = "  "+"\n"+
                    "  "+"\n"
    assert_equal(expect_result, @grid.print)

    expect_result = " 1"+"\n"+
        "  "+"\n"

    @grid.mine!(0,0)
    @grid.open!(0,1)
    assert_equal(expect_result, @grid.print)
  end


  test '(0, 0)에 지뢰를 설치할 때 주변 square의 주변 지뢰 숫자가 1씩 증가한다.' do
    @grid.mine!(0,0)
    square = @grid.get_square(1,0);
    assert_equal(1,square.near_mine_num);
  end

  test '잘못된 위치의 square를 참조하고자 할 경우에는 IndexOutOfException을 발생시킨다.' do
    assert_raise IndexOutOfBoundError do
      @grid.get_square(-1, -1)
    end
  end

  test '(1, 1)이 지뢰이고, (0, 0)을 open하면 주변의 지뢰 숫자가 공개된다.' do
    expect_result = "1 "+"\n"+
                    "  "+"\n"
    @grid.mine!(1,1);
    @grid.open!(0,0);

    assert_equal(expect_result, @grid.print)
  end

  test '모두 지뢰가 아닌 경우 특정 위치 하나를 open하면 모든 square가 open된다.' do
    expect_result = "00"+"\n"+
        "00"+"\n"

    @grid.open!(0,0)
    assert_equal(expect_result, @grid.print)
  end

  #현재단계에서 구현할 사항이 아니므로 모든 경우에 대해 임시 true값을 반환토록 처리함
  test '모두 지뢰인 경우 자동으로 win' do
    assert_true(@grid.win?)
  end

  test 'Grid mine 랜덤 설치 테스트' do

    @grid = Grid.new(3,3,0)
    rand_num = 5;
    fail_num = 0;

    row_rand_arr = Array.new
    col_rand_arr = Array.new

    #열과 행에 해당하는 배열에 각각 랜덤숫자를 담는다.
    (0...rand_num).each do
      row_rand_arr << rand(0...@grid.row);
      col_rand_arr << rand(0...@grid.column);
    end

    #열과 행에서 순서대로 랜덤숫자값을 빼내어, 마인 설치함수에 차례로 집어 넣는다.
    #set_mine함수는 마인설치에 성공하면 1을, 실패하면 0을 리턴(실패하는 경우는 목표지점에 마인이 이미 설치되어 있는 경우이다.)
    #이후 최종 설치갯수를 테스트하기 위해서 fail_num이라는 지역변수에 실패한 갯수를 저장해주고 있다.
    (0...rand_num).each do |num|
      temp= @grid.set_mine( row_rand_arr[num], col_rand_arr[num] )
      if ( temp == 0 )
        fail_num += 1;
      end
    end

    #랜덤 열,행 배열에서 저장된 랜덤값들을 가져온다. 가져온 인덱스에 해당하는 스퀘어에 모두 마인설치가 됬는지 확인한다.
    (0...rand_num).each do |num|
      assert_true( @grid.get_square( row_rand_arr[num], col_rand_arr[num] ).mined )
    end

    #설치된 마인들을 저장해 놓은 grid의 mines 배열의 갯수와 테스트 초기에 설정한 초기값이 일치하는지 확인한다.
    mines = @grid.mines
    assert_equal(mines.length, rand_num-fail_num);
  end

  test 'Grid 초기화 할 때, mine 랜덤 설치' do

    generate_num = 4

    @grid = Grid.new(3,3, generate_num)
    assert_equal(generate_num, @grid.mines.length)
  end

  test '모든 지뢰에만 flag 꽂았을 때 게임 승' do
    @grid.set_mine(0, 0)
    @grid.set_mine(1, 1)
    @grid.set_mine(0, 1)

    @grid.get_square(0, 0).flag!
    assert_false(@grid.win?)

    @grid.get_square(1, 1).flag!
    assert_false(@grid.win?)

    @grid.get_square(0,1).flag!
    assert_true(@grid.win?)

    @grid.set_mine(1, 0)
    assert_false(@grid.win?)

    @grid.get_square(1, 0).flag!
    assert_true(@grid.win?)
  end

end