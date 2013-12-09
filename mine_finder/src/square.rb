class Square

  def initialize
    @mined = false
    @opened = false
  end

  def mine!
    @mined = true
  end

  def mine?
    @mined
  end

  def open!
    @opened = true
  end

  def opened?
    @opened
  end

  def win?
    return true if ( @opened and not @mined ) else false
  end
end