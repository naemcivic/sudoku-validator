class SudokuCheckService
  def initialize(sudoku_array)
    @sudoku_array = sudoku_array
  end

  def sudoku?
    valid_rows? && valid_columns? && valid_sub_grids?
  end

  def complete?
    rows.flatten.none?(&:zero?)
  end

  private

  def rows
    @sudoku_array
  end

  def columns
    rows.transpose
  end

  def squares
    rows.
      map { |row| row.each_slice(3).to_a }.
      transpose.
      flatten.
      each_slice(9).
      to_a
  end

  def valid_rows?
    valid_sudoku_numbers?(rows)
  end

  def valid_sub_grids?
    valid_sudoku_numbers?(squares)
  end

  def valid_columns?
    valid_sudoku_numbers?(columns)
  end

  def valid_sudoku_numbers?(dimension)
    dimension.all? do |array|
      array = array.reject(&:zero?)
      array.uniq.length == array.length
    end
  end
end
