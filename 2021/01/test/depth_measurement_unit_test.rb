require 'minitest/autorun'
require 'minitest/pride'
require_relative '../depth_measurement'

class DepthMeasurementTest < Minitest::Test
  def setup
    @data = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
  end

  def test_count_increase
    result = DepthMeasurement.first(@data)
    assert_equal 7, result
  end

  def test_sliding_each_3
    result = DepthMeasurement.second(@data)
    assert_equal 5, result
  end
end

