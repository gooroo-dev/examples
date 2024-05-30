Rails.application.routes.draw do
  resources  :posts
  root "hello#index"
end
