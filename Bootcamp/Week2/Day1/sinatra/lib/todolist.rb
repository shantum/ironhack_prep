require "task"

class TodoList
  attr_reader :tasks
  def initialize
      @tasks = []
  end

  def add_task(task)
    if task.is_a?(String)
    new_task = Task.new(task.to_s)
      else new_task = task
    end
    @tasks += {:id => new_task.id, :content => new_task.content.to_s
  end

  def delete_task_id(id)
    task_id = id.to_i
    @tasks.each do |x|
      if x.id == task_id
        @tasks.delete(x)
      end
    end
  end



end
