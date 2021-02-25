require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'creates an instance of Animal' do
      animal = Animal.new('Hachiko')
      expect(animal).to be_an(Animal)
    end
  end
    
  describe '#name' do
    it 'returns the name of the animal' do
      animal = Animal.new('Hachiko')
      expect(animal.name).to eq('Hachiko')
    end
  end

  describe '::phyla' do
    it 'returns an array of the four animal phyla' do
      phyla = ['worms', 'the kind of molluscs', 'the other wormy stuff', 'the symmetrical ones with the backend']
      expect(Animal.phyla).to eq(phyla)
    end
  end

  describe '#eat' do
    it 'returns a sentence about the food the animal ate' do
      animal = Animal.new('Hachiko')
      expect(animal.eat('salmon')).to eq("Hachiko eats salmon.")
    end
  end
end