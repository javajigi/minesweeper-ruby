# encoding: utf-8
require_relative '../spec_helper'
require 'minesweeper/grid'

describe '1x1 그리드' do
  before :each do
    @grid = Grid.new
  end

  context '셀이 마인인 경우,' do
    it '그냥 이긴다.' do
      cell = double('Cell')
      cell.stub(:mine?) { true }
      @grid.should_receive(:cells) { [cell] }
      @grid.win?.should be_true
    end
  end

  context '셀이 마인이 아닌 경우,' do
    it '오픈 안 하면 이긴게 아니다.' do
      cell = double('Cell')
      cell.stub(:mine?) { false }
      @grid.should_receive(:cells) { [cell] }
      @grid.win?.should be_false
    end

    it '오픈하면 이긴다.' do
      cell = double('Cell')
      cell.should_receive(:open)
      @grid.should_receive(:cells) { [cell] }
      @grid.open
    end
  end
end

describe '2x2 그리드' do
  context '마인이 0개인 경우,' do
    it '오픈 안 하면 이긴게 아니다.' do

    end

    it '하나를 오픈하면 이긴다.' do

    end
  end

  context '마인이 1, 2개인 경우,' do
    it '마인을 오픈하면 진다.' do

    end

    it '마인이 아닌걸 오픈하면 아무일도 없다.' do

    end

    it '마인이 아닌걸 전부 오픈하면 이긴다.' do

    end
  end

  context '마인이 3개인 경우,' do
    it '마인을 오픈하면 진다.' do

    end

    it '마인이 아닌걸 오픈하면 이긴다.' do

    end
  end

  context '마인이 4개인 경우,' do
    it '그냥 이긴다.' do

    end
  end
end