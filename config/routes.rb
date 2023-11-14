# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/") to:
  # root "articles#index"
  root 'games#index'
  get '/new', to: 'games#new'
  get '/score', to: 'games#score'
  post '/score', to: 'games#score'
end
