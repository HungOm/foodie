class PageController < ApplicationController
  def home
    if !current_user.nil? && current_user.admin?
      redirect_to rails_admin_path
    end

  if !current_user.nil?
    @foods = Food.limit(5).order('created_at desc')
    @orders = User.find(current_user.id).orders.first(5)
  else 

    @foods = Food.limit(5).order('created_at desc')
    @orders = Order.limit(5).order('id desc')

  end

    
  end


end
