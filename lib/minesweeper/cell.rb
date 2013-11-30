class Cell
  def initialize
    @opened = false
    @mark = ' '
  end

  def mine!
    @mark = '*'
  end

  def mine?
    @mark == '*'
  end

  def open
    @opened = true
  end

  def open?
    @opened
  end

  def to_s
    @mark
  end
end