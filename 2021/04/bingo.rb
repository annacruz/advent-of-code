class Bingo
  class << self
    def run(raw_input, squid_win=false)
      draw_numbers = raw_input[0].split(',').map(&:to_i)
      boards = [[]]
      raw_input = raw_input[1..-1]
      input = raw_input.reject {|line| line == "\n"}
      input.each_cons(5) do |board|
        boards << board.map {|line| line.split(' ').map(&:to_i)}
      end
      boards = boards.reject {|board| board.empty?}
      winner_board, number_factor = get_winner_board(boards, draw_numbers, squid_win)
      calculate_points(winner_board, number_factor)
    end

    def get_winner_board(boards, draw_numbers, squid_win)
      number_factor = nil
      has_winner = false
      winner_board = nil
      draw_numbers.each_with_index do |draw_number, index_draw|
        boards.each do |board|
          mark_grid(board, draw_number)
          has_winner = check_winner(board) if index_draw >= 4
          if has_winner
            winner_board = board
            number_factor = draw_number
            break
          end
        end
        break if has_winner
      end
      [winner_board, number_factor]
    end

    def calculate_points(board, number_factor)
      sum = board.flatten.reject { |elem| elem == true }.inject(:+)
      sum * number_factor
    end

    private
    def check_winner(board)
      row_fininshed = board.any? { |row| row.all? { |cell| cell == true } }
      column_finished = board.transpose.any? { |column| column.all? { |cell| cell == true } }
      row_fininshed || column_finished
    end
    def mark_grid(board, draw_number)
      board.each do |row|
        row.each_with_index do |elem, index|
          if elem == draw_number
            row[index] = true
          end
        end
      end
    end
  end
end