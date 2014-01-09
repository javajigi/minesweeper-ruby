#encoding: utf-8
require 'spec_helper'
require 'minesweeper/position_service/base'

describe 'PositionService::Base의 크기' do
  context 'height가 양수일 경우' do
    context 'width가 양수일 경우' do
      it '에러가 발생하지 않는다' do
        expect { PositionService::Base.new(1, 1) }.to_not raise_error
      end
    end

    context 'width가 0이거나 음수일 경우' do
      it '에러가 발생한다' do
        expect { PositionService::Base.new(1, 0) }.to raise_error("PositionServiceSizeError")
        expect { PositionService::Base.new(1, -1) }.to raise_error("PositionServiceSizeError")
      end
    end
  end

  context 'height가 0이거나 음수일 경우' do
    it '에러가 발생한다' do
      expect { PositionService::Base.new(0, 1) }.to raise_error("PositionServiceSizeError")
      expect { PositionService::Base.new(-1, 1) }.to raise_error("PositionServiceSizeError")
    end
  end
end

describe 'PositionService::Base의 경계' do
  context 'height가 Position의 x값보다 큰 경우' do
    before :each do
      @position_service = PositionService::Base.new(3, 3)
    end

    context 'width가 Position의 y값보다 큰 경우' do
      it '에러가 발생하지 않는다' do
        expect { @position_service.create_position(2, 2) }.to_not raise_error
      end

      it '포지션을 생성한다' do
        @position_service.create_position(2, 2).instance_of?(PositionService::Position).should be_true
      end

      it '주변 포지션을 생성한다' do
        position = double('PositionService::Base', x: 1, y: 1)
        @position_service.should_receive(:create_position).exactly(8)
        @position_service.create_near_positions_of(position).count.should == 8
      end
    end

    context 'width가 Position의 y값보다 작거나 같은 경우' do
      it '에러가 발생한다' do
        expect { @position_service.create_position(2, 3) }.to raise_error("PositionBoundaryError")
        expect { @position_service.create_position(2, 4) }.to raise_error("PositionBoundaryError")
      end
    end
  end

  context 'height가 Position의 x값보다 같거나 작은 경우' do
    before :each do
      @position_service = PositionService::Base.new(3, 3)
    end
    it '에러가 발생한다' do
      expect { @position_service.create_position(3, 2) }.to raise_error("PositionBoundaryError")
      expect { @position_service.create_position(4, 2) }.to raise_error("PositionBoundaryError")
    end
  end
end