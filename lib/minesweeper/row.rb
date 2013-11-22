require_relative 'cell'
class Row
  attr_accessor :cols

  def self.col_num
    3
  end

  def initialize
    @cols = []
    Row.col_num.times { @cols << Cell.new }
  end

  def mine_num(col)
    result = 0
    result += 1 if col>0 && @cols[col-1].mine?
    result += 1 if @cols[col].mine?
    result += 1 if col<Row.col_num-1 && @cols[col+1].mine?
    result
  end

  def clear?
    @cols.inject(true) { |result, col| result && (col.mine? or col.open?) }
  end

  def mine?(col)
    open(col) == '*'
  end

  def open?(col)
    @cols[col].open?
  end

  def to_s
    @cols.inject("") {|result, col| result += col.to_s}
  end


  def fake_init1
    @cols[0].fake_init '*'
    @cols[1].fake_init '*'
    @cols[2].fake_init '*'
  end

  def fake_init2
    @cols[0].fake_init ' '
    @cols[1].fake_init '*'
    @cols[2].fake_init '*'
  end

  def fake_init3
    @cols[0].fake_init '*'
    @cols[1].fake_init ' '
    @cols[2].fake_init '*'
  end

  def fake_init4
    @cols[0].fake_init '*'
    @cols[1].fake_init '*'
    @cols[2].fake_init ' '
  end

  def fake_init5
    @cols[0].fake_init '*'
    @cols[1].fake_init ' '
    @cols[2].fake_init ' '
  end

  def fake_init6
    @cols[0].fake_init ' '
    @cols[1].fake_init '*'
    @cols[2].fake_init ' '
  end

  def fake_init7
    @cols[0].fake_init ' '
    @cols[1].fake_init ' '
    @cols[2].fake_init '*'
  end

  def fake_init8
    @cols[0].fake_init ' '
    @cols[1].fake_init ' '
    @cols[2].fake_init ' '
  end

  private
  def open(col)
    @cols[col].open
  end
end