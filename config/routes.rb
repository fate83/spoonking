Rails.application.routes.draw do
  post 'dig', to: 'digging#dig', as: :dig
  root "digging#index", as: :dig_site
end
