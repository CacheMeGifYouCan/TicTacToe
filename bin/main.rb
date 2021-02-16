#!/usr/bin/env ruby

# Define board methods. Board should be clear
# Define Winning Combinations
# Create various methods for collecting user data
# Get Player 1 name
# Get Player 2 name
# Assign X to Player 1
# Assign O to Player 2
# Initalise X count to 0
# Initalise O count to 0
# Perform dice roll to decide which player starts
# Take each Players input to make a move
# When one of the winning combinations is matched, player wins
# Print a statement concluding the game result

WIN_COMBINATIONS = [
  # Top
  [0, 1, 2], # Top
  [3, 4, 5], # Middle Row
  [6, 7, 8], # Bottom Row
  [0, 3, 6], # Left to Bottom Row
  [2, 5, 8], # Right to Bottom Row
  [0, 4, 8], # Diagonal from Left Row
  [2, 4, 6] # Diagonal from Right Row
]

def win_result(result)
  if result == WIN_COMBINATIONS[0] || WIN_COMBINATIONS[0]
    puts 'Win Message'
  elsif result == 1
    puts 'Draw Message'
  else
    puts 'Loser Message'
  end
end

def display_board(board)
  puts " #{BOARD[0]} | #{BOARD[1]} | #{BOARD[2]} "
  puts '-----------'
  puts " #{BOARD[3]} | #{BOARD[4]} | #{BOARD[5]} "
  puts '-----------'
  puts " #{BOARD[6]} | #{BOARD[7]} | #{BOARD[8]} "
end

BOARD = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

def game_movements
  total_moves = 0
  while total_moves <= 4
    player_1_index = []
    player_2_index = []

    # player_moves1
    puts 'Please enter a number from 1-9'
    number = false
    while number == false
      number = gets.chomp.to_i
      if number.between?(1, 9)
        BOARD.insert((number - 1), 'X')
        player_1_index << number
        puts display_board(BOARD)
        puts 'Next players turn'
        number = true
        total_moves += 1
      else
        puts 'Enter a valid number'
        number = false
      end
    end

    # player_moves2
    puts 'Please enter a number from 1-9'
    number2 = false
    while number2 == false
      number2 = gets.chomp.to_i
      if BOARD[number2 -1].split.include?(String)
        puts 'Please choose an empty square'
        number2 = false
      elsif number2.between?(1, 9)
        BOARD.insert((number2 - 1), 'O')
        player_1_index << number2
        puts display_board(BOARD)
        puts 'Next players turn'
        number2 = true
        total_moves += 1
      else
        puts 'Enter a valid number, or choose an empty square'
        number2 = false
      end
    end
  end

end

# Section 1 - Printed statements

puts 'Hello Player 1. Please enter your username here:'
player1 = gets.chomp
# Store this username in a variable
puts 'Player 1. You are X'
# Player 1 is now X

puts 'Hello Player 2. Please enter your username here:'
player2 = gets.chomp
# Store this username in a variable
puts 'Player 2. You are O'
# Player 2 is now O

# Players score count is displayed.

puts 'Press enter to roll the dice to decide which Player starts first.'
gets.chomp
# Random number is rolled

puts "#{player1} you may go first."
# Random player is chosen to start the game.

puts game_movements
# Player enters number. The relevant space on the board is filled with X or O

# Show board

puts "#{player2} it is your turn."
# Random player is chosen to start the game.

puts player_moves_2
# Player enters number. The relevant space on the board is filled with X or O

# Show board

# If there is any winning combinations present, the game is concluded

# Then we congratulate the winner. Else print Player... lost.

# If it is a draw, print "It's a draw!"
