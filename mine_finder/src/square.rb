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

  def symbol
    if not @opened
      return ' '
    else
      if @mined
        return '*'
      else
        return '0'
      end
    end
  end
end