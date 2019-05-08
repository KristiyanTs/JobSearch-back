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
                 passwords: 'users/passwords'
               }
    devise_scope :user do
      get '/profile', controller: 'users/registrations', action: :show
      put '/profile/update', controller: 'users/registrations', action: :update_profile
    end

    resources :tasks, except: [:show]
    resources :logs, only: [:show, :update]
    resources :notes
  end
end
