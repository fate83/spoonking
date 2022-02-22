Rails.application.routes.draw do
  devise_for :users
  post 'dig', to: 'digging#dig', as: :dig
  root "digging#index", as: :dig_site
end
