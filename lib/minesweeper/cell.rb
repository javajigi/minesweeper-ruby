class Cell
  def put_mine
    @mine = true
  end

  def open
    @open = true
  end

  def win?
    (mine_detected? and not open?) or (not mine_detected? and open?)
  end

  private
  def open?
    @open ||= false
  end

  def mine_detected?
    @mine ||= false
  end
end