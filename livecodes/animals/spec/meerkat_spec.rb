require_relative '../meerkat'

describe Meerkat do
  describe '#initialize' do
    it 'creates an instance of Meerkat' do
      meerkat = Meerkat.new('Timon')
      expect(meerkat).to be_an(Meerkat)
    end
  end
    
  describe '#name' do
    it 'returns the name of the Meerkat' do
      meerkat = Meerkat.new('Timon')
      expect(meerkat.name).to eq('Timon')
    end
  end

  describe '#talk' do
    it 'returns the sound a meerkat makes' do
      meerkat = Meerkat.new('Timon')
      expect(meerkat.talk).to eq("Timon barks")
    end
  end
end