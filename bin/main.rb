#!/usr/bin/env ruby

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def display_board(board)
  puts
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts
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
      'Game Won Diagonally!'
    elsif board.values_at(0, 3, 6).all?('O')
      'Game Won Diagonally!'
    elsif board.values_at(2, 5, 8).all?('X')
      'Game Won Diagonally!'
    elsif board.values_at(2, 5, 8).all?('O')
      'Game Won Diagonally!'
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
    loop do
      greeting = Greetings.new
      greeting.greeting_x
      number = gets.chomp.to_i
      if board[number - 1] == 'O' || board[number - 1] == 'X'
        invalid_moves1
      elsif number.between?(1, 9) == false
        invalid_moves2
      else
        board[number - 1] = 'X'
        display_board(board)
        break
      end
    end
  end

  def player_moves2(board)
    loop do
      greeting = Greetings.new
      greeting.greeting_o
      number = gets.chomp.to_i
      if board[number - 1] == 'O' || board[number - 1] == 'X'
        invalid_moves1
      elsif number.between?(1, 9) == false
        invalid_moves2
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
    board_results = BoardResults.new
    until total_moves > 9
      board1.player_moves1(board)

      break if board[0..9].any?(' ') == false

      break if board_results.results_simple_x(board) == 'Game Won!'
      break if board_results.results_simple_o(board) == 'Game Won!'
      break if board_results.results_advanced1(board) == 'Game Won Diagonally!'
      break if board_results.results_advanced2(board) == 'Game Won Diagonally!'

      board2.player_moves2(board)

      total_moves += 1
    end
  end
end

class Greetings
  def greeting_x
    puts "X, it's your turn. Please enter a number from 1-9"
    puts
  end

  def greeting_o
    puts "O, it's your turn. Please enter a number from 1-9"
    puts
  end

  def invalid_moves1
    puts 'Invalid move - position taken'
  end

  def invalid_moves2
    puts 'Invalid move'
  end
end

class User1
  attr_accessor :username
  attr_writer :password, :win_condition

  def initialize(username, win_condition)
    @username = username
    @win_condition = win_condition
  end

  #  String that is shown when variable is called
  def info
    puts "Hello #{@username}, you are X"
  end

  def info2
    puts "Hello #{@username}, you are O"
  end

  def your_turn
    puts "#{@username}, it is your turn"
  end
end

def win_check(board)
  board_results = BoardResults.new
  if board_results.results_simple_x(board) == 'Game Won!'
    puts 'Game won!'
  elsif board_results.results_simple_o(board) == 'Game Won!'
    puts 'Game won!'
  elsif board_results.results_advanced1(board) == 'Game Won Diagonally!'
    puts 'Wow! The game has been won diagonally!'
  elsif board_results.results_advanced2(board) == 'Game Won Diagonally!'
    puts 'Wow! The game has been won diagonally!'
  else
    puts 'The game was a draw! Better luck next time!'
  end
end

puts 'Hello Player 1. Please enter your username here:'
player1 = gets.chomp
player1 = User1.new(player1, false)

puts player1.info

puts 'Hello Player 2. Please enter your username here:'
player2 = gets.chomp
player2 = User1.new(player2, false)

puts player2.info2

puts 'Press enter to roll the dice to decide which Player starts first.'
gets.chomp

puts "#{player1.username} you may go first."

boardloop = BoardLoop.new
boardloop.board_loop(board)
win_check(board)
