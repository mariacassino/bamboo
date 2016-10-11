Rails.application.routes.draw do
  devise_for :users

  root 'home#show'

  resources :home

  resources :shops do
   resources :items do
     resources :charges
   end
   collection { post :import }
 end


 get "/test" => 'shops#test'

end
