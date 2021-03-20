Rails.application.routes.draw do
  get 'address_coordinates', to: 'addresses#coordinates'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
