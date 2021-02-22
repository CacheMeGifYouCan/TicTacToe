board = ['X', 'O', 'X', ' ', 'X', 'X', 'X', ' ', ' ']

x_check = %w[X X X]
o_check = %w[O O O]

puts board[0...3] == (x_check || o_check)