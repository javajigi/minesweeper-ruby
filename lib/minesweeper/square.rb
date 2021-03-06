class Square
  attr_reader :mined, :opened, :near_mine_num

  def initialize
    @mined = false
    @opened = false
    @near_mine_num = 0
  end

  def mine!
    @mined = true
  end

  def open
    @opened = true
  end

  def symbol
    return ' ' unless @opened

    if @mined
      '*'
    else
      near_mine_num.to_s
    end
  end

  def increase_near_mine_num
    @near_mine_num += 1
  end

  def zero_near_mine_num
    @near_mine_num == 0
  end

end