require "pry-byebug"

def full_name(first_name, last_name)
  binding.pry
  fname = first_name.capitalize
  lname = last_name.capitalize
  return "#{fname} #{lname}"
end

p full_name("Yann", "klEIN")

# 1. require "pry-byebug"
# 2. add binding.pry
# 3. inspect in the terminal and use 'next' or 'continue'
# 4. remove require and binding.pry before committing