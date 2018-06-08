AdminPanel::Engine.routes.draw do
  root to: "home#index"

  resources :shippings


  resources :inspirations


  resources :featured_products


  resources :sliders



end
