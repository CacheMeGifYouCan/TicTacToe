#!/usr/bin/env ruby

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def results_x(board)
  # WIN_COMBINATIONS =>
  #   board[0, 1, 2], # Top
  #   board[3, 4, 5], # Middle Row
  #   board[6, 7, 8], # Bottom Row
  #   board[0, 3, 6], # Left to Bottom Row
  #   board[2, 5, 8], # Right to Bottom Row
  #   board[0, 4, 8], # Diagonal from Left Row
  #   board[2, 4, 6] # Diagonal from Right Row

  case 4.even?
  when board[0...3].all?('X') then puts 'X has won at the top'
  when board[3...6].all?('X') then puts 'X has won in the middle'
  when board[6...9].all?('X') then puts 'X has won at the bottom'
  # board Left to Bottom condition
  when board[0].include?('X') && board[3].include?('X') && board[6].include?('X')
    puts 'X has won from left to bottom'
  # board Right to Bottom condition
  when board[2].include?('X') && board[5].include?('X') && board[8].include?('X')
    puts 'X has won from right to bottom'
  # board Diagonal from left row condition
  when board[0].include?('X') && board[4].include?('X') && board[8].include?('X')
    puts 'X has won diagonally left'
  # board Diagonal from right row condition
  when board[2].include?('X') && board[4].include?('X') && board[6].include?('X')
    puts 'X has won diagonally right'
  else 'No wins'
  end
end

def results_o(board)
  # WIN_COMBINATIONS =>
  #   board[0, 1, 2], # Top
  #   board[3, 4, 5], # Middle Row
  #   board[6, 7, 8], # Bottom Row
  #   board[0, 3, 6], # Left to Bottom Row
  #   board[2, 5, 8], # Right to Bottom Row
  #   board[0, 4, 8], # Diagonal from Left Row
  #   board[2, 4, 6] # Diagonal from Right Row

  case 4.even?
  when board[0...3].all?('O') then puts 'O has won at the top'
  when board[3...6].all?('O') then puts 'O has won in the middle'
  when board[6...9].all?('O') then puts 'O has won at the bottom'
  # board Left to Bottom condition
  when board[0].include?('O') && board[3].include?('O') && board[6].include?('O')
    puts 'O has won from left to bottom'
  # board Right to Bottom condition
  when board[2].include?('O') && board[5].include?('O') && board[8].include?('O')
    puts 'O has won from right to bottom'
  # board Diagonal from left row condition
  when board[0].include?('O') && board[4].include?('O') && board[8].include?('O')
    puts 'O has won diagonally left'
  # board Diagonal from right row condition
  when board[2].include?('O') && board[4].include?('O') && board[6].include?('O')
    puts 'O has won diagonally right'
  else 'No wins'
  end
end

class User1
  attr_accessor :username
  attr_writer :password

  def initialize(username)
    @username = username
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
player1 = User1.new(player1)
# Store this username in a variable
puts player1.info
# Player 1 is now X

puts 'Hello Player 2. Please enter your username here:'
player2 = gets.chomp
player2 = User1.new(player2)
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
while total_moves < 9

  # player_moves1
  puts 'Please enter a number from 1-9'
  number = false
  while number == false
    number = gets.chomp.to_i
    if number.between?(1, 9)
      if board[number - 1].include?('O') || board[number - 1].include?('X')
        puts 'Invalid move - position taken'
      else
        board[number - 1] = 'X'
        display_board(board)
        puts results_x(board)
        player1.your_turn
        number = true
        total_moves += 1
      end
    else
      puts 'Invalid move'
    end
  end

  # player_moves2
  puts 'Please enter a number from 1-9'
  number2 = false
  while number2 == false
    number2 = gets.chomp.to_i
    if number2.between?(1, 9)
      if board[number2 - 1].include?('O') || board[number2 - 1].include?('X')
        puts 'Invalid move - position taken'
      else
        board[number2 - 1] = 'O'
        display_board(board)
        puts results_o(board)
        player2.your_turn
        number2 = true
        total_moves += 1
      end
    else
      puts 'Invalid move'
    end
  end
end
puts 'Game is a draw!'
