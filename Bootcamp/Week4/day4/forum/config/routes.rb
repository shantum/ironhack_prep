Rails.application.routes.draw do
  resources :movies
  root 'movies#search'
  get '/search', to: 'movies#search'
  post '/search', to: 'movies#find'
  post '/movies/new', to: 'movies#add'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
