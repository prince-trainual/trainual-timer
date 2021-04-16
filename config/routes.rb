Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'time_entries#index'

  resources :time_entries, only: %i[index create edit update]
end
