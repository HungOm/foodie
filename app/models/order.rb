class Order < ApplicationRecord
    # alias_attribute :customer, :user

    belongs_to :user
    has_many :line_items
    has_many :foods, through: :line_items

end
