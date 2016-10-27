require_relative "../models/blog"
require_relative "../models/post"
require "rspec"
require "rack/test"


describe 'post class' do
  it 'should set the date of a post' do
    post = Post.new('Test Post')
    expect(post.date).to eq(Date.today)
    post.set_date('13-09-2016')
    expect(post.date).to eq(Date.parse('13-09-2016'))
  end

  it 'should create a post with the given date and title' do
    post = Post.new('Test Post', '13-09-1989', 'Test Title')
    expect(post.date).to eq(Date.parse('13-09-1989'))
    expect(post.title).to eq('Test Title')
  end

  it 'should sort the posts by date' do
    blog = Blog.new
    blog.add_post(Post.new('Test Post New', '13-09-2016'))
    blog.add_post(Post.new('Test Post Newer', '13-10-2016'))
    blog.add_post(Post.new('Test Post Newest', '13-11-2016'))
    sorted_blog = blog.sort_posts_by_date
    expect(sorted_blog).to be_a(Array)
    expect(sorted_blog[0].text).to eq('Test Post Newest')
    expect(sorted_blog[1].text).to eq('Test Post Newer')
    expect(sorted_blog[2].text).to eq('Test Post New')
  end

  it 'should return the post with the given id' do
    blog = Blog.new
    post = Post.new('PostID Check', Date.today, 'ID Check')
    id = post.id
    blog.add_post(post)
    expect(blog.get_post_by_id(id).text).to eq('PostID Check')
  end

end
