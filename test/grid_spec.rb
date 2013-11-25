require './helper'

require 'grid'

describe '2 by 2 Grid' do
  before(:each) do
    @grid = Grid.new(2, 2)
  end

  it '2 by 2 크기의 Grid를 생성할 때 row와 column 크기' do
    expect(@grid.size_of_row).to eq(2)
    expect(@grid.size_of_column).to eq(2)
  end

  it '(0,0)에 mine을 매설할 때 (0,0) 위치의 Square는 mine 매설 상태' do
    @grid.set_mine(0, 0)
    expect(@grid.get_square(0, 0)).to eq(Square.closed_mine)
  end
end