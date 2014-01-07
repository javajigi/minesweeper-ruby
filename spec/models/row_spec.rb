#encoding: utf-8
require 'spec_helper'
require 'minesweeper/row'

describe 'Row' do
  before :each do
    @row = Row.new
  end

  context '모든 셀이 이겼을 경우' do
    it '이긴다' do
      @row.should_receive(:cells) { [double('Cell', win?: true), double('Cell', win?: true)] }
      @row.win?.should be_true
    end
  end

  context '이기지 않은 셀이 존재할 경우' do
    it '아직 이긴게 아니다' do
      @row.should_receive(:cells) { [double('Cell', win?: false), double('Cell', win?: true)] }
      @row.win?.should be_false
    end
  end

  it '셀에 마인을 심는다' do
    cell = double('Cell')
    cell.should_receive(:put_mine)
    @row.should_receive(:cells) { [cell, double('Cell'), double('Cell')] }
    @row.put_mine(0)
  end

  it '셀을 연다' do
    cell = double('Cell')
    cell.should_receive(:open)
    @row.should_receive(:cells) { [cell, double('Cell'), double('Cell')] }
    @row.open_cell(0)
  end
end