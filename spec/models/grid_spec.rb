# encoding: utf-8
require 'spec_helper'
require 'minesweeper/grid'

describe 'Grid는' do
  before :each do
    @grid = Grid.new
    @row = double('Row')
    @grid.stub(:rows_at) { @row }
    @position = double('Position', x: 0, y: 0)
  end

  context '모든 Row가 클리어 상태인 경우' do
    before :each do
      @grid.stub(:rows) { [double(clear?: true), double(clear?: true), double(clear?: true)] }
    end

    it '클리어 상태이다' do
      @grid.clear?.should be_true
    end
  end

  context '주변 마인수가 0인 셀을 여는 경우' do
    before :each do
      @row.stub(open_cell_at: nil, near_mine_number_of: 0)
    end

    it '주변 셀들도 연다' do
      @grid.should_receive(:open_near_cells_of).with(@position)
      @grid.open_cell_at(@position)
    end
  end

end