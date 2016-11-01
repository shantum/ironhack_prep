require 'sinatra'
require_relative 'models/blog'
require_relative 'models/post'
require 'date'
require 'pry'

blog  = Blog.new
post1 = Post.new('Hello! This is a welcome post.', Date.today, 'Your new post')
post2 = Post.new('Hello! This is the 2nd post.', '28-10-2016', 'Your 2nd post')
post3 = Post.new('Hello! This is the 3rd post.', '29-10-2016', 'Your 3rd post')
post4 = Post.new('Hello! This is the latest post.', '30-10-2016', 'Your latest post')
blog.add_post(post1)
blog.add_post(post2)
blog.add_post(post3)
blog.add_post(post4)

get '/' do
  @latest_post = []
  @latest_post[0] = blog.sort_posts_by_date[0]
  @latest_post[1] = blog.sort_posts_by_date[1]
  @latest_post[2] = blog.sort_posts_by_date[2]
  erb :home
end

post '/' do
  date = params[:post_date]
  title = params[:post_title]
  content = params[:post_content]
  new_post = Post.new(content, date, title)
  blog.add_post(new_post)
  redirect('/')
end

get '/posts' do
  erb :home
end

get '/posts/:post_id' do
  id = params[:post_id].to_i
  @post = blog.get_post_by_id(id)
  erb :post_by_id
end

get '/new_post' do
  @default_date = Date.today.strftime('%Y-%m-%d')
  erb :new_post
end
