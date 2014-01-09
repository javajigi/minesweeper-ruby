require 'minesweeper/position_service/position'

module PositionService
  class Base
    attr_accessor :height, :width

    def initialize(height, width)
      raise "PositionServiceSizeError" if height < 1 or width < 1
      self.height = height
      self.width = width
    end

    def create_near_positions_of(position)
      raise "PositionBoundaryError" unless valid_position?(position)
      positions = []
      (position.x-1 .. position.x+1).each do |x|
        (position.y-1 .. position.y+1).each do |y|
          next if x == position.x and y == position.y
          begin
            positions << create_position(x, y)
          rescue

          end
        end
      end
      positions
    end

    def create_position(x, y)
      raise "PositionBoundaryError" unless x < self.height and y < self.width
      Position.new(x, y)
    end

    private
    def valid_position?(position)
      position.x < self.height and position.y < self.width
    end
  end
end