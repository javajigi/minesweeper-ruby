require'row'
class Board
  @row_num = 3
  class << self
    attr_accessor :row_num
  end

  attr_accessor :rows

  def initialize
    @rows = Array.new(Board.row_num) { Row.new }
  end

  def open(x, y)
    rows[x].open(y) if valid?(x)
  end

  def open?(x, y)
    rows[x].open?(y) if valid?(x)
  end

  def mine!(x, y)
    rows[x].mine!(y) if valid?(x)

    near_rows(x).each do |row|
      row.increment_near_mine_num(y)
    end
  end

  def mine?(x, y)
    rows[x].mine?(y) if valid?(x)
  end

  def win?
    @rows.inject(true) { |result, row| result && row.win? }
  end

  def open_near(x, y)
    @rows[x-1].open_near(y) if valid?(x-1)
    @rows[x].open_near(y) if valid?(x)
    @rows[x+1].open_near(y) if valid?(x+1)
  end

  def set_mark(x, y)
    mark = near_mine_num(x, y)
    rows[x].set_mark(y, mark)
  end

  def get_mark(x, y)
    rows[x].get_mark(y)
  end

  def to_s
    @rows.inject('') { |result, row| result += row.to_s + "\n" }
  end

  private
  def valid?(x)
    (0 <= x) && (x < Board.row_num)
  end

  def near_mine_num(x, y)
    result = 0
    result += @rows[x-1].near_mine_num(y) if valid?(x-1)
    result += @rows[x].near_mine_num(y) if valid?(x)
    result += @rows[x+1].near_mine_num(y) if valid?(x+1)
    result
  end

  def near_rows(x)
    [rows[x-1], rows[x], rows[x+1]]
  end
end
