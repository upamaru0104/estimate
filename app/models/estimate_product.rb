class EstimateProduct < ApplicationRecord
  with_options presence: true do
    validates :estimate_number, uniqueness: true
    validates :estimate_date
    validates :company_name
    validates :total_price
    validates :ancestry
    validates :quantity
  end

  belongs_to :user

end
