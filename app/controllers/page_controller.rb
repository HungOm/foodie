class PageController < ApplicationController
  before_action :authenticate_user!
  def home
    if current_user.admin?
      redirect_to rails_admin_path
    end
    @foods = Food.first(10)
    @orders = Order.first(10)
  end

end
