require 'test/unit'
require_relative '../lib/minesweeper/board'

class BoardTest < Test::Unit::TestCase
  board = nil

  setup do
    board = Board.new
  end

  test '주변의 지뢰수가 0이면 주변을 전부 오픈한다' do
    board.rows[0].fake_init1
    board.rows[1].fake_init8
    board.rows[2].fake_init8
    board.open(2, 0)
    assert_equal(true, board.rows[1].cols[0].open?)
    assert_equal(true, board.rows[2].cols[1].open?)

    board = Board.new
    board.rows[0].fake_init8
    board.rows[1].fake_init8
    board.rows[2].fake_init8
    board.open(1, 1)
    assert_equal(true, board.clear?)
  end

  test '지뢰가 아닐경우 주변 지뢰의 수를 보여준다' do
    board.rows[0].fake_init1
    board.rows[1].fake_init3
    board.rows[2].fake_init1
    assert_equal(8, board.open(1, 1))
  end

  test '전부 지뢰일 경우 이긴다' do
    board.rows.map(&:fake_init1)
    assert_equal(true, board.clear?)
  end

  test '나머지가 전부 지뢰일 경우 이긴다' do
    board.rows[0].fake_init1
    board.rows[1].fake_init1
    board.rows[2].fake_init3
    board.open(2, 1)
    assert_equal(true, board.clear?)
  end

  test '땅을 보여준다' do
    board.rows.map(&:fake_init2)
    assert_equal(" **\n **\n **\n", board.to_s)
  end

  test '지뢰를 오픈하면 진다' do
    board.rows[0].fake_init1
    assert_equal('lose', board.open(0, 0))
  end
end