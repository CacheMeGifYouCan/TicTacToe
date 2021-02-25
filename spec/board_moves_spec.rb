# spec/board_moves_spec.rb

require_relative '../lib/game_logic'

RSpec.describe BoardMoves do
  describe '#player_moves1' do
    let(:board_moves) { BoardMoves.new.player_moves1(board) }
    let(:board) { MainBoard.new.main_board }
    it 'should have class of BoardResults' do
      expect(board_moves).to eql(nil)
    end
  end
end