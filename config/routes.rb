# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api', defaults: { format: 'json' } do
    devise_for :users,
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
        confirmations: 'users/confirmations'
      }
    devise_scope :user do
      get '/profile', controller: 'users/registrations', action: :show
      put '/profile/update', controller: 'users/registrations', action: :update_profile
      put '/confirmation' => 'users/confirmations#update'
    end

    resources :interests
    resources :groups do
      resources :memberships
    end
    resources :payments
    resources :users
    resources :absences, only: [:index, :create]
    resources :lessons do
      post 'create_weekly'
    end
    resources :votes
    resources :bugs
    resources :pricings
    resources :locations
  end
end
