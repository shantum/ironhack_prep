require_relative "../models/blog"
require_relative "../models/post"
require "rspec"
require "rack/test"
require "date"

describe "blog class" do

  it 'adds a new post_string to the posts array' do
    blog = Blog.new
    blog.add_post('hello')
    expect(blog.posts[0].text).to eq('hello')
    expect(blog.posts[0].title).to eq('Untitled Post')
    expect(blog.posts[0].date).to eq(Date.today)
  end

end
