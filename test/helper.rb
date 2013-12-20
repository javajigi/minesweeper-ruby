require 'test/unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Position
  class << self
    def create(x, y)
      Position.new(x, y)
    end
  end
end

