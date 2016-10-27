require 'date'

class Post
  attr_reader :text, :title, :date, :id

  @@post_id = 1

  def initialize(content='', date=Date.today, title='Untitled Post')
    @title = title
    self.set_date(date)
    @text = content
    @id = @@post_id
    @@post_id += 1
  end

  def set_date(date)
    if date.is_a?(String); @date = Date.parse(date)
    else @date = date
    end
  end
end
