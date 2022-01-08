class Order < ApplicationRecord
    enum status: [:pending,:approved, :cancelled]
    after_initialize :set_default_type, :if => :new_record?
    validates :order_datetime,:quantity,:user_id, presence: true
    belongs_to :user
    belongs_to :food
    has_many :line_items  
    has_one :shipping_address



    private
    def set_default_type
      self.status||= :pending
    end

end
