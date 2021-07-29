require 'sudoku_check_service.rb'

class Validator
  NON_DIGIT_PATTERN = /\D/
  SUDOKU_STATUS = {
       invalid: 'This sudoku is invalid.',
    incomplete: 'This sudoku is valid, but incomplete.',
         valid: 'This sudoku is valid.'
  }.freeze

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    @result = SudokuCheckService.new(parse_puzzle_string)
    output_result
  end


  def parse_puzzle_string
    parsed_string = @puzzle_string.gsub(NON_DIGIT_PATTERN, "")
    parsed_string.chars.map(&:to_i).each_slice(9).to_a
  end

  private

  def output_result
    return SUDOKU_STATUS[:invalid] unless @result.sudoku?
    return SUDOKU_STATUS[:incomplete] unless @result.complete?
    SUDOKU_STATUS[:valid]
  end
end
