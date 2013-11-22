class Cell
  def initialize
    @opened = false
    rand_init
  end

  def fake_init(m)
    @mark = m
  end

  def mine?
    @mark == '*'
  end

  def open?
    @opened
  end

  def open
    @opened = true
    @mark
  end

  def to_s
    @mark
  end

  private
  def rand_init
    if rand(2)==0
      @mark = '*'
    else
      @mark = ' '
    end
  end
end