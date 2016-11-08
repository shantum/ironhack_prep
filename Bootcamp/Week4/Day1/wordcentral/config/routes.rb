Rails.application.routes.draw do
  get '/', to: 'site#home'
  get 'new', to: 'text_inspections#new'
  post '/text_inspections', to: 'text_inspections#create'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
