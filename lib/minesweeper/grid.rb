class Grid
  def win?
    rows.inject(true) {|result, row| result and row.win?}
  end
end