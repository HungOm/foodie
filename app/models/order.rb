class Order < ApplicationRecord
    enum status: [:pending,:approved,:completed, :cancelled]
    before_commit :greater_than_zero

    after_initialize :set_default_type, :if => :new_record?
    validates :quantity,:user_id, presence: true
    # validates :food_id,presence: true
    belongs_to :user
    belongs_to :food
    belongs_to :line_item, touch: true
    # has_many :foods



    private
    def set_default_type
      self.status||= :pending
    end


    def greater_than_zero
      if self.quantity <= 0
         self.errors.add(:quantity, " must be greater than zero")
      end
    end

    before_save :set_price
    def set_price
      self.price = food.price * quantity
    end


    def default_quantity
      self.quantity ||= 1
    end


    




end
