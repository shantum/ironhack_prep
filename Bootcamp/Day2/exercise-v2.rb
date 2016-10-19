require "date"

class Blog

  def initialize
    @blog = []
  end

  def add_post(post)
    post_to_blog = {:date => post.date, :title => post.title, :content => post.content}
    @blog.push post_to_blog
  end

  def publish_blog
    puts @blog
  end

end

class Post
  attr_reader :date, :title, :content

  def initialize(date, title, content)
    @date = Date.parse(date)
    @title = title.capitalize
    @content = content
  end

  def print_post
    puts "Title: #{@title} \nDate: #{@date} \n------------------------- \n#{@content}\n------------------------- \n\n\n"
  end
end

post1 = Post.new("18-05-2014", "Post 1", 'A test blog post by Shantum')
post2 = Post.new("18-09-2015", "Post 2", 'Another test blog post')
post3 = Post.new("17-08-2015", "Post 3", 'the last test blog post')

blog = Blog.new
blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.publish_blog
