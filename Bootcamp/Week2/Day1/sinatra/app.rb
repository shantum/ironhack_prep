require 'sinatra'

class ToDoListApp < Sinatra::Base
    get '/' do
        'Hello, world!'
    end

    get '/:name' do
        "Hello, #{params[:name]}!"
    end
end

class Task
    attr_reader :content, :id
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_at = Time.now
        @updated_at = nil
    end

    def complete?
      return @complete
    end

    def complete!
      @complete = true
    end

    def make_incomplete!
      @complete = false
    end

    def update_content!(string)
      @content = string
      @updated_at = Time.now
    end
end

class TodoList
    attr_reader :tasks
    def initialize
        @tasks = []
    end

    def add_task(task)
      @tasks += task.content
    end


end
