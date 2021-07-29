require_relative "../lib/sudoku_check_service"

describe SudokuCheckService do
  it 'returns valid and complete when no zeros and duplicated columns or rows' do
    sudoku_array = [
      [8,5,9,6,1,2,4,3,7],
      [7,2,3,8,5,4,1,6,9],
      [1,6,4,3,7,9,5,2,8],
      [9,8,6,1,4,7,3,5,2],
      [3,7,5,2,6,8,9,1,4],
      [2,4,1,5,9,3,7,8,6],
      [4,3,2,9,8,1,6,7,5],
      [6,1,7,4,2,5,8,9,3],
      [5,9,8,7,3,6,2,4,1]
    ]
    checker = SudokuCheckService.new(sudoku_array)
    expect(checker.sudoku?).to eq(true)
    expect(checker.complete?).to eq(true)
  end

  it 'returns as valid and incomplete with zero and no duplicates' do
    sudoku_array = [
      [8,5,0,0,0,2,4,0,0],
      [7,2,0,0,0,0,0,0,9],
      [0,0,4,0,0,0,0,0,0],
      [0,0,0,1,0,7,0,0,2],
      [3,0,5,0,0,0,9,0,0],
      [0,4,0,0,0,0,0,0,0],
      [0,0,0,0,8,0,0,7,0],
      [0,1,7,0,0,0,0,0,0],
      [0,0,0,0,3,6,0,4,0]
    ]
    checker = SudokuCheckService.new(sudoku_array)
    expect(checker.sudoku?).to eq(true)
    expect(checker.complete?).to eq(false)
  end

  it 'returns invalid when duplicate column' do
    sudoku_array = [
      [8,5,9,6,1,2,4,3,7],
      [7,2,3,8,5,4,1,6,9],
      [1,6,4,3,7,9,5,2,8],
      [9,8,6,1,4,7,3,5,2],
      [3,7,5,8,6,2,9,1,4],
      [2,4,1,5,9,3,7,8,6],
      [4,3,2,9,8,1,6,7,5],
      [6,1,7,4,2,5,8,9,3],
      [5,9,8,7,3,6,2,4,1]
    ]
    checker = SudokuCheckService.new(sudoku_array)
    expect(checker.sudoku?).to eq(false)
  end

  it 'returns invalid when duplicate row' do
    sudoku_array = [
      [8,8,0,0,0,2,4,0,0],
      [7,2,0,0,0,0,0,0,9],
      [0,0,4,0,0,0,0,0,0],
      [0,0,0,1,0,7,0,0,2],
      [3,0,5,0,0,0,9,0,0],
      [0,4,0,0,0,0,0,0,0],
      [0,0,0,0,8,0,0,7,0],
      [0,1,7,0,0,0,0,0,0],
      [0,0,0,0,3,6,0,4,0]
    ]
    checker = SudokuCheckService.new(sudoku_array)
    expect(checker.sudoku?).to eq(false)
  end
end
