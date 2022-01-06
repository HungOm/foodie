class OrderController < ApplicationController
  def index

    @orders = Order.all

  end

  def new

  end
end
