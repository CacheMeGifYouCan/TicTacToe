#!/usr/bin/env ruby

require_relative './results_x'
require_relative './results_o'

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def game_movements
  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  puts 'Hello Player 1. Please enter your username here:'
  player1 = gets.chomp
  # Store this username in a variable
  puts "Hello #{player1}. You are X"
  # Player 1 is now X

  puts 'Hello Player 2. Please enter your username here:'
  player2 = gets.chomp
  # Store this username in a variable
  puts "Hello #{player2}. You are O"
  # Player 2 is now O

  # Players score count is displayed.

  puts 'Press enter to roll the dice to decide which Player starts first.'
  gets.chomp
  # Random number is rolled

  puts "#{player1} you may go first."
  # Random player is chosen to start the game.

  total_moves = 0
  while total_moves <= 4

    # player_moves1
    puts 'Please enter a number from 1-9'
    number = false
    while number == false
      number = gets.chomp.to_i
      unless board[number - 1].include?('O') || board[number - 1].include?('X')
        if number.between?(1, 9)
          board[number - 1] = 'X'
          puts display_board(board)
          puts results_x(board)
          puts "#{player2}'s turn"
          number = true
          total_moves += 1
        else
          puts 'Enter a valid number'
          number = false
        end
      end
    end

    # player_moves2
    puts 'Please enter a number from 1-9'
    number2 = false
    while number2 == false
      number2 = gets.chomp.to_i
      unless board[number2 - 1].include?('O') || board[number2 - 1].include?('X')
        if number2.between?(1, 9)
          board[number2 - 1] = 'O'
          puts display_board(board)
          puts results_o(board)
          puts "#{player1}'s turn"
          number2 = true
          total_moves += 1
        else
          puts 'Enter a valid number, or choose an empty square'
          number2 = false
        end
      end
    end
  end
end

# Run Game
puts game_movements
