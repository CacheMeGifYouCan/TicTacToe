# spec/user_spec.rb

require_relative '../bin/main'
require_relative '../lib/game_logic'

describe User1 do
  describe '#player_tests' do
    let(:player1) { User1.new('test', false) }
    it 'should create new user' do
      expect(player1.class).to eql(User1)
    end
  end
end

describe User1 do
  describe '#player_tests2' do
    let(:player1) { User1.new('test', false).info }
    it 'should not return nil' do
      expect(player1.class).not_to eql(NilClass)
    end
  end
end

describe User1 do
  describe '#player_tests2' do
    let(:player1) { User1.new('test', false).info2 }
    it 'should not return nil' do
      expect(player1.class).not_to eql(NilClass)
    end
  end
end

describe User1 do
  describe '#player_tests2' do
    let(:player1) { User1.new('test', false).your_turn }
    it 'should not return nil' do
      expect(player1).not_to eql(nil)
    end
  end
end
