class LineItem < ApplicationRecord
  enum status: [:pending,:approved, :completed, :cancelled]

    after_initialize :set_default_type, :if => :new_record?
    # belongs_to :food

    has_many :orders,autosave: true
    # belongs_to :shipping_address
    belongs_to :user


    def add_to_cart(order)
      orderdetails = order.slice('food_id','price','quantity')
      order = orders.new(orderdetails)
      order.update(user_id:user_id)
      if order.save
        return 'saved'
      else
        return order.errors
      end
    end


    def total_price
      orders.to_a.sum(&:price)
    end

    before_save :set_price
    def set_price
      self.total_price = orders.pluck(:price).sum
    end


    private
    def set_default_type
      self.status||= :pending
    end
    
  
end
