# frozen_string_literal: true

class DiagnosticReport
  class << self
    def calculate_gama_and_epsilon_rate(data)
      data = data.map(&:chars)
      gamma = calculate_gamma(data)
      epsilon = calculate_epsilon(gamma)
      [gamma.to_i(2), epsilon.to_i(2)]
    end

    def calculate_oxygen_generator_rating(data)
      data = data.map(&:chars)
      counter = data[1].count - 1

      (0..counter).each do |index|
        columns = data.map { |column| column[index] }
        count_bit = columns.tally
        max_value = count_bit['0'] == count_bit['1'] ? "1" : count_bit.max_by{|key,value| value}.first
        data = data.filter { |number| number[index].eql?(max_value) }

        break if data.size.eql?(1)
      end
      data.join.to_i(2)
    end

    def calculate_co2_scrubber_rating(data)
      data = data.map(&:chars)
      counter = data[1].count - 1

      (0..counter).each do |index|
        columns = data.map { |column| column[index] }
        count_bit = columns.tally
        min_value = count_bit['0'] == count_bit['1'] ? "0" : count_bit.min_by{|key,value| value}.first
        data = data.filter { |number| number[index].eql?(min_value) }

        break if data.size.eql?(1)
      end
      data.join.to_i(2)
    end

    private

    def calculate_gamma(data)
      data = data.transpose
      data.map { |column| column.max_by { |bit| column.count(bit) } }.join
    end

    def calculate_epsilon(gamma)
      gamma.chars.map { |bit| bit == "0" ? "1" : "0" }.join
    end
  end
end
