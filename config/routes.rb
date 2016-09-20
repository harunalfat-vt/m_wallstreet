Rails.application.routes.draw do
  root to: redirect('/settings')
  resources :settings, only: [:index, :show]
end
