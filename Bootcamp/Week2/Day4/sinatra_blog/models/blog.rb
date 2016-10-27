require_relative 'post'
require 'byebug'

class Blog
  attr_reader :posts

  def initialize
    @posts = []
  end

  def add_post(post)
    if post.is_a?(String)
      add_post_string(post)
    else
    @posts << post
    end
  end

  def add_post_string(string)
    @posts << Post.new(string)
  end

  def sort_posts_by_date
    result =  @posts.sort {|x,y| y.date <=> x.date}
    return result
  end

  def get_post_by_id(id)
    post= @posts.find do |x|
      x.id == id
    end
  end

  def print_posts_by_id
    @posts.each do |x|
      print "ID: #{x.id}  "
      puts x.title
    end
  end
end
