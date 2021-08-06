require_relative '../lib/player.rb'

describe Player do
  subject(:ben) { Player.new('Ben') }
  subject(:hamid) {Player.new('Hamid')}
  describe '#name' do
    it 'returns the name' do
      expect(ben.name).to eq 'Ben'
    end
  end

  describe '#hp' do
    it 'returns the hit points' do
      expect(ben.hp).to eq described_class::DEFAULT_HP
    end
  end

  describe '#attack' do
    it 'damages other player' do
      expect(hamid).to receive(:lose_hp)
      ben.attack(hamid)
    end
  end

  describe '#lose_hp' do
    it 'takes off 10hp when player attacked' do
      expect{hamid.lose_hp}.to change {hamid.hp}.by(-10)
    end
  end
end