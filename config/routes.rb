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

    namespace :users do
      resources :invitations, only: [:index, :update]
      resources :projects, only: [:index, :create, :update, :destroy]
      resources :favorites, only: [:index, :create, :destroy]
    end

    resources :nodes do
      resources :statuses, only: [:index, :create, :update, :destroy]
      resources :categories, only: [:index, :create, :update, :destroy]
      resources :roles, only: [:index, :create, :update, :destroy]
      resources :invitations, only: [:index, :create, :destroy]
      resources :memberships, only: [:index, :update, :destroy]
      resources :comments, only: [:index, :create, :update, :destroy]
    end
  end
end
