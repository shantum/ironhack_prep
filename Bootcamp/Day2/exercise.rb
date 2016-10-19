require 'date'

class Blog
  def initialize
    @blog = []
  end

  def add_post(post)
    post = {:date => post.date, :title => post.title, :content => post.content, :sponsored => post.sponsored}
    if post[:sponsored] == true
      post[:title] = "********#{post[:title]}***********"
    else post[:title] = post[:title]
    end
    @blog.push post
    # title = post.title
    # content = post.content
    # date = post.date
    # @blog.push ["TITLE: #{title} DATE: #{date} \n#{content} \n-------------------"]
  end

  def publish_front_page
    sorted_blog = @blog.sort {|x, y| x[:date] <=> y[:date]}
    i=0
    for i in sorted_blog[i] do
      puts [:title]
      i += 1
    end


      puts [:title]
    # sorted_blog.each do |x|
    #   puts "Title: #{x[:title]} \nDate: #{x[:date]} \n------------------------- \n#{x[:content]}\n------------------------- \n\n\n"
    #   i += 1
      # if i == page_limit
      #   puts "Please enter next to go to the next page or prev for the previous page:"
      #   input= gets.chomp
      #   if input == 'next'
      #     self.publish_front_page
      # end
      # end
    # end

  end
end

class Post
  attr_accessor :content, :title, :date, :sponsored

  def initialize(date, title, content, sponsored=false)
    @date = Date.parse(date.to_s)
    @title = title.capitalize
    @content = content
    @sponsored = sponsored
  end

end

post1 = Post.new("18-05-2014", "Post 1", 'A test blog post by Shantum')
post2 = Post.new("18-09-2015", "Post 2", 'Another test blog post', true)
post3 = Post.new("17-08-2015", "Post 3", 'the last test blog post')

blog = Blog.new

blog.add_post(post1)

blog.add_post(post2)

blog.add_post(post3)

blog.publish_front_page
