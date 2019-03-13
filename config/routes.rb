# frozen_string_literal: true

Rails.application.routes.draw do
  root_path = 'pages#index'
  root to: root_path

  scope ':locale', locale: /#{I18n.available_locales.join('|')}/, defaults: { locale: I18n.locale } do
    root to: root_path

    devise_for :users, controllers: { registrations: 'users/registrations' }
    devise_scope :user do
      get 'users/sign_up/*token', to: 'users/registrations#new'
    end
  end
end
