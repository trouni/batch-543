require_relative 'task'

class Controller
  def initialize(view, repository)
    @view = view
    @repository = repository
  end

  def create
    # 1. Ask the user for a title and get the user input
    title = @view.ask_for_title
    # 2. Create a task with the title
    task = Task.new(title)
    # 3. Add that task to the repository
    @repository.add_task(task)
  end
  
  def display_tasks
    print_tasks
  end
  
  def mark_task_as_done
    # 0. Ask the view to display the tasks
    print_tasks
    # 1. Ask the user to pick a task index
    index = @view.ask_for_index
    # 2. Get the task from the repository
    task = @repository.find(index)
    # 3. Mark the task as done
    task.mark_as_done!
  end
  
  private
  
  def print_tasks
    # 1. Get the tasks from the repository
    tasks = @repository.all
    # 2. Ask the view to display the tasks
    @view.print_tasks(tasks)
  end
end