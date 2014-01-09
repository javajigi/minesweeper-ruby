class Row
  def clear?
    self.cells.inject(true) { |result, cell| result and cell.clear? }
  end

  def put_mine(i)
    self.cells[i].put_mine
  end

  def open_cell(i)
    self.cells[i].open
  end
end