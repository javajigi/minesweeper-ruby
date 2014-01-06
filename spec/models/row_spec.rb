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
end