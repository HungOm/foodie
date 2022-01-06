Rails.application.routes.draw do

  # authenticate :user do
  #   root to: 'page#home', as: :authenticated_root
  # end
  # root to: redirect('/users/sign_in')

  root to: 'page#home'



  get 'order/index'
  get 'order/new'
  resources :food
  devise_for :users
  # devise_for :users, :controllers => {:registrations => "registrations"}

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
