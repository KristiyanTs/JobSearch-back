# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api', defaults: { format: 'json' } do
    devise_for :users,
      defaults: { format: :json },
      path: '',
      path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        confirmations: 'users/confirmations',
        omniauth_callbacks: 'omniauth_callbacks',
      }
    devise_scope :user do
      get '/profile', controller: 'users/registrations', action: :show
      put '/profile/update', controller: 'users/registrations', action: :update_profile
      put '/confirmation' => 'users/confirmations#update'
    end
    resources :users

    get '/profiles/:id', to: 'users#show'
    get '/search', to: 'searches#index'
  end
end
