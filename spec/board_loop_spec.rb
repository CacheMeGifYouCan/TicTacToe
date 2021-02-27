# spec/board_loop_spec.rb

require_relative '../lib/game_logic'

RSpec.describe BoardLoop do
  describe '#board_loop' do
    it 'class should be BoardLoop' do
      expect(BoardLoop.class).to eql(Class)
    end
    it 'class should be BoardLoop' do
      expect(BoardLoop.class).to_not be(String)
    end
  end
end
