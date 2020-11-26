Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result # /test_passages/:id/result
    end
  end

  resources :users, only: %i[create]
  get :signup, to: 'users#new'

  resources :sessions, only: %i[create]
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'

end
