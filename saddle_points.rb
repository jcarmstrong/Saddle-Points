# Written by James Armstrong - March 20, 2012
# Sample program to check for saddle points in a given matrix of integers

require 'matrix'

# Record start time - used for benchmark value
start_time =  Time.new
             
def check_for_saddle_points(matrix)
  # Init local variables
  saddle_point = false
  row_index = row_max = nil
  
  matrix.each_with_index do |value, row, column|   
    # Find the row's max value when we switch to a new row. 
    # This way we only call Matrix.row.max once per row
    if (row_index != row)
      row_max = matrix.row(row).max
      row_index = row
    end
    
    # Check if value passes the two tests to be a valid saddle point
    # Is the value >= to all other values in the row?
    if (value == row_max)
      # Second test - is the value <= all other values in the column?
      if (value == matrix.column(column).min)
        puts "Saddle point found at (#{row}, #{column})"
        saddle_point = true
      end
    end
  end
  
  # No saddle points were found in the matrix - print appropriate message
  if (!saddle_point)
    puts "No saddle points found"
  end
end


# Setup sample matrices as specified in problem domain
arr1 = Matrix[
  [39, 43, 49, 29, 18],
  [30, 47, 24, 29, 15], 
  [49, 50, 39, 20, 33], 
  [18, 38, 35, 32, 35], 
  [29, 44, 18, 34, 44]]
              
arr2 = Matrix[
  [50, 27, 36, 43, 39], 
  [36, 14, 35, 40, 19], 
  [20, 33, 48, 32, 40], 
  [41, 40, 15, 22, 19], 
  [21, 24, 24, 31, 18]]
                           
arr3 = Matrix[
  [39, 43, 49, 29, 18], 
  [30, 47, 24, 29, 15], 
  [49, 50, 39, 20, 33], 
  [18, 38, 35, 32, 38], 
  [29, 44, 18, 34, 44]]

# Test the three matrices and print the results
puts "\n\nTESTING ARR1 FOR SADDLE POINTS\n"
check_for_saddle_points(arr1)
puts "\n\nTESTING ARR2 FOR SADDLE POINTS\n"
check_for_saddle_points(arr2)
puts "\n\nTESTING ARR3 FOR SADDLE POINTS\n"
check_for_saddle_points(arr3)
puts "\n\n"

# Print the benchmark            
puts "Benchmark: #{Time.new - start_time}"
