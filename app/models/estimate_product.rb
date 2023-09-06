class EstimateProduct < ApplicationRecord
  with_options presence: true do
    validates :estimate_number
    validates :estimate_date
    validates :estimate_number
    validates :total_price
    validates :ancestry
    validates :quantity
  end

  belongs_to :user

end
