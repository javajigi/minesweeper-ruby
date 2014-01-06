class Cell
  def put_mine
    @mine = true
  end

  def open
    @open = true
  end

  def win?
    (mine_detected? and not is_open?) or (not mine_detected? and is_open?)
  end

  private
  def is_open?
    @open ||= false
  end

  def mine_detected?
    @mine ||= false
  end
end