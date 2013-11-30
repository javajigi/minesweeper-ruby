class Cell
  def initialize
    @open = false
    @mine = false
  end

  def mine!
    @mine = true
  end

  def mine?
    @mine
  end

  def empty?
    not @mine
  end

  def open
    @open = true
  end

  def open?
    @open
  end

  def win?
    @open || @mine
  end
end