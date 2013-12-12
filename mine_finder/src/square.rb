class Square

  attr_accessor :near_mine_num

  def initialize
    @mined = false
    @opened = false
    @near_mine_num = 0
  end

  def mine!
    @mined = true
  end

  def mine?
    @mined
  end

  def open!
    raise GameOverError.new if @mined
    @opened = true
  end

  def opened?
    @opened
  end

  def symbol
    if not @opened
      return ' '
    else
      if @mined
        return '*'
      else
        return @near_mine_num.to_s
      end
    end
  end

  def increase_near_mine_num
    @near_mine_num +=1
  end

  def is_near_mine_num_zero?
    @near_mine_num == 0
  end
end