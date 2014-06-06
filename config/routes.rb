Rails.application.routes.draw do
  resources :sites, except: [:new, :edit]
  root to: 'dummy#index'

end
