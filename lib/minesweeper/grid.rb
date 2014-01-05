class Grid
  def win?
    cells.inject(true) { |result, cell| result && cell.mine? }
  end

  def open
    cells.each { |cell| cell.open }
  end
end