# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'shows#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :shows, only: [:index, :show] do
    post :mark_favorite
    post :remove_favorite
    get :favorites, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
