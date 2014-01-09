class Cell
  def put_mine
    @mine = true
  end

  def open
    raise "GameOver" if mine_detected?
    @open = true
  end

  def clear?
    is_open? or mine_detected?
  end

  private
  def is_open?
    @open ||= false
  end

  def mine_detected?
    @mine ||= false
  end
end