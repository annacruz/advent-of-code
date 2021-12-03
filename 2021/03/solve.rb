require_relative 'diagnostic_report'

filename = ARGV[0]
raw_data = File.read(filename).lines
gamma, epsilon = DiagnosticReport.calculate_gama_and_epsilon_rate(raw_data)
result = gamma * epsilon
puts "Result 1: #{result}"

oxygen = DiagnosticReport.calculate_oxygen_generator_rating(raw_data)
co2 = DiagnosticReport.calculate_co2_scrubber_rating(raw_data)
result = oxygen * co2
puts "Result 2: #{result}"
