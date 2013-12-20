class Square
  # To change this template use File | Settings | File Templates.
  attr_accessor :mined
  attr_accessor :opened
  attr_accessor :num_around_mine

  def initialize
    @num_around_mine = 0
  end

  def symbol
    return ' ' unless opened

    return '*' if mined?
    return @num_around_mine.to_s unless mined?
  end

  def mined?
    @mined
  end
end