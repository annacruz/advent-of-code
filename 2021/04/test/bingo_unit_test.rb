require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

require_relative '../bingo'

class BingoTest < Minitest::Test
  def setup
    @draw_numbers = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
    @boards =  [
      [[22, 13, 17, 11, 0],
       [8, 2, 23, 4, 24],
       [21, 9, 14, 16, 7],
       [6, 10, 3, 18, 5],
       [1 ,12 ,20 ,15 ,19]],
      [[3, 15, 0, 2, 22],
       [9, 18, 13, 17, 5],
       [19, 8, 7, 25, 23],
       [20, 11, 10, 24, 4],
       [14, 21, 16, 12, 6]],
      [[14, 21, 17, 24, 4],
       [10, 16, 15,  9, 19],
       [18, 8, 23, 26, 20],
       [22, 11, 13, 6, 5],
       [2, 0, 12, 3, 7]]
    ]
  end

  def test_get_winner_board
    winner_board, = Bingo.get_winner_board(@boards, @draw_numbers)
    board = [[true, true, true, true, true],
    [10, 16, 15,  true, 19],
    [18, 8, true, 26, 20],
    [22, true, 13, 6, true],
    [true, true, 12, 3, true]]
    assert_equal board, winner_board
  end

  def test_number_factor
    _, number = Bingo.get_winner_board(@boards, @draw_numbers)
    assert_equal 24, number
  end

  def test_calculate_points
    board = [[true, true, true, true, true],
    [10, 16, 15,  true, 19],
    [18, 8, true, 26, 20],
    [22, true, 13, 6, true],
    [true, true, 12, 3, true]]
    factor = 24
    points = Bingo.calculate_points(board, factor)
    assert_equal 4512, points
  end
end

