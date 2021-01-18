require 'date'
require 'yaml'

SSL_PATTERN = /^(?<gender>[1-2])\s?(?<year>\d{2})\s?(?<month>0[1-9]|1[0-2])\s?(?<department>\d{2})\s?\d{3}\s?\d{3}\s?(?<key>\d{2})$/

def french_ssn_info(ssn)
  match_data = ssn.match(SSL_PATTERN)

  if match_data && key_valid?(ssn, match_data[:key])
    gender = match_data[:gender].to_i == 1 ? 'man' : 'woman'
    # Date::MONTHNAMES returns an array with all the month names
    month = Date::MONTHNAMES[match_data[:month].to_i]
    year = match_data[:year]
    # match_data[:department] is the department code, but we need the name
    department = department_name(match_data[:department])
    "a #{gender}, born in #{month}, 19#{year} in #{department}."
  else
    'The number is invalid'
  end
end

def department_name(code)
  # Gives the department's name based on the code
  departments_hash = YAML.load_file('data/french_departments.yml') # returns a hash
  departments_hash[code]
end

def key_valid?(ssn, key)
  # We need to get the SSN without the last two digits
  # i.e go from "2 99 02 75 432 234 38" to 2990275432234
  ssn_without_key = ssn.delete(' ')[0...-2].to_i
  (97 - ssn_without_key) % 97 == key.to_i
end
