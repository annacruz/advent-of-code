# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require_relative '../path_calculation'

class PathCalculationTest < Minitest::Test
  def setup
    @data = ['forward 5', 'down 5', 'forward 8', 'up 3', 'down 8', 'forward 2']
  end

  def test_calculate_depth
    depth, = PathCalculation.calculate_depth_horizontal(@data)
    assert_equal 10, depth
  end

  def test_calculate_horizontal
    _, horizontal = PathCalculation.calculate_depth_horizontal(@data)
    assert_equal 15, horizontal
  end

  def test_calculate_with_aim_depth
    depth, = PathCalculation.calculate_with_aim_depth_horizontal(@data)
    assert_equal 60, depth
  end

  def test_calculate_with_aim_horizontal
    _, horizontal = PathCalculation.calculate_with_aim_depth_horizontal(@data)
    assert_equal 15, horizontal
  end
end

