class Repository
  def initialize
    @tasks = []
  end

  def add_task(task) # task is an INSTANCE of Task
    @tasks << task
  end

  def all
    @tasks
  end

  def find(index)
    @tasks[index]
  end
end