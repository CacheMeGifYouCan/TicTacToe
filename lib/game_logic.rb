class User1
  attr_accessor :username
  attr_writer :password, :win_condition

  def initialize(username, win_condition)
    @username = username
    @win_condition = win_condition
  end

  #  String that is shown when variable is called
  def info
    "
Hello #{@username}, you are X
    "
  end

  def info2
    "
Hello #{@username}, you are O
    "
  end

  def your_turn
    "
#{@username}, it is your turn
    "
  end
end

class BoardResults
  def results_simple_x(board)
    if board[0...3].all?('X')
      'Game Won!'
    elsif board[3...6].all?('X')
      'Game Won!'
    elsif board[6...9].all?('X')
      'Game Won!'
    end
  end

  def results_simple_o(board)
    if board[0...3].all?('O')
      'Game Won!'
    elsif board[3...6].all?('O')
      'Game Won!'
    elsif board[6...9].all?('O')
      'Game Won!'
    end
  end

  def results_advanced1(board)
    if board.values_at(0, 3, 6).all?('X')
      'Game Won Down The Left/Right Column!'
    elsif board.values_at(0, 3, 6).all?('O')
      'Game Won Down The Left/Right Column!'
    elsif board.values_at(2, 5, 8).all?('X')
      'Game Won Down The Left/Right Column!'
    elsif board.values_at(2, 5, 8).all?('O')
      'Game Won Down The Left/Right Column!'
    end
  end

  def results_advanced2(board)
    if board.values_at(0, 4, 8).all?('X')
      'Game Won Diagonally!'
    elsif board.values_at(0, 4, 8).all?('O')
      'Game Won Diagonally!'
    elsif board.values_at(2, 4, 6).all?('X')
      'Game Won Diagonally!'
    elsif board.values_at(2, 4, 6).all?('O')
      'Game Won Diagonally!'
    end
  end
end

class BoardMoves
  def player_moves1(board)
    board_results = BoardResults.new
    loop do
      break if board[0..9].any?(' ') == false
      break if board_results.results_simple_o(board) == 'Game Won!'

      greeting = Greetings.new
      greeting.greeting_x
      number = gets.chomp.to_i
      if board[number - 1] == 'O' || board[number - 1] == 'X'
        greeting.invalid_moves1
      elsif number.between?(1, 9) == false
        greeting.invalid_moves2
      else
        board[number - 1] = 'X'
        display_board(board)
        break
      end
    end
  end

  def player_moves2(board)
    board_results = BoardResults.new
    loop do
      break if board_results.results_advanced1(board) == 'Game Won Down The Left/Right Column!'
      break if board_results.results_simple_x(board) == 'Game Won!'

      greeting = Greetings.new
      greeting.greeting_o
      number = gets.chomp.to_i
      if board[number - 1] == 'O' || board[number - 1] == 'X'
        greeting.invalid_moves1
      elsif number.between?(1, 9) == false
        greeting.invalid_moves2
      else
        board[number - 1] = 'O'
        display_board(board)
        break
      end
    end
  end
end

class BoardLoop
  def board_loop(board)
    total_moves = 0
    board1 = BoardMoves.new
    board2 = BoardMoves.new
    until total_moves > 9
      board1.player_moves1(board)

      board2.player_moves2(board)

      total_moves += 1
    end
  end
end
