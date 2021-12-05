require 'byebug'
require_relative 'bingo'

filename = ARGV[0]
raw_data = File.read(filename).lines
result = Bingo.run(raw_data)
puts "Result 1: #{result}"