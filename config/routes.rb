Rails.application.routes.draw do
  namespace :admin do
    root "home#index"
    resources :categories
  end
end
