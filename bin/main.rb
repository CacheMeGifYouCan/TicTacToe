#!/usr/bin/env ruby

require_relative '../lib/game_logic'

class MainBoard
  attr_reader :game_board

  def main_board
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
end

board = MainBoard.new
board = board.main_board

def display_board(board)
  puts
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts
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
    puts '
Invalid move - position taken'
    puts
  end

  def invalid_moves2
    puts '
Invalid move'
    puts
  end

  def valid_moves
    puts '
    Valid move
    '
  end

  def fetch_number
    gets.chomp.to_i
  end
end

def win_check(board)
  board_results = BoardResults.new
  if board_results.results_simple_x(board) == 'Game Won!'
    puts 'Game won!'
  elsif board_results.results_simple_o(board) == 'Game Won!'
    puts 'Game won!'
  elsif board_results.results_advanced1(board) == 'Game Won Down The Left/Right Column!'
    puts 'Wow! Game Won!'
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

puts "#{player1.username} you may go first.

"

boardloop = BoardLoop.new
boardloop.board_loop(board)
win_check(board)
