require 'cell'

class Row
  @cell_num = 3
  class << self
    attr_accessor :cell_num
  end

  attr_accessor :cells
  def initialize
    @cells = Array.new(Row.cell_num) { Cell.new }
  end

  def open(i)
    @cells[i].open if valid?(i)
  end

  def open?(i)
    @cells[i].open? if valid?(i)
  end

  def mine!(i)
    @cells[i].mine! if valid?(i)
  end

  def increment_near_mine_num(i)
    @cells[i-1].increment_near_mine_num if valid?(i-1)
    @cells[i].increment_near_mine_num if valid?(i)
    @cells[i+1].increment_near_mine_num if valid?(i+1)
  end

  def mine?(i)
    @cells[i].mine? if valid?(i)
  end

  def win?
    @cells.inject(true) { |result, cell| result && cell.win? }
  end

  def near_mine_num(i)
    result = 0
    result += 1 if mine?(i-1)
    result += 1 if mine?(i)
    result += 1 if mine?(i+1)
    result
  end

  def open_near(i)
    open(i-1)
    open(i)
    open(i+1)
  end

  def set_mark(i, mark)
    @cells[i].mark = mark
  end

  def get_mark(i)
    @cells[i].mark
  end

  def to_s
    @cells.inject('') {|result, cell| result += cell.to_s}
  end

  private
  def valid?(i)
    (0 <= i) && (i < Row.cell_num)
  end
end