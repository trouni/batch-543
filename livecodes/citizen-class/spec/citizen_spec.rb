require_relative "../citizen"

describe Citizen do
  describe '#can_vote?' do
    it 'should return true if the citizen is at least 18 years old' do
      citizen = Citizen.new('Scooter', 'Suzuki', 20)
      actual = citizen.can_vote?
      expect(actual).to eq(true)
    end

    it 'should return false if the citizen is less than 18 years old' do
      citizen = Citizen.new('Scooter', 'Suzuki', 17)
      actual = citizen.can_vote?
      expect(actual).to eq(false)
    end
  end
end