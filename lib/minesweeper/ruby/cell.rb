class Cell
  attr_reader :near_mine_num
  attr_accessor :mark

  def initialize
    @mark = '-'
    @near_mine_num = 0
  end

  def empty?
    @mark == '-'
  end

  def mine!
    @mark = '*'
  end

  def mine?
    @mark == '*'
  end

  def flag!
    @mark = '!'
  end

  def flag?
    @mark == '!'
  end

  def open
    @mark = @near_mine_num
  end

  def open?
    @mark.instance_of?(Fixnum)
  end

  def increment_near_mine_num
    @near_mine_num += 1
  end

  def win?
    mine? || open?
  end

  def safe?
    @near_mine_num == 0
  end

  def to_s
    @mark.to_s
  end
end