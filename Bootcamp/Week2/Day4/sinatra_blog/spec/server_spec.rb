require_relative "../server.rb"
require "rspec"
require "rack/test"

describe "My Blog App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'returns the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'opens the new post page' do
    get '/new_post'
    expect(last_response).to be_ok
  end

  # it 'submits a post and links back to updated home page' do
  #   post '/'
  #   expect(last_response).to be_ok
  # end
  #


end