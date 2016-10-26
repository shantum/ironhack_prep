require "task"

class TodoList
    attr_reader :tasks
    def initialize
        @tasks = []
    end

    def add_task(task)
      @tasks += task.content
    end
end
