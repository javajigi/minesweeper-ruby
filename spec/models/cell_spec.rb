#encoding: utf-8
require 'spec_helper'
require 'minesweeper/cell'

describe 'Cell' do
  before :each do
    @cell = Cell.new
  end

  context '열었을 경우' do
    it '마인이 발견되면 진다' do
      @cell.put_mine
      @cell.open
      @cell.win?.should be_false
    end

    it '마인이 발견되지 않으면 이긴다' do
      @cell.open
      @cell.win?.should be_true
    end
  end

  context '열지 않았을 경우' do
    it '마인이 발견되면 이긴다' do
      @cell.put_mine
      @cell.win?.should be_true
    end
    it '마인이 발견되지 않아도 아직 이긴데 아니다' do
      @cell.win?.should be_false
    end
  end
end