Rails.application.routes.draw do
  resources :comments
  root "hello#index"
end
