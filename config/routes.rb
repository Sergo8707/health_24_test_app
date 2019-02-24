Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :commits, only: :index
  resources :users, only: :update
  resources :import_commits, only:[:new, :create]
  root to: 'import_commits#new'
end
