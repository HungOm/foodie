# require 'elasticsearch/model'
class Food < ApplicationRecord
    # include Searchable
    # include Indexable
    # include Elasticsearch::Model
    # include Elasticsearch::Model::Callbacks
    # searchkick callbacks: :async,
    # word_start: [:name, :description]
    enum menu_status: [:draft, :published]
    validates :name,presence: true
    validates :description,presence: true


    def self.use_new_index?
        # Config.find_by(name: 'use_new_food_index').try(:state)
        # or use Rails/redis cachea
        Rails.cache.read('use_new_food_index')
    end
        # use the config data to make the model backward compatable until
        # the new index is ready.  Later you'll remove this in a cleanup deploy.
    if Food.use_new_index?
        searchkick word_start: [:name]
    else
        searchkick callbacks: :async,word_start: [:name]
    end

    def search_data
        {
          name: name,
          description: description,
          menu_status: published?,
          ingredients: ingredients
        }
    end


    



end
