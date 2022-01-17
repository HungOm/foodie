Rails.application.routes.draw do

  # resources :orders
  # get 'errors/not_found'
  # get 'errors/internal_server_error'

root to: 'page#home'

# get ':order_id'=> 'orders#order_info'



resources :foods

resources :shipping_addresses,shallow: true do
  resources :line_items do
    resources :orders
  end
end

post '/add_to_cart' => 'carts#add_to_cart', :as => 'add_to_cart' 
post '/test' => 'orders#test', :as => 'order_test' 
patch '/existing_address/:id' => 'shipping_addresses#reuse_address', :as => 'existing_address' 
get '/order_history' => 'line_items#history', :as => 'order_history' 
get '/add_new_address' => 'shipping_addresses#add_new', :as => 'add_new_address' 
post '/create_new_address' => 'shipping_addresses#create_new_address', :as => 'create_new_address' 

get '/search', to: 'foods#search'

  
  devise_for :users
  
  # , :controllers => {:registrations => "registrations"}

  authenticate :user, lambda { |u| u.user_type == "admin" } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  end

  # match "/404", to: "errors#not_found", via: :all
  # match "/500", to: "errors#internal_server_error", via: :all

  # # get '*path' => redirect { |p, req| req.flash[:notice] = "#{if p[:path].split('/')[0] =='admin'
  #   "Redirected: You need to be an admin to acces #{p[:path]} page"

  # else
  # "Uknown path. Redirected to home page"    
  # end}"; '/' }



  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
