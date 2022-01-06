class PageController < ApplicationController
  before_action :authenticate_user!
  def home
    @foods = Food.first(10)
    @orders = Order.first(10)
  end
end
