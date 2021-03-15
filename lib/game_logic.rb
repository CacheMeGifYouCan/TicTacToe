#!/usr/lib/env ruby

<<<<<<< Updated upstream
=======
# Class that initialises the game board
#
# It keeps stores the data pertaining the current state of
# the board in an array
#
# board = MainBoard.new
# board = board.main_board
# puts board    # -> # [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

>>>>>>> Stashed changes
class MainBoard
  attr_reader :game_board

  def main_board
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
end

<<<<<<< Updated upstream
=======
# The display_board method outputs the board to the console when called,
# this gives a visual output to the user, displaying the board status
#
# It is reliant on data from the main_board method
#
# puts display_board(board)
#
# X | O | X
# O | X | O
# X | O | X
#
>>>>>>> Stashed changes
def display_board(board)
  puts
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts
end

<<<<<<< Updated upstream
=======
# Class stores the player username, password and current win condition.
# The methods defined have been created to output various interactions,
# with the user.
#
# player1 = gets.chomp
# puts player1 = User1.new(player1, false)  # -> # 'Example', false
#
# puts player1.info  # -> 'Hello Example, you are X'
#
>>>>>>> Stashed changes
class User1
  attr_reader :username
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

# Class uses methods to check the current game progress
#
# When methods inside are called, they will output strings,
# dependant on the various conditions specified.
#
# E.g. # -> # board_results = BoardResults.new
#
# puts board_results.results_advanced1(board)
# -> 'Game won diagonally!'
#
class BoardResults
  def results_simple_x(board)
    x_check = %w[X X X]
    if board[0...3] == x_check
      'Game Won!'
    elsif board[3...6] == x_check
      'Game Won!'
    elsif board[6...9] == x_check
      'Game Won!'
    end
  end

  def results_simple_o(board)
    o_check = %w[O O O]
    if board[0...3] == o_check
      'Game Won!'
    elsif board[3...6] == o_check
      'Game Won!'
    elsif board[6...9] == o_check
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
    elsif board.values_at(1, 4, 7).all?('X')
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
    elsif board.values_at(1, 4, 7).all?('O')
      'Game Won Down The Left/Right Column!'
    end
  end
end

# Class uses two methods for both player1 and player2 moves
#
# It is constantly providing user interaction, utilising other class methods,
# and adding new player moves to the board array object
#
# E.g. # board1 = BoardMoves.new
# board1.player_moves1(board)
# ->
# 'X, it's your turn. Please enter a number from 1-9'
# (displays board with players new turn added)

class BoardMoves
  def player_moves1(board)
    board_results = BoardResults.new
    loop do
      break if board_results.results_advanced1(board) == 'Game Won Down The Left/Right Column!'
      break if board_results.results_advanced2(board) == 'Game Won Diagonally!'

      greeting = Greetings.new
      greeting.greeting_x
      number = greeting.fetch_number
      if board[number - 1] == 'O' || board[number - 1] == 'X'
        greeting.invalid_moves1
      elsif number.between?(1, 9) == false
        greeting.invalid_moves2
      else
        valid = Greetings.new
        valid.valid_moves
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
      break if board_results.results_advanced2(board) == 'Game Won Diagonally!'

      greeting = Greetings.new
      greeting.greeting_o
      number = greeting.fetch_number
      if board[number - 1] == 'O' || board[number - 1] == 'X'
        greeting.invalid_moves1
      elsif number.between?(1, 9) == false
        greeting.invalid_moves2
      else
        valid = Greetings.new
        valid.valid_moves
        board[number - 1] = 'O'
        display_board(board)
        break
      end
    end
  end
end

# This Class loops through both players turns until a win/draw condition has been met
#
class BoardLoop
  def board_loop(board)
    total_moves = 0
    board1 = BoardMoves.new
    board2 = BoardMoves.new
    board_results = BoardResults.new
    until total_moves > 9

      board1.player_moves1(board)
      break if board[0..9].any?(' ') == false
      break if board_results.results_simple_x(board) == 'Game Won!'

      board2.player_moves2(board)
      break if board_results.results_simple_o(board) == 'Game Won!'

      total_moves += 1
    end
  end
end
