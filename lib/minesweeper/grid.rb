class Grid
  def win?
    self.rows.inject(true) {|result, row| result and row.win?}
  end

  def put_mine(position)
    self.rows[position.x].put_mine(position.y)
  end
end