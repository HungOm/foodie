module ApplicationHelper


    def format_date(date)

        date.strftime("%I:%M%p - %m/%d/%y")


    end

    def sort_collection(items)
        if items.count==1
            return items
        end
        if items.class =='Array'
          items.order(order_datetime: :desc).first
        else
          items.sort_by(&:order_datetime).reverse.first
        end
        
    end
    
end
