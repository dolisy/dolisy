require_relative 'methods'
require_relative 'app_methods'


def generate_sudoku_structure(grid_lines, grid_columns)
  sudoku = []
  grid_size = grid_lines * grid_columns

  (0..grid_size - 1).to_a.each do
    sudoku << []
  end
  sudoku.each do |line|
    (0..grid_size - 1).to_a.each do
      line << []
    end
  end

  return sudoku.to_a
end

def generate_sudoku_n(n, sudoku_structure, grid_lines, grid_columns)
  grid_size = grid_lines * grid_columns

  authorized_lines = (0..grid_size - 1).to_a.sample(grid_size - grid_columns - 1)

  sudoku_structure.each_with_index do |line, line_index|
    if authorized_lines.include? line_index
      free_indexes = []
      line.each_with_index { |cell, cell_index| free_indexes << cell_index if cell.flatten.length == 0 }

      i = 1
      until i == grid_size
        rand_column = free_indexes.sample.to_i
        # rand_n = rand(grid_size) + 1
        # if rand_n == n
          sudoku_structure[line_index][rand_column] = [n]
        # else
        #   sudoku_structure[line_index][rand_column] = [n, rand_n]
        # end
        if get_sudoku_check?(sudoku_structure, grid_lines, grid_columns) == false
          sudoku_structure[line_index][rand_column] = []
        else
          i += 1
        end
      end
    end
  end
end

def get_generate_sudoku_n(n, sudoku_structure, grid_lines, grid_columns)
  for k in 1..n
    generate_sudoku_n(k, sudoku_structure, grid_lines, grid_columns)
  end
  return sudoku_structure
end

def get_sudoku_remove_error(sudoku, grid_lines, grid_columns)
  get_sudoku_check = get_sudoku_check(sudoku, grid_lines, grid_columns)
  get_sudoku_check_bin = get_sudoku_check?(sudoku, grid_lines, grid_columns)

  types = ["line", "column", "grid"]
  results = []
  if get_sudoku_check_bin == true
    results << "No error"
  else
    get_sudoku_check.each_with_index do |sudoku_check, sudoku_check_index|
      sudoku_check.each_with_index do |line, line_index|
        line.each do |key, value|
          if value > 1
            # results << "There are #{value} times the value #{key} in #{types[sudoku_check_index]} #{line_index + 1}"
            results << [value, key, types[sudoku_check_index], line_index]
          end
        end
      end
    end
  end
  sudoku.each do |error|
    case error[2]
    when "line"
      sudoku[error[3]].map! do |cell|
        if cell[0] == error[1]
          []
        else
          cell
        end
      end
    when "column"
      sudoku[error[3]].map! do |cell|
        if cell[0] == error[1]
          []
        else
          cell
        end
      end
    when "grid"
      sudoku[error[3]].map! do |cell|
        if cell[0] == error[1]
          []
        else
          cell
        end
      end
    end
  end
  return sudoku
end



######################################################################

grid_lines = grid_lines_method
grid_columns = grid_columns_method
grid_size = grid_lines * grid_columns

p sudoku_structure = generate_sudoku_structure(grid_lines, grid_columns)


puts "

INITIALIZE

"
p sudoku = get_generate_sudoku_n(grid_size, sudoku_structure, grid_lines, grid_columns)
p sudoku.flatten.length
p get_sudoku_check?(sudoku, grid_lines, grid_columns)

solution = solution(grid_lines, grid_columns, sudoku)
solution.each { |line| p line }


puts "

ROUMD 1

"

p solution.flatten.length
p get_sudoku_check?(solution, grid_lines, grid_columns)
p get_sudoku_check_error(solution, grid_lines, grid_columns)

puts "

remove errors 1:

"
p solution_one = get_sudoku_remove_error(solution, grid_lines, grid_columns)

p solution_one.flatten.length
p get_sudoku_check?(solution_one, grid_lines, grid_columns)
p get_sudoku_check_error(solution_one, grid_lines, grid_columns)

solution = solution_one

puts "

remove errors 2:

"
p solution_two = get_sudoku_remove_error(solution_one, grid_lines, grid_columns)

p solution_two.flatten.length
p get_sudoku_check?(solution_two, grid_lines, grid_columns)
p get_sudoku_check_error(solution_two, grid_lines, grid_columns)

solution = solution_two


###########################################

solution.each { |line| p line }

















