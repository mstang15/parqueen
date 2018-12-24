Rails.application.routes.draw do

  root 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/home', to: 'home#show'
  get '/parking', to: "parking#show", as: 'parking'
  get '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      get 'parking', to: 'parking#show'
      post '/parking', to: 'parking#create'
    end
  end
end
