class LineItem < ApplicationRecord
    enum status: [:completed, :processing]
    belongs_to :food
    belongs_to :order

end
