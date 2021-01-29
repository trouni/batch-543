class Task
  attr_accessor :title, :description, :done

  def self.find(id)
    result = DB.execute('SELECT * FROM tasks WHERE id = ?', id).first
    # require 'pry-byebug'; binding.pry
    build_task(result) if result
  end

  def self.all
    results = DB.execute('SELECT * FROM tasks')
    results.map do |result|
      build_task(result)
    end
  end

  def initialize(attributes = {})
    @id = attributes[:id] || attributes['id']
    @title = attributes[:title] || attributes['title']
    @description = attributes[:description] || attributes['description']
    @done = attributes[:done] || attributes['done'] || false
  end

  def save
    @id ? update : create
  end

  private

  def self.build_task(result)
    result['done'] = result['done'] == 1
    Task.new(result)
  end

  def create
    query = 'INSERT INTO tasks (title, description) VALUES (?, ?)'
    DB.execute(query, [title, description])
    @id = DB.last_insert_row_id
  end

  def update
    query = 'UPDATE tasks SET title = ?, description = ?, done = ? WHERE ID = ?'
    DB.execute(query, [title, description, done ? 1 : 0, @id])
  end
end
