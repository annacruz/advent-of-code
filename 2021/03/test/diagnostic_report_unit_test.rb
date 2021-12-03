# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

require_relative '../diagnostic_report'

class DiagnosticReportTest < Minitest::Test

  def setup
    @data = ['00100',
             '11110',
             '10110',
             '10111',
             '10101',
             '01111',
             '00111',
             '11100',
             '10000',
             '11001',
             '00010',
             '01010'
            ]
  end

  def test_calculate_gamma_rate
    gamma_rate, = DiagnosticReport.calculate_gama_and_epsilon_rate(@data)
    assert_equal 22, gamma_rate
  end

  def test_calculate_epsilon_rate
    _, epsilon_rate = DiagnosticReport.calculate_gama_and_epsilon_rate(@data)
    assert_equal 9, epsilon_rate
  end

  def test_multiplication
    gamma_rate, epsilon_rate = DiagnosticReport.calculate_gama_and_epsilon_rate(@data)
    result = gamma_rate * epsilon_rate
    assert_equal 198, result
  end

  def test_calculate_oxygen_generator_rating
    oxygen_rating = DiagnosticReport.calculate_oxygen_generator_rating(@data)
    assert_equal 23, oxygen_rating
  end

  def test_calculate_co2_scrubber_rating
    co2_rating = DiagnosticReport.calculate_co2_scrubber_rating(@data)
    assert_equal 10, co2_rating
  end

end
