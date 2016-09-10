Rails.application.routes.draw do
  devise_for :users

  root 'home#show'

  resources :home
  resources :reviews do
end
  resources :shops do
   resources :items do
     member do
     post 'create_review' => 'items#create_review'
   end
     resources :charges
   end
   collection { post :import }
 end



 get "/test" => 'shops#test'

end
