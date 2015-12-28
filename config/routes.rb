Rails.application.routes.draw do
  root 'gifts#index'

  resources :gifts, :only => [:index, :create]
end
