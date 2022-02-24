Rails.application.routes.draw do
  devise_for :users
  post 'dig', to: 'digging#dig', as: :dig
  post 'convert', to: 'progression#convert_sand', as: :convert_sand
  post 'level_up', to: 'progression#level_up', as: :level_up
  post 'upgrade_equipment', to: 'equipments#upgrade', as: :upgrade_equipment
  root "digging#index", as: :dig_site
end
