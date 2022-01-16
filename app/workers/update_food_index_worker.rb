class UpdateFoodIndexWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something

        # Do something

        puts "Background work started ..."

        #patch your product model for this job
        # class Food
        #   searchkick text_middle: [:name, :description]
        # end

        # Food.connection
        # args.to_s

    
        # track status of reindex
        Searchkick.redis = Redis.new 
        new_index = Food.reindex(async: true)
        index_name = new_index[:index_name]  

       loop do
          break if Searchkick.reindex_status(index_name)[:completed]
          sleep 60 # every 1 minute
        end

        puts " working ..."
    
        # store in the database for exmaple:
        # Config.create(name: 'use_new_products_index', state: true)
        # or use redis assuming it's your Rails cache
        Rails.cache.write('use_new_food_index', true, expires_in: 1.year)  
        Food.searchkick_index.promote(index_name)
    
  end
end
