class EstimateProduct < ApplicationRecord
  with_options presence: true do
    validates :estimate_number, uniqueness: true
    validates :company_name
    validates :total_price
    validates :quantity
  end

  belongs_to :user
  has_ancestry

end
