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


    def relative_time(start_time)
      diff_seconds = (Time.now - start_time).round
      case diff_seconds
        when 0 .. 59
          return "#{diff_seconds} seconds ago"
        when 60 .. (3600-1)
          return "#{(diff_seconds/60)} minutes ago"
        when 3600 .. (3600*24-1)
          return "#{(diff_seconds/3600)} hours ago"
        when (3600*24) .. (3600*24*30) 
          return "#{diff_seconds/(3600*24)} days ago"
        else
          return start_time.strftime("%m/%d/%Y")
      end
    end
    
end
