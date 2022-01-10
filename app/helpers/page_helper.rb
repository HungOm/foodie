module PageHelper

      # helper 
  def sort_collection(items)
    if items.class =='Array'
      items.order(order_datetime: :desc)
    else
      items.sort_by(&:order_datetime).reverse
    end
    
  end

end
