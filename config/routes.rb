Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  root to: 'tests#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :badges, only: :index

  resources :feedbacks, only: %i[new create]

  resources :test_passages, only: %i[show update] do
    resource :gist, only: %i[create destroy]
    member do
      get :result
    end
  end

  namespace :admin do
    resources :gists, only: %i[index destroy]
    resources :badges, shallow: true
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

end
