class Grid
  def win?
    rows.inject(true) {|result, row| result && row.win?}
  end
end