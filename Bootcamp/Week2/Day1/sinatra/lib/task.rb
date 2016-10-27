require 'todolist'

class Task
  attr_reader :content, :id, :complete, :updated_at
  @@current_id = 1
  def initialize(content="")
      @content = content
      @id = @@current_id
      @@current_id += 1
      @complete = false
      @created_at = Time.now
      @updated_at = nil
  end

  def complete?
    @complete
  end

  def complete!
    @complete = true
  end

  def make_incomplete!
    @complete = false
  end

  def update_content!(string)
    @content = string.to_s
    @updated_at = Time.now
  end


end
