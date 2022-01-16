class PageController < ApplicationController

  def home

    if !current_user.nil? && current_user.admin?
      redirect_to rails_admin_path
    end

  if !current_user.nil?
    @foods = Food.limit(5).order('created_at desc')
    # @line_items= User.find(current_user.id).line_items.first(5)
    @line_items = LineItem.order("created_at").last(5)


  else 
    @foods = Food.limit(5).order('created_at desc')
    @line_items = LineItem.order("created_at").last(5)
  end


    
  end


end
