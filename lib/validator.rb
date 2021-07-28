class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    parsed_sudoku_string = parse_puzzle_string
  end


  def parse_puzzle_string
    parsed_string = @puzzle_string.gsub(/\D/, "")
    parsed_string.chars.map(&:to_i).each_slice(9).to_a
  end
end
