class Row
  def win?
    cells.inject(true) { |result, cell| result and cell.win? }
  end
end