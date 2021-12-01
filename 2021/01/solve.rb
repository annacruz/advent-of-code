require_relative 'depth_measurement'

filename = ARGV[0]
raw_data = File.read(filename).lines.map(&:to_i)
result_1 = DepthMeasurement.first(raw_data)
puts "First result: #{result_1}"
result_2 = DepthMeasurement.second(raw_data)
puts "Second result: #{result_2}"

