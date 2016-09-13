Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :games do
    member do
      get :vote
    end
    resources :rounds
    resources :user_sessions
    resources :attempts
  end

end
