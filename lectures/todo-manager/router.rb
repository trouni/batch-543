class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      puts "=" * 20
      puts "What would you like to do?"
      puts "1. Display tasks"
      puts "2. Add a task"
      puts "3. Mark a task as done"
      puts "0. Exit"
      print "> "
      action = gets.chomp.to_i
      case action
      when 1 then @controller.display_tasks
      when 2 then @controller.create
      when 3 then @controller.mark_task_as_done
      when 0 then break
      else
        puts "Please choose between 1, 2 or 3."
      end
    end
    puts "Thanks for using the task manager!"
  end
end