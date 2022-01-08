Rails.application.routes.draw do

  # resources :orders
  # get 'errors/not_found'
  # get 'errors/internal_server_error'

root to: 'page#home'

get ':order_id'=> 'order#order_info'



resources :foods,shallow: true do
  resources :orders do
    resources :shipping_addresses
  end
end

  
  devise_for :users
  
  # , :controllers => {:registrations => "registrations"}

  authenticate :user, lambda { |u| u.user_type == "admin" } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  # get '*path' => redirect { |p, req| req.flash[:notice] = "#{if p[:path].split('/')[0] =='admin'
  #   "Redirected: You need to be an admin to acces #{p[:path]} page"

  # else
  # "Uknown path. Redirected to home page"    
  # end}"; '/' }



  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end