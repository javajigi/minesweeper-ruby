require 'game_over_error'

class Square
  attr_reader :opened, :mined

  def initialize(opened, mined)
    @opened = opened
    @mined = mined
  end

  def self.closed_mine
    Square.new(false, true)
  end

  def self.closed_not_mine
    Square.new(false, false)
  end

  def opened?
    @opened
  end

  def closed?
    !@opened
  end

  def open
    if mine?
      raise GameOverError.new
    end
    @opened = true
  end

  def mine?
    @mined
  end

  def change_to_mine
    @mined = true
  end

  def win?
    if opened_and_not_mine?()
      return true
    end

    if closed_square_all_mine?()
      return true
    end

    return false
  end

  def get_mark
    if closed?
      return ' '
    end

    if @mined
      return '*'
    end

    return '0'
  end

  def opened_and_not_mine?
    @opened && !@mined
  end

  def closed_square_all_mine?
    !@opend && @mined
  end

  def == (another_square)
    self.opened == another_square.opened && self.mined == another_square.mined
  end
end