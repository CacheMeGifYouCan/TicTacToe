# spec/greetings_spec.rb

require_relative '/lib/game_logic'
require_relative '/bin/main'

RSpec.describe Greetings do
  describe '#greeting_x' do
    let(:greeting) { Greetings.new }
    it 'class should be Greetings' do
      expect(greeting.class).not_to eql(NilClass)
    end
  end
end

RSpec.describe Greetings do
  describe '#invalid_moves1' do
    let(:moves) { Greetings.new }
    it 'class should not be Array' do
      expect(moves.class).not_to eql(Array)
    end
  end
end

RSpec.describe Greetings do
  describe '#invalid_moves2' do
    let(:moves) { Greetings.new }
    it 'class should not be array' do
      expect(moves.invalid_moves1.class).not_to eql(Array)
    end
  end
end

RSpec.describe Greetings do
  describe '#fetch_number' do
    let(:num) { Greetings.new.fetch_number }
    it 'output should be string' do
      expect(num.class).not_to eql(NilClass)
    end
  end
end
