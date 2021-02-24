# spec/main_spec.rb
require '../lib/game_logic'
require '../bin/main'

board = MainBoard.new
board = board.main_board
board1 = BoardMoves.new
boardloop = BoardLoop.new
boardloop.board_loop(board)

describe BoardMoves do
  describe '.player_moves1' do
    it 'start player 1 loop' do
      expect(board1.player_moves1(board)).to eql(nil)
    end
  end
end

describe User1 do
  describe '.player1_input' do
    it 'returns player1 info' do
      player1 = User1.new(player1, false)
      expect(player1.info).not_to eql(Array)
    end
  end
end

describe User1 do
  describe '.player2_input' do
    it 'returns player2 info' do
      player2 = User1.new(player2, false)
      expect(player2.info).not_to eql(nil)
    end
  end
end

describe User1 do
  describe '.players tests' do
    player1 = User1.new(player1, false)
    let(:player1) do
    end
    it 'should create new user' do
      expect(player1.class).to eql(User1)
    end
  end
end

describe User1 do
  describe '.players tests' do
    player2 = User1.new(player2, false)
    let(:player2) do
    end
    it 'should create new user' do
      expect(player2.class).to eql(User1)
    end
  end
end

describe BoardLoop do
  describe '.player_moves1' do
    let(:board_loop) do
    end
    it 'should be the child class of BoardLoop' do
      expect(boardloop.class).to eql(BoardLoop)
    end
  end
end

describe MainBoard do
  describe '.main_board' do
    let(:board) do
    end
    it 'should output the game board' do
      expect(board.class).not_to eql(nil)
    end
  end
end

describe Greetings do
  describe '.greeting' do
    greeting = Greetings.new
    let(:greeting) do
    end
    it 'class should be Greetings' do
      expect(greeting.class).to eql(Greetings)
    end
  end
end

describe BoardResults do
  describe '.results_simple_x' do
    let(:BoardResults) do
    end
    it 'should output a string' do
      expect(BoardResults.class).not_to eql(NilClass)
    end
  end
end
