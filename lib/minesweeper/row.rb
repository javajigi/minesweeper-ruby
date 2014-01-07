class Row
  def win?
    self.cells.inject(true) { |result, cell| result and cell.win? }
  end

  def put_mine(i)
    self.cells[i].put_mine
  end

  def open_cell(i)
    self.cells[i].open
  end
end