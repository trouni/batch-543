require_relative '../french_ssn'

describe '#french_ssn_info' do
  it "returns 'The number is invalid' when passed an empty string" do
    actual = french_ssn_info("")
    expected = 'The number is invalid'
    expect(actual).to eq(expected)
  end

	it "returns 'A man, born in December, 1985 in Seine-Saint-Denis.' when passed '1 85 12 93 123 456 87'" do
		actual = french_ssn_info('1 85 12 93 123 456 87')
		expected = 'A man, born in December, 1985 in Seine-Saint-Denis.'
		expect(actual).to eq(expected)
	end

	it "returns 'A man, born in December, 1985 in Seine-Saint-Denis.' when passed '1 85 12 93 123 456 87'" do
		actual = french_ssn_info('1 85 12 93 123 456 87')
		expected = 'A man, born in December, 1985 in Seine-Saint-Denis.'
		expect(actual).to eq(expected)
	end

	it "returns 'The number is invalid' when passed '1 85 12 93 123 456 88'" do
		actual = french_ssn_info('1 85 12 93 123 456 88')
		expected = 'The number is invalid'
		expect(actual).to eq(expected)
	end
end