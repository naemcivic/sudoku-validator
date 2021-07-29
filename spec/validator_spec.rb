require_relative "../lib/validator"

describe "#parse_puzzle_string" do
  it 'returns a sudoku board array' do
    sudoku_string = <<-SUDOKU_GRID
1 1 1 |1 1 1 |1 1 1
2 2 2 |2 2 2 |2 2 2
3 3 3 |3 3 3 |3 3 3
------+------+------
4 4 4 |4 4 4 |4 4 4
5 5 5 |5 5 5 |5 5 5
6 6 6 |6 6 6 |6 6 6
------+------+------
7 7 7 |7 7 7 |7 7 7
8 8 8 |8 8 8 |8 8 8
9 9 9 |9 9 9 |9 9 9
    SUDOKU_GRID

    result = Validator.new(sudoku_string).parse_puzzle_string
    sudoku_array = [
      [1,1,1,1,1,1,1,1,1],
      [2,2,2,2,2,2,2,2,2],
      [3,3,3,3,3,3,3,3,3],
      [4,4,4,4,4,4,4,4,4],
      [5,5,5,5,5,5,5,5,5],
      [6,6,6,6,6,6,6,6,6],
      [7,7,7,7,7,7,7,7,7],
      [8,8,8,8,8,8,8,8,8],
      [9,9,9,9,9,9,9,9,9]
    ]

    expect(result).to eq sudoku_array
  end
end
