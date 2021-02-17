def results_o(board)
  # WIN_COMBINATIONS =>
  #   board[0, 1, 2], # Top
  #   board[3, 4, 5], # Middle Row
  #   board[6, 7, 8], # Bottom Row
  #   board[0, 3, 6], # Left to Bottom Row
  #   board[2, 5, 8], # Right to Bottom Row
  #   board[0, 4, 8], # Diagonal from Left Row
  #   board[2, 4, 6] # Diagonal from Right Row

  # board top condition
  board_top = board[0...3].all?('O')

  # board Middle condition
  board_middle = board[3...5].all?('O')

  # board Bottom condition
  board_bottom = board[6...8].all?('O')

  # board Left to Bottom condition
  board_left_to_bottom = if board[0].include?('O') && board[3].include?('O') && board[6].include?('O')
                         then board_left_to_bottom = true
                         end

  # board Right to Bottom condition
  board_right_to_bottom = if board[2].include?('O') && board[5].include?('O') && board[8].include?('O')
                          then board_right_to_bottom = true
                          end

  # board Diagonal from left row condition
  board_diagonal_left = if board[0].include?('O') && board[4].include?('O') && board[8].include?('O')
                        then board_diagonal_left = true
                        end

  # board Diagonal from right row condition
  board_diagonal_right = if board[2].include?('O') && board[4].include?('O') && board[6].include?('O')
                         then board_diagonal_right = true
                         end

  case true
  when board_top then 'O has won at the top'
  when board_middle then puts 'O has won in the middle'
  when board_bottom then puts 'O has won at the bottom'
  when board_left_to_bottom then puts 'O has won from left to bottom'
  when board_right_to_bottom then puts 'O has won from left to bottom'
  when board_diagonal_left then puts 'O has won diagonally left'
  when board_diagonal_right then puts 'O has won diagonally right'
  else 'No wins'
  end
end
