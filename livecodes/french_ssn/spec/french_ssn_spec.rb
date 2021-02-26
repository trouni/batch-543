require_relative '../french_ssn'

describe "#french_ssn_info" do
  it "should return 'The number is invalid' when given an empty string" do
    expected = 'The number is invalid' # The result that we expect
    actual = french_ssn_info("") # The result that we got
    expect(actual).to eq(expected) # We check that they match
  end

  it "should return 'a man, born in December, 1984 in Seine-Maritime.' when given '1 84 12 76 451 089 46'" do
    expected = "a man, born in December, 1984 in Seine-Maritime."
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expect(actual).to eq(expected)
  end

  it "should return 'The number is invalid' when given '1 85 13 93 123 456 75'" do
    expected = "The number is invalid"
    actual = french_ssn_info('1 85 13 93 123 456 75')
    expect(actual).to eq(expected)
  end

  it "should return 'The number is invalid' when given '1 84 12 76 451 089 46'" do
    expected = 'The number is invalid'
    actual = french_ssn_info('1 84 12 76 451 089 23')
    expect(actual).to eq(expected)
  end
end