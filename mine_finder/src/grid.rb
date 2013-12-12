require '../src/index_out_of_bound_error' #현재 경로가 mine_finder라서 그렇다.

class Grid

  #def initialize(row, column, rand_mine_num)
  #  initialize(row, column)
  #  srand(Time.now.usec)
  #
  #end
  attr_reader :mines

  def initialize(row, column, rand_mine_num)
    @rows = Array.new(row){Array.new(column) { |index| Square.new }}
    @mines = Array.new

    srand(Time.now.usec)
    set_random_mine(rand_mine_num)
  end

  def row
    return @rows.length
  end

  def column
    return @rows[0].length
  end

  def get_square(x, y)
    raise IndexOutOfBoundError.new if out_of_index?(x, y)
    return @rows[x][y]
  end

  def mine!(x, y)
    square = get_square(x, y)
    square.mine!

    near_square_each(x,y) do |square|
      square.increase_near_mine_num
    end
  end

  def open!(x, y)
    square = get_square(x, y)
    square.open!

    near_square_each(x,y) do |square|
      square.open! if square.is_near_mine_num_zero?
    end
  end

  def near_square_each(x, y)
    near_squares = Array.new
    near_squares = get_near_squares(x, y)

    near_squares.each do |square|
      yield square
    end
  end

  def out_of_index?(x, y)
    return (x < 0 or x >= row or y < 0 or y >= column)
  end

  def print
    grid_status = ""
    @rows.each do |row|
      row.each do |square|
        grid_status += square.symbol
      end
      grid_status +="\n"
    end
    puts grid_status
    return grid_status
  end

  def get_near_squares(x, y)
    arr = Array.new
    (x-1..x+1).each do |row|
      (y-1..y+1).each do |col|
        arr << get_square(row, col) unless out_of_index?(row, col)
      end
    end
    return arr
  end

  def win?
    @mines.each do |square|
      return false unless square.flag
    end
    return true
  end

  def set_random_mine(mine_num)
    return if mine_num == 0
    while ( mine_num != 0 )
      mine_num -= set_mine( rand(0..row-1), rand(0..column-1) )
    end
  end

  def set_mine( row, col )
    square = get_square(row, col)

    if ( square.mined )
      return 0
    else
      @mines << square
      square.mine!
      return 1
    end
  end

end