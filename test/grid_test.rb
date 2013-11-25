require 'test/unit'

require 'grid'

class GridTest < Test::Unit::TestCase
  def setup
    @grid = Grid.new(2, 2)
  end

  def test_initialize
    assert_equal(2, @grid.size_of_row)
    assert_equal(2, @grid.size_of_column)

    assert_equal(Square.new, @grid.get_square(0, 0))
  end

  def test_win_all_open
    @grid.open_square(0, 0)
    assert(@grid.win)
  end

  def test_put_mine
    @grid.put_mine(0, 0)

    square = Square.new
    square.put_mine
    assert_equal(square, @grid.get_square(0, 0))
  end
end