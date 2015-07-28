Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
  resources :users
  resources :visitors
  get '/records/history', to: 'records#history', as: :records_history
  resources :records
end
