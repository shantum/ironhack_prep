require 'sinatra'
require 'rspec'
refine ClassName do

end


get '/' do
  'Hello, world!'
end

get '/:name' do
  "Hello, #{params[:name]}!"
end
