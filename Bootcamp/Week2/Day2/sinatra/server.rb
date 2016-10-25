require 'sinatra'
require 'sinatra/reloader' if development?
require 'artii'

get '/' do
    'Hi there!'
end

get '/profile/:user' do
    @user = params[:user]
    erb :profile
end

get '/about' do
    @name = 'Shantum'
    erb :about
end

get '/:user' do
    params[:user]
end

get '/ascii/:word/?:option?' do
    artii = Artii::Base.new
    if params[:option]
      artii = Artii::Base.new :font => params[:option]
    end
    @art = artii.asciify(params[:word])
    erb :ascii
end
