#encoding: utf-8
require 'spec_helper'
require 'minesweeper/row'

describe 'Row는' do
  before :each do
    @row = Row.new
  end

  context '모든 Cell이 클리어 상태이면' do
    before :each do
      @row.stub(:cells) { [double(clear?: true), double(clear?: true), double(clear?: true)] }
    end

    it '클리어 상태이다' do
      @row.clear?.should be_true
    end
  end
end