require_relative '../lion'

describe Lion do
  describe '#initialize' do
    it 'creates an instance of Lion' do
      lion = Lion.new('Simba')
      expect(lion).to be_a(Lion)
    end
  end
    
  describe '#name' do
    it 'returns the name of the Lion' do
      lion = Lion.new('Simba')
      expect(lion.name).to eq('Simba')
    end
  end

  describe '#talk' do
    it 'returns the sound a lion makes' do
      lion = Lion.new('Simba')
      expect(lion.talk).to eq("Simba roars")
    end
  end

  describe '#eat' do
    it 'returns a sentence about the food the lion ate' do
      lion = Lion.new('Simba')
      expect(lion.eat('a gazelle')).to eq("Simba eats a gazelle. Law of the Jungle!")
    end
  end
end