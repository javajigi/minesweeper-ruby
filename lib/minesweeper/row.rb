require_relative 'cell'

class Row
  @cell_num = 3
  class << self
    attr_reader :cell_num
  end

  attr_accessor :cells

  def initialize
    @cells = Array.new(Row.cell_num) { Cell.new }
  end

  def open(i)
    with_validation(i) { @cells[i].open }
  end

  def open?(i)
    with_validation(i) { @cells[i].open? }
  end

  def mine!(i)
    with_validation(i) { @cells[i].mine! }
  end

  def mine?(i)
    with_validation(i) { @cells[i].mine? }
  end

  def with_validation(i, &block)
    block.call if valid?(i)
  end

  def valid?(i)
    (0 <= i) && (i < Row.cell_num)
  end

  def win?
    @cells.inject(true) { |result, cell| result && (cell.mine? or cell.open?) }
  end

  def near_mine_num(i)
    result = 0
    result += 1 if mine?(i-1)
    result += 1 if mine?(i)
    result += 1 if mine?(i+1)
    result
  end

  def to_s
    @cells.inject('') { |result, cell| result += cell.to_s }
  end
end