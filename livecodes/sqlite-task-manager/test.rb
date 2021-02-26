require 'sqlite3'
DB = SQLite3::Database.new('tasks.db')
DB.results_as_hash = true
require_relative 'task'

# 1. Implement the READ logic to find a given task (by its id)
# Class method ::find

task = Task.find(1)
p task

# 2. Implement the CREATE logic in a save instance method
# Instance method #save

new_task = Task.new(title: 'Do the laundry', description: 'Pretty obvious')
new_task.save
p Task.find(DB.last_insert_row_id)

# 3. Implement the UPDATE logic in the same method

task = Task.find(1)
puts "Task is #{task.done ? 'done!' : 'not done yet...'}"
puts 'Doing task...'
task.done = true
task.save
puts "Task is #{task.done ? 'done!' : 'not done yet...'}"
