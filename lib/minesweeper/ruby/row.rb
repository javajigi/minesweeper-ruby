require 'cell'
require 'position'

class Row
  @cell_num = 3
  class << self
    attr_accessor :cell_num
  end

  attr_accessor :cells
  def initialize
    @cells = Array.new(Row.cell_num) { Cell.new }
  end

  def open(pos)
    pos.cell && @cells[pos.cell].open
  end

  def open?(pos)
    @cells[pos.cell].open?
  end

  def mine!(pos)
    @cells[pos.cell].mine!
  end

  def increment_near_mine_num(pos)
    near_cells(pos).each do |cell|
      cell.increment_near_mine_num
    end
  end

  def mine?(pos)
    @cells[pos.cell].mine?
  end

  def win?
    @cells.inject(true) { |result, cell| result && cell.win? }
  end

  def open_near(pos)
    pos.near_cells_pos.each do |cell_pos|
      open(cell_pos)
    end
  end

  def get_mark(pos)
    @cells[pos.cell].mark
  end

  def to_s
    @cells.inject('') {|result, cell| result += cell.to_s}
  end

  def near_mine_num(pos)
    @cells[pos.cell].near_mine_num if pos.cell
  end
  private
  def near_cells(pos)
    cells = []
    pos.near_cells_pos.each do |pos|
      cells << @cells[pos.cell] if pos.cell
    end
    cells
  end
end