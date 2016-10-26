require_relative "lib/task"
require_relative "app"
require_relative "lib/todolist"

describe Task do
  it "should mark an incomplete task as complete" do
    @task = Task.new
    @task.complete!
    expect(@task.complete).to eq(true)
  end
end
