require_relative '../warthog'

describe Warthog do
  describe '#initialize' do
    it 'creates an instance of Warthog' do
      warthog = Warthog.new('Pumba')
      expect(warthog).to be_a(Warthog)
    end
  end

  describe '#name' do  
    it 'returns the name of the Warthog' do
      warthog = Warthog.new('Pumba')
      expect(warthog.name).to eq('Pumba')
    end
  end

  describe '#talk' do
    it 'returns the sound a warthog makes' do
      warthog = Warthog.new('Pumba')
      expect(warthog.talk).to eq("Pumba grunts")
    end
  end
end