require 'test/unit'

require 'grid'

class GridTest < Test::Unit::TestCase
  def setup
    @grid = Grid.new(2, 2)
  end

  def test_initialize
    assert_equal(2, @grid.row)
    assert_equal(2, @grid.column)

    assert_equal(Square.new, @grid.get_square(0, 0))
  end

  def test_win_all_open
    @grid.open_square(0, 0)
    assert(@grid.win)
  end
end