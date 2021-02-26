# spec/board_moves_spec.rb

require_relative '../lib/game_logic'

RSpec.describe BoardMoves do
  describe '#player_moves1' do
    let(:board_moves) { BoardMoves.new }
    let(:board) { MainBoard.new.main_board }
    it 'should have class of BoardMoves' do
      expect(board_moves.class).to eql(BoardMoves)
    end
  end
end

RSpec.describe BoardMoves do
  describe '#player_moves1' do
    let(:board_moves) { BoardMoves.new }
    let(:board) { MainBoard.new.main_board }
    it 'should have class of BoardMoves' do
      expect(board_moves).to_not be(Array)
    end
  end
end

RSpec.describe BoardMoves do
  describe '#player_moves1' do
    let(:board_moves) { BoardMoves.new }
    let(:board) { MainBoard.new.main_board }
    it 'should have class of BoardMoves' do
      expect(board_moves).to_not be(nil)
    end
  end
end
