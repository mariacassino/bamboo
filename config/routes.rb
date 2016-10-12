Rails.application.routes.draw do
  devise_for :users

  root 'home#show'

  resources :home

  resources :shops do
    get "/items/random", to: "items#random"
   resources :items do
     get "new_sale", to: "items#new_sale"
     resources :charges
   end
   collection { post :import }
 end


 get "/test" => 'shops#test'

end
