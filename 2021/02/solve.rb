require_relative 'path_calculation'

filename = ARGV[0]
raw_data = File.read(filename).lines
depth, horizontal = PathCalculation.calculate_depth_horizontal(raw_data)
result = depth * horizontal
puts "Result 1: #{result}"

depth, horizontal = PathCalculation.calculate_with_aim_depth_horizontal(raw_data)
result = depth * horizontal
puts "Result 2: #{result}"
