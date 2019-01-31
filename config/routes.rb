# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/sign_up/:token', to: 'users/registrations#new'
  root to: 'pages#index'
end
