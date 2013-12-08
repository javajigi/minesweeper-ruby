require 'row'
require 'position'


class Board
  @row_num = 3
  class << self
    attr_accessor :row_num
  end

  attr_accessor :rows

  def initialize
    @rows = Array.new(Board.row_num) { Row.new }
  end

  def open(pos)
    rows[pos.row].open(pos)
  end

  def open?(pos)
    rows[pos.row].open?(pos)
  end

  def mine!(pos)
    rows[pos.row].mine!(pos)

    near_rows_each(pos) do |row|
      row.increment_near_mine_num(pos)
    end
  end

  def mine?(pos)
    rows[pos.row].mine?(pos)
  end

  def win?
    @rows.inject(true) { |result, row| result && row.win? }
  end

  def open_near(pos)
    near_rows_each(pos) do |row|
      row.open_near(pos)
    end
  end

  def get_mark(pos)
    rows[pos.row].get_mark(pos)
  end

  def to_s
    @rows.inject('') { |result, row| result += row.to_s + "\n" }
  end

  def near_mine_num(pos)
    @rows[pos.row].near_mine_num(pos)
  end

  private
  def near_rows_each(pos)
    pos.near_rows_pos.each do |pos|
      yield @rows[pos.row] if pos.valid?
    end
  end
end
