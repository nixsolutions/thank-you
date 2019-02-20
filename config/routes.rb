# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/sign_up/*token', to: 'users/registrations#new'
  end
  root to: 'pages#index'
end
