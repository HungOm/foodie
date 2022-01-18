class PageController < ApplicationController

  def home

    if !current_user.nil? && current_user.admin?
      redirect_to rails_admin_path
    end

  if !current_user.nil?
    @foods = Food.limit(12).order('created_at desc')
    # @line_items= User.find(current_user.id).line_items.first(5)
    @line_items = LineItem.where(user_id:current_user.id).order('created_at').last

  else 
    @foods = Food.limit(12).order('created_at desc')
  end


    
  end


end
