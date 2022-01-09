class PageController < ApplicationController
  before_action :authenticate_user!
  def home
    if current_user.admin?
      redirect_to rails_admin_path
    end
    @foods = Food.first(10)
    @orders = User.find(current_user.id).orders
    
  end

end
