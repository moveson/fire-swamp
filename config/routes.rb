# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  devise_scope :user do
    authenticated :user do
      root "welcome#index", as: :authenticated_root
    end

    unauthenticated do
      root "users/sessions#new", as: :unauthenticated_root
    end

    get "active" => "users/sessions#active"
    get "timeout" => "users/sessions#timeout"
  end

  resources :pages, only: :show
  resources :messages
end
