Homes::Application.routes.draw do
 
   root to: 'addresses#index'

   resources :addresses
 
end
