Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :scores, only: [:index, :show]
    end
  end
end