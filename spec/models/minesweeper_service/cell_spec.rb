#encoding: utf-8
require 'spec_helper'
require 'minesweeper/minesweeper_service/cell'

describe 'Cell은' do
  before :each do
    @cell = MinesweeperService::Cell.new
  end

  context '지뢰가 있을 경우' do
    before :each do
      @cell.put_mine
    end

    context '+열려 있을 경우' do
    end

    context '+닫혀 있을 경우' do
      it '열면 게임 오버' do
        expect { @cell.open }.to raise_error("GameOver")
      end

      it '클리어 상태이다' do
        @cell.clear?.should be_true
      end
    end
  end

  context '지뢰가 없을 경우' do
    context '+열려 있을 경우' do
      before :each do
        @cell.open
      end

      it '클리어 상태이다' do
        @cell.clear?.should be_true
      end
    end

    context '+닫혀 있을 경우' do
      it '안전하게 열 수 있다' do
        expect { @cell.open }.to_not raise_error
      end

      it '클리어 상태가 아니다' do
        @cell.clear?.should be_false
      end
    end
  end
end