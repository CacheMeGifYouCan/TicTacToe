# spec/board_loop_spec.rb

require_relative '/lib/game_logic'
require_relative '/bin/main'

RSpec.describe BoardLoop do
  describe '#board_loop' do
    it 'class should be BoardLoop' do
      expect(BoardLoop.class).to eql(Class)
    end
  end
end
