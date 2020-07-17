Rails.application.routes.draw do
  get 'sessions/new'
  get 'audio_files/new'
  get 'users/new'
  get 'audio_files/index'
  get 'audio_files/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "upload_new_audio_file" => "audio_files#new", :as => "upload_new_audio_file"
  get "audio_files" => "audio_files#index", :as => "audio_files"
  get "show" => "audio_files#show", :as => "show"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"
  resources :users
  resources :sessions
  resources :audio_files
end
