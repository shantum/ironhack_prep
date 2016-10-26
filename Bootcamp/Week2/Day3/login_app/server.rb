require "sinatra"
require "sinatra/reloader" if development?
require_relative "lib/user"
enable :sessions

$user_hash = {'shantum' => 'gupta', 'gupta' => 'shantum', 'username' => 'password'}

get '/' do
  erb :login
end

post '/login' do
  session[:username] = params[:user_name]
  session[:password] = params[:password]
  if $user_hash[session[:username]]
    if $user_hash[session[:username]] == session[:password]
      erb :profile
    else erb :failed_login
    end
  else erb :failed_login
  end
end
