class Order < ApplicationRecord
    enum status: [:pending,:approved,:completed, :cancelled]
    validate :greater_than_zero

    after_initialize :set_default_type, :if => :new_record?
    validates :order_datetime,:quantity,:user_id, presence: true
    belongs_to :user
    belongs_to :food
    has_many :line_items ,autosave: true
    has_one :shipping_address






    private
    def set_default_type
      self.status||= :pending
    end


    def greater_than_zero
      if self.quantity <= 0
         self.errors.add(:quantity, " must be greater than zero")
      end
    end


    def default_quantity
      self.quantity ||= 1
    end




end
