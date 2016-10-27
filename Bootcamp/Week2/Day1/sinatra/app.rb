require 'sinatra'
require 'rspec'

get '/' do
  'Hello, world!'
end

get '/:name' do
  "Hello, #{params[:name]}!"
end
