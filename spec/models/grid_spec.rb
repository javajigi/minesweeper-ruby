# encoding: utf-8
require_relative '../spec_helper'
require 'minesweeper/grid'

describe Grid do
  before :each do
    @grid = Grid.new
  end

  context '1x1 그리드에서 셀이 마인인 경우,' do
    it '그냥 이긴다.' do
      cell = double('Cell')
      cell.stub(:mine?) { true }
      @grid.should_receive(:cells) { [cell] }
      @grid.win?.should be_true
    end
  end

  context '1x1 그리드에서 셀이 마인이 아닌 경우,' do
    it '오픈 안 하면 이긴게 아니다.' do
      cell = double('Cell')
      cell.stub(:mine?) { false }
      @grid.should_receive(:cells) { [cell] }
      @grid.win?.should be_false
    end

    it '오픈하면 이긴다.' do
      cell = double('Cell')
      cell.should_receive(:open)
      @grid.should_receive(:cells) {[cell]}
      @grid.open
    end
  end
end