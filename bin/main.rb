#!/usr/bin/env ruby

# WIN_COMBINATIONS =>
#   board[0, 1, 2], # Top
#   board[3, 4, 5], # Middle Row
#   board[6, 7, 8], # Bottom Row
#   board[0, 3, 6], # Left to Bottom Row
#   board[2, 5, 8], # Right to Bottom Row
#   board[0, 4, 8], # Diagonal from Left Row
#   board[2, 4, 6] # Diagonal from Right Row

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def results_simple1(board)
  case 4.even?
  when board[0...3].all?('X') then puts 'Winning Move! Game has been won by X at the top', @win_condition = ' '
  when board[3...6].all?('X') then puts 'Winning Move! Game has been won by X in the middle', @win_condition = ' '
  when board[6...9].all?('X') then puts 'Winning Move! Game has been won by X at the bottom', @win_condition = ' '
  end
end

def results_simple2(board)
  case 4.even?
  when board[0...3].all?('O') then puts 'Winning Move! Game has been won by O at the top', @win_condition = ' '
  when board[3...6].all?('O') then puts 'Winning Move! Game has been won by O in the middle', @win_condition = ' '
  when board[6...9].all?('O') then puts 'Winning Move! Game has been won by O at the bottom', @win_condition = ' '
  end
end

def results_x(board)
  case 4.even?
  # board Left to Bottom condition
  when board.values_at(0, 3, 6).all?('X')
    puts 'Winning Move! Game has been won by X from left to bottom', @win_condition = ' '
  when board.values_at(2, 5, 8).all?('X')
    puts 'Winning Move! Game has been won by X from right to bottom', @win_condition = ' '
  when board.values_at(0, 4, 8).all?('X')
    puts 'Winning Move! Game has been won by X diagonally from left row', @win_condition = ' '
  when board.values_at(2, 4, 6).all?('X')
    puts 'Winning Move! Game has been won by X diagonally from right row', @win_condition = ' '
  end
end

def results_o(board)
  case 4.even?
  # board Left to Bottom condition
  when board.values_at(0, 3, 6).all?('O')
    puts 'Winning Move! Game has been won by O from left to bottom', @win_condition = ' '
  when board.values_at(2, 5, 8).all?('O')
    puts 'Winning Move! Game has been won by O from right to bottom', @win_condition = ' '
  when board.values_at(0, 4, 8).all?('O')
    puts 'Winning Move! Game has been won by O diagonally from left row', @win_condition = ' '
  when board.values_at(2, 4, 6).all?('O')
    puts 'Winning Move! Game has been won by O diagonally from right row', @win_condition = ' '
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

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

puts 'Hello Player 1. Please enter your username here:'
player1 = gets.chomp
player1 = User1.new(player1, false)
# Store this username in a variable
puts player1.info
# Player 1 is now X

puts 'Hello Player 2. Please enter your username here:'
player2 = gets.chomp
player2 = User1.new(player2, false)
# Store this username in a variable
puts player2.info2
# Player 2 is now O

# Players score count is displayed.

puts 'Press enter to roll the dice to decide which Player starts first.'
gets.chomp
# Random number is rolled

puts "#{player1.username} you may go first."
# Random player is chosen to start the game.
total_moves = 0

until total_moves > 9
  # player_moves1
  number = false
  loop do
    puts 'Please enter a number from 1-9'
    number = gets.chomp.to_i
    if board[number - 1] == 'O' || board[number - 1] == 'X'
      puts 'Invalid move - position taken'
    elsif number.between?(1, 9) == false
      puts 'Invalid move'
    else
      board[number - 1] = 'X'
      display_board(board)
      puts results_simple1(board)
      puts results_x(board)
      number = true
      total_moves += 1
      break
    end
  end

  break puts 'The game is a draw!' if board[0..9].any?(' ') == false
  break if @win_condition == ' '

  # player_moves2
  number2 = false
  loop do
    player2.your_turn
    puts 'Please enter a number from 1-9'
    number2 = gets.chomp.to_i
    if board[number2 - 1] == 'O' || board[number2 - 1] == 'X'
      puts 'Invalid move - position taken'
    elsif number2.between?(1, 9) == false
      puts 'Invalid move'
    else
      board[number2 - 1] = 'O'
      display_board(board)
      puts results_simple2(board)
      puts results_o(board)
      player1.your_turn
      number2 = true
      total_moves += 1
      break
    end
  end
  break if @win_condition == ' '
end
