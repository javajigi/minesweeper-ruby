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

end