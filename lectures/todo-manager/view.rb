class View
  def ask_for_title
    puts "What is the title of your task?"
    print "> "
    return gets.chomp
  end

  def print_tasks(tasks)
    puts "-" * 20
    puts "Here is the list of your tasks:"
    tasks.each_with_index do |task, idx|
      puts "#{idx + 1}. [#{task.done? ? 'x' : ' '}] #{task.title}"
    end
    puts "-" * 20
  end

  def ask_for_index
    puts "Which task would you like to mark as done?"
    print "> "
    return gets.chomp.to_i - 1
  end
end