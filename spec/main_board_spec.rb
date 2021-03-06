# spec/main_board_spec.rb

require_relative '../lib/game_logic'

RSpec.describe MainBoard do
  describe '#main_board' do
    let(:board) { MainBoard.new.main_board }
    it 'returns the board' do
      expect(board.class).to eql(Array)
    end
    it 'returns the board' do
      expect(board.class).to_not be(NilClass)
    end
  end
end
