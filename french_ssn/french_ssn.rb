require 'date'
require 'yaml'

SSN_PATTERN = /^(?<gender>[12])\s?(?<year>\d{2})\s?(?<month>\d{2})\s?(?<department>\d{2}|2[AB])\s?\d{3}\s?\d{3}\s?(?<key>\d{2})$/

def french_ssn_info(ssn)
  match_data = ssn.match(SSN_PATTERN)

  if match_data && key_valid?(ssn, match_data[:key])
    gender = match_data[:gender].to_i == 1 ? 'man' : 'woman'
    month = Date::MONTHNAMES[match_data[:month].to_i]
    year = match_data[:year]
    department = department(match_data[:department])
    return "A #{gender}, born in #{month}, 19#{year} in #{department}."
  else
    return 'The number is invalid'
  end
end

def department(code)
  YAML.load_file('data/french_departments.yml')[code]
end

def key_valid?(ssn, key)
  ssn_without_key = ssn.delete(' ')[0...-2]
  return (97 - ssn_without_key.to_i) % 97 == key.to_i
end