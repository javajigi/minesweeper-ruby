# encoding: utf-8
require 'spec_helper'
require 'minesweeper/grid'

describe 'Grid' do
  before :each do
    @grid = Grid.new
  end

  context '모든 행이 이겼을 경우' do
    it '이긴다' do
      @grid.should_receive(:rows) { [double('Row', win?: true), double('Row', win?: true)] }
      @grid.win?.should be_true
    end
  end

  context '이기지 않은 행이 존재할 경우' do
    it '아직 이긴게 아니다' do
      @grid.should_receive(:rows) { [double('Row', win?: false), double('Row', win?: true)] }
      @grid.win?.should be_false
    end
  end

  it '셀에 마인을 심는다' do
    position = double('Position', x: 0, y: 0)
    row = double('Row')
    row.should_receive(:put_mine).with(0)

    @grid.should_receive(:rows) {[row, double('Row'), double('Row')]}
    @grid.put_mine(position)
  end
end