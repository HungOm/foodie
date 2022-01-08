class LineItem < ApplicationRecord
    enum status: [:completed, :processing]
    after_initialize :set_default_type, :if => :new_record?
    belongs_to :food
    belongs_to :order



    private
    def set_default_type
      self.status||= :processing
    end
  
end
