class Food < ApplicationRecord
    enum menu_status: [:draft, :published]
    has_many :orders
    has_many :line_items, through: :orders
    has_many :shipping_addresses, through: :orders, source: :shipping_address
end
