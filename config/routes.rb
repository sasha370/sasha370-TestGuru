Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}

  root to: 'tests#index'

  resources :tests, only: :index do
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

  namespace :admin do
    resources :tests
    resources :questions
    resources :answers
  end
end
