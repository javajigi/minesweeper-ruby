require 'test/unit'

require 'grid'

class GridTest < Test::Unit::TestCase
  def setup
    @grid = Grid.new(2, 2)
  end

  def test_initialize
    assert_equal(2, @grid.row)
    assert_equal(2, @grid.column)
  end
end