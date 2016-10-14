Rails.application.routes.draw do
  devise_for :users

  root 'home#show'

  resources :home

  resources :shops do
    get "/items/random", to: "items#random"
   resources :items do
     get "new_sale", to: "items#new_sale"
     post "cancel_sale"
     get "sale_cancelled", to: "items#sale_cancelled"
     resources :charges
   end
   collection { post :import }
 end


 get "/test" => 'shops#test'

end
