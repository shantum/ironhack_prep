require_relative "lib/task.rb"
require_relative "app"
require_relative "lib/todolist"
require "guard"
require 'byebug'

describe Task do
  it 'should return a boolean value from complete?' do
    task = Task.new
    expect(task.complete?).to eq(false)
  end

  it "should mark an incomplete task as complete" do
    task = Task.new
    task.complete!
    expect(task.complete).to eq(true)
  end

  it 'should mark a complete task as incomplete' do
    task = Task.new
    task.complete!
    expect(task.complete?).to eq(true)
    task.make_incomplete!
    expect(task.complete?).to eq(false)
  end

  it 'should update the content of a string and post updated time' do
    allow(Time).to receive(:now).and_return(@time_now)
    task = Task.new('Hello')
    expect(task.content).to eq('Hello')
    expect(task.updated_at).to eq(nil)
    task.update_content!('HelloHello')
    expect(task.content).to eq('HelloHello')
    expect(task.updated_at).to eq(@time_now)
  end
end


describe TodoList do
  it "should create a new task and push it to tasks array" do
    list = TodoList.new
    list.add_task('Hello')
    expect(list.tasks.include?('Hello')).to eq(true)
    task = Task.new('Hello Again!')
    list.add_task(task)
    expect(list.tasks.include?('Hello Again!')).to eq(true)
  end

  it "should delete the task with a given id" do
    list = TodoList.new
    task = Task.new("Test")
    list.add_task(task)
    id   = task.id
    expect(list.tasks[0]).to eq("Test")
    list.delete_task_id(id)
    expect(list.tasks[0]).to be(nil)
  end


end
