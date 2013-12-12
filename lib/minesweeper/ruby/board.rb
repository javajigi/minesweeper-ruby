require 'row'
require 'position'

class Board
  @row_num = 5
  class << self
    attr_accessor :row_num
  end

  attr_accessor :rows

  def initialize
    @rows = Array.new(Board.row_num) { Row.new }
    rand_mines
  end

  def rand_mines
    5.times.each do
      position = Position.rand_position
      mine!(position)
    end
  end

  def open(pos)
    pos_to_row(pos) { |row| row.open(pos) }
  end

  def open?(pos)
    pos_to_row(pos) { |row| row.open?(pos) }
  end

  def mine!(pos)
    pos_to_row(pos) { |row| row.mine!(pos) }
    increment_near_mine_num(pos)
  end

  def mine?(pos)
    pos_to_row(pos) { |row| row.mine?(pos) }
  end

  def win?
    @rows.inject(true) { |result, row| result && row.win? }
  end

  def safe?(pos)
    pos_to_row(pos) { |row| row.safe?(pos) }
  end

  def open_near(pos)
    near_rows_each(pos) { |row, pos| row.open_near(pos, self) }
  end

  def near_mine_num(pos)
    @rows[pos.row].near_mine_num(pos)
  end

  def to_s
    @rows.inject('') { |result, row| result += row.to_s + "\n" }
  end

  private
  def pos_to_row(pos)
    yield @rows[pos.row] if pos.valid?
  end

  def increment_near_mine_num(pos)
    near_rows_each(pos) { |row| row.increment_near_mine_num(pos) }
  end

  def near_rows_each(pos)
    pos.near_rows_pos.each do |pos|
      yield @rows[pos.row], pos if pos.valid?
    end
  end
end
