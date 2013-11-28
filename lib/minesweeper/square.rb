class Square
  def initialize
    @mined = false
    @opened = false
  end

  def mine!
    @mined = true
  end

  def win?
    true
  end

  def open
    @opened = true
  end

  def symbol
    return ' ' unless @opened

    if @mined
      '*'
    else
      '0'
    end
  end
end