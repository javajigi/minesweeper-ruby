require_relative 'row'
class Board
  attr_accessor :rows

  def self.row_num
    3
  end

  def initialize
    @rows = []
    Board.row_num.times { @rows << Row.new }
  end

  def clear?
    @rows.inject(true) { |result, row| result && row.clear? }
  end

  def open(row, col)
    if valid_coordinate?(row, col)
      unless visited?(row, col)
        if @rows[row].mine?(col)
          'lose'
        else
          num = get_num(row, col)
          open_neighbor(row, col) if num == 0
          num
        end
      end
    end
  end

  def to_s
    @rows.inject("") { |result, row| result += row.to_s+"\n" }
  end

  private

  def visited?(row, col)
    @rows[row].opened?(col)
  end

  def valid_coordinate?(row, col)
    row>=0 && row < Board.row_num && col>=0 && col < Row.col_num
  end

  def open_neighbor(row, col)
    [row-1, row, row+1].each do |row|
      [col-1, col, col+1].each do |col|
        open(row, col)
      end
    end
  end

  def get_num(row, col)
    result = 0
    result += rows[row-1].mine_num(col) if row > 0
    result +=rows[row].mine_num(col)
    result += rows[row+1].mine_num(col) if row < Board.row_num-1
    result
  end
end