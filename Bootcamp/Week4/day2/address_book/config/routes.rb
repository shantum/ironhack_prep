Rails.application.routes.draw do
  get 'contacts/index'
  get 'contacts', to: 'contacts#index'
  get 'contacts/new', to: 'contacts#new'
  post '/contacts', to:'contacts#create'
  post '/search', to: 'contacts#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
