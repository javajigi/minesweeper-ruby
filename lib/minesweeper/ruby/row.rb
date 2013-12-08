require 'cell'
require 'position'

class Row
  @cell_num = 3
  class << self
    attr_accessor :cell_num
  end

  attr_reader :cells

  def initialize
    @cells = Array.new(Row.cell_num) { Cell.new }
  end

  def open(pos)
    pos_to_cell(pos) { |cell| cell.open }
  end

  def open?(pos)
    pos_to_cell(pos) { |cell| cell.open? }
  end

  def mine!(pos)
    pos_to_cell(pos) { |cell| cell.mine! }
  end

  def mine?(pos)
    pos_to_cell(pos) { |cell| cell.mine? }
  end

  def win?
    @cells.inject(true) { |result, cell| result && cell.win? }
  end

  def open_near(pos)
    near_cells_each(pos) { |cell| cell.open }
  end

  def near_mine_num(pos)
    pos_to_cell(pos) { |cell| cell.near_mine_num }
  end

  def increment_near_mine_num(pos)
    near_cells_each(pos) { |cell| cell.increment_near_mine_num }
  end

  def to_s
    @cells.inject('') { |result, cell| result += cell.to_s }
  end

  private
  def pos_to_cell(pos)
    yield @cells[pos.cell] if pos.valid?
  end

  def near_cells_each(pos)
    pos.near_cells_pos.each do |pos|
      yield @cells[pos.cell] if pos.valid?
    end
  end
end