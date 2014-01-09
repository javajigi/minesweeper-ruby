module MinesweeperService
  class Base
    def clear?
      self.rows.inject(true) { |result, row| result and row.clear? }
    end

    def put_mine(position)
      rows_at(position.x).put_mine(position.y)
    end

    def open_cell_at(position)
      rows_at(position.x).open_cell_at(position.y)
      open_near_cells_of(position) if near_mine_number_of(position) == 0
    end

    def near_mine_number_of(position)
      rows_at(position.x).near_mine_number_of(position.y)
    end

    def open_near_cells_of(position)

    end

    private
    def rows_at(i)
      self.rows[i]
    end
  end
end