Rails.application.routes.draw do

  get '/about', to: 'pages#about'
  get '/about/author', to: 'pages#author'
end
