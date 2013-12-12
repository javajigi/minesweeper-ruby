require 'test/unit'
require '../src/grid'
require '../src/square'
#require './helper'

class GridTest < Test::Unit::TestCase

  setup do
    @grid = Grid.new(2,2)
  end

  test 'Grid를 2x2로 초기화한다.' do
    assert_true(@grid !=nil)
    assert_equal(2, @grid.row)
    assert_equal(2, @grid.column)
  end

  test '(1, 1)이 지뢰이고, (1, 1)을 open하면 게임에 진다.' do
    square = @grid.get_square(1,1)
    square.mine!
    square.open!
    assert_false(square.win?)
  end

  test 'Grid 출력 테스트' do

    #초기화 출력테스트
    expect_result = "  "+"\n"+
                    "  "+"\n"
    assert_equal(expect_result, @grid.print)


    #0,0 마인설치 & 오픈후 출력
    expect_result = "* "+"\n"+
        "  "+"\n"

    @grid.mine!(0,0)
    @grid.open!(0,0)
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

  #test '(1, 1)이 지뢰이고, (1, 1)을 open하면 주변의 지뢰 숫자가 공개된다.' do
  #  expect_result = "11"+"\n"+
  #                  "1*"+"\n"
  #  @grid.mine!(1,1);
  #  @grid.open!(1,1);
  #
  #  assert_equal(expect_result, @grid.print)
  #end


end