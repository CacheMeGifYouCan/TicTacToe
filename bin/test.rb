board = ['X', 'O', 'X', ' ', 'X', 'X', 'X', ' ', ' ']

x_check = %w[X X X]

puts board[0...3] == (x_check || o_check)
