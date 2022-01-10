class LineItem < ApplicationRecord
  enum status: [:pending,:approved, :completed, :cancelled]

    after_initialize :set_default_type, :if => :new_record?
    belongs_to :food
    belongs_to :order,touch: true



    private
    def set_default_type
      self.status||= :pending
    end
    
  
end
