class Cell
  attr_accessor :mark
  def initialize
    @mark = ' '
  end

  def empty?
    @mark == ' '
  end

  def mine!
    @mark = '*'
  end

  def mine?
    @mark == '*'
  end

  def open
    @mark = 0
  end

  def open?
    @mark.instance_of?(Fixnum)
  end

  def win?
    mine? || open?
  end
end