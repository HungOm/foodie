class ShippingAddress < ApplicationRecord
    validates :address_name,:address_city,:address_line1, presence: true
    # has_many :orders, class_name: "Order", foreign_key: "shipping_address_id"
    # has_one:order,class_name: "Order",foreign_key: "order_id"
    # has_many :orders, class_name:"Order", :foreign_key =>:shipping_address_id

    # has_many :foods
    # , through: :order
    belongs_to :order
    # has_one :order
    # belongs_to :users



end
