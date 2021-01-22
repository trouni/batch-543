class Task
  attr_reader :title

  def initialize(title)
    @title = title # string
    @done = false # boolean
  end

  def mark_as_done!
    @done = true
  end

  def done?
    @done
  end
end