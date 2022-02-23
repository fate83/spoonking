Rails.application.routes.draw do
  devise_for :users
  post 'dig', to: 'digging#dig', as: :dig
  post 'convert', to: 'progression#convert_sand', as: :convert_sand
  root "digging#index", as: :dig_site
end
