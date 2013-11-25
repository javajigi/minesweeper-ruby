class Square
  attr_reader :opened, :mined

  def initialize
    @opened = false
    @mined = false
  end

  def opened?
    @opened
  end

  def open
    @opened = true
  end
end