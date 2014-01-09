module PositionService
  class Position
    attr_accessor :x, :y

    def initialize(x, y)
      raise "PositionIndexError" if x < 0 or y < 0
      self.x = x
      self.y = y
    end
  end
end