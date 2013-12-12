class Square

  attr_reader :mined, :opened, :near_mine_num, :flag

  def initialize
    @mined = false
    @opened = false
    @near_mine_num = 0
    @flag = false
  end


  def flag!
    @flag = true
  end

  def mine!
    @mined = true
  end

  def open!
    raise GameOverError.new if @mined
    @opened = true
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