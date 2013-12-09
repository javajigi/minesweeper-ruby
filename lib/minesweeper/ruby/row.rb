require 'cell'
require 'position'

class Row
  @cell_num = 5
  class << self
    attr_accessor :cell_num
  end

  attr_reader :cells

  def initialize
    @cells = Array.new(Row.cell_num) { Cell.new }
  end

  # 열려 있으면 넘어간다
  def open(pos)
    pos_to_cell(pos) { |cell| cell.open unless cell.open? }
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

  def open_near(pos, board)
    pos.near_cells_pos.each do |pos|
      unless open?(pos)
        open(pos)
        board.open_near(pos) if safe?(pos)
      end
    end
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
  def safe?(pos)
    pos_to_cell(pos) { |cell| cell.safe? }
  end

  def pos_to_cell(pos)
    yield @cells[pos.cell] if pos.valid?
  end

  def near_cells_each(pos)
    pos.near_cells_pos.each do |pos|
      yield @cells[pos.cell]
    end
  end
end