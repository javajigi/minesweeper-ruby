require 'test/unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))


class Position
  class << self #클래스에 덮어쓰기?!
    def create(x, y)
      Position.new(x, y);
    end
  end
end

class Grid
  class << self
    def create(size)
      create_with_rand_mine(size, 0)
    end

    def create_with_rand_mine(size, rand_mine_num)
      Grid.new(size, rand_mine_num);
    end
  end
end