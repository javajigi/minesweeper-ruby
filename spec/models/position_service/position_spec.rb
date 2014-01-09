#encoding: utf-8
require 'spec_helper'
require 'minesweeper/position_service/position'

describe 'PositionService::Position은' do
  context 'x값이 자연수인 경우' do
    context 'y값이 자연수인 경우' do
      it '에러가 발생하지 않는다' do
        expect { PositionService::Position.new(0, 0) }.to_not raise_error
      end
    end

    context 'y값이 음수인 경우' do
      it '에러가 발생한다' do
        expect { PositionService::Position.new(0, -1) }.to raise_error("PositionIndexError")
      end
    end
  end

  context 'x값이 음수인 경우' do
    it '에러가 발생한다' do
      expect { PositionService::Position.new(-1, 0) }.to raise_error("PositionIndexError")
    end
  end
end
